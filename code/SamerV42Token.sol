// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract SamerV42Token is ERC20, Ownable {

    uint256 public constant MAX_SUPPLY = 1337 * 10**18;
    uint256 public constant INITIAL_SUPPLY = 1000 * 10**18;

    constructor() ERC20("SamerV42", "SV42") Ownable(msg.sender) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

     // Only owner can mint
    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be positive");
        require(totalSupply() + amount <= MAX_SUPPLY, "Exceeds max supply");
        _mint(to, amount);
    }
}