// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title SamerV42Token - An ERC20 token with multisignature (multisig) transfer control.
 * @dev This contract extends ERC20 and requires multiple approvals for token transfers.
 */
contract SamerV42Token is ERC20 {
    // ========== TOKEN CONFIGURATION ==========
    uint256 public constant INITIAL_SUPPLY = 1337 * 10**18; // Initial supply: 1337 tokens (18 decimals)

    // ========== MULTISIG VARIABLES ==========
    address[] public owners;                      // List of multisig owners
    mapping(address => bool) public isOwner;      // Tracks if an address is an owner
    uint public numConfirmationsRequired;         // Minimum confirmations needed to execute a transfer

    // Transaction structure for pending transfers
    struct Transaction {
        address to;             // Recipient address
        uint256 amount;         // Amount to transfer
        bool executed;          // True if already executed
        uint numConfirmations;   // Current number of confirmations
    }

    // Mapping to track which owners confirmed which transactions
    mapping(uint => mapping(address => bool)) public isConfirmed;
    Transaction[] public transactions;           // List of pending transactions

    // ========== EVENTS ==========
    event SubmitTransaction(
        address indexed owner,
        uint indexed txIndex,
        address indexed to,
        uint256 amount
    );
    event ConfirmTransaction(address indexed owner, uint indexed txIndex);
    event ExecuteTransaction(address indexed owner, uint indexed txIndex);

    // ========== CONSTRUCTOR ==========
    /**
     * @dev Initializes the token and multisig system.
     * @param _owners List of addresses who can approve transfers.
     * @param _numConfirmationsRequired Minimum confirmations needed to execute a transfer.
     */
    constructor(address[] memory _owners, uint _numConfirmationsRequired) 
        ERC20("SamerV42", "SV42") 
    {
        require(_owners.length > 0, "At least 1 owner required");
        require(
            _numConfirmationsRequired > 0 &&
            _numConfirmationsRequired <= _owners.length,
            "Invalid confirmations requirement"
        );

        // Set up owners
        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), "Invalid owner address");
            require(!isOwner[owner], "Duplicate owner detected");

            isOwner[owner] = true;
            owners.push(owner);
        }

        numConfirmationsRequired = _numConfirmationsRequired;
        _mint(address(this), INITIAL_SUPPLY); // Mint all tokens to the contract (not to an individual)
    }

    // ========== MULTISIG FUNCTIONS ==========

    /**
     * @dev Submits a new transfer proposal.
     * @param to Recipient address.
     * @param amount Amount of tokens to transfer.
     */
    function submitTransfer(address to, uint256 amount) public onlyOwner {
        uint txIndex = transactions.length;
        transactions.push(Transaction({
            to: to,
            amount: amount,
            executed: false,
            numConfirmations: 0
        }));

        emit SubmitTransaction(msg.sender, txIndex, to, amount);
    }

    /**
     * @dev Approves a pending transfer.
     * @param _txIndex Index of the transaction to confirm.
     */
    function confirmTransfer(uint _txIndex) 
        public 
        onlyOwner 
        txExists(_txIndex) 
        notExecuted(_txIndex) 
        notConfirmed(_txIndex) 
    {
        Transaction storage transaction = transactions[_txIndex];
        transaction.numConfirmations += 1;
        isConfirmed[_txIndex][msg.sender] = true;

        emit ConfirmTransaction(msg.sender, _txIndex);
    }

    /**
     * @dev Executes a transfer after enough confirmations.
     * @param _txIndex Index of the transaction to execute.
     */
    function executeTransfer(uint _txIndex) 
        public 
        onlyOwner 
        txExists(_txIndex) 
        notExecuted(_txIndex) 
    {
        Transaction storage transaction = transactions[_txIndex];
        require(
            transaction.numConfirmations >= numConfirmationsRequired,
            "Insufficient confirmations"
        );

        transaction.executed = true;
        _transfer(address(this), transaction.to, transaction.amount); // ERC20 transfer

        emit ExecuteTransaction(msg.sender, _txIndex);
    }

    // ========== MODIFIERS ==========
    modifier onlyOwner() {
        require(isOwner[msg.sender], "Caller is not an owner");
        _;
    }

    modifier txExists(uint _txIndex) {
        require(_txIndex < transactions.length, "Transaction does not exist");
        _;
    }

    modifier notExecuted(uint _txIndex) {
        require(!transactions[_txIndex].executed, "Transaction already executed");
        _;
    }

    modifier notConfirmed(uint _txIndex) {
        require(!isConfirmed[_txIndex][msg.sender], "Transaction already confirmed");
        _;
    }
}