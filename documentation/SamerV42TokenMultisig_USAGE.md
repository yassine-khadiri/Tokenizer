# Multisig SamerV42Token Usage Guide

This document provides instructions on how to interact with the multisignature version of the SamerV42Token using Remix IDE.

## Contract Overview

The multisig implementation requires multiple approvals before any token transfer can be executed. All tokens are initially minted to the contract itself, and transfers must go through a multi-step approval process.

## Contract Setup Information

### Checking Basic Configuration

1. Call `owners(index)` to view each owner address (start from index 0)
2. Call `isOwner(address)` to check if a specific address is an owner
3. Call `numConfirmationsRequired` to see how many approvals are needed for transfers
4. Call `totalSupply()` to confirm the total supply (1337 * 10^18)

### Token Balances

1. Call `balanceOf(address(this))` to view the contract's token balance (initially all tokens)
2. Call `balanceOf(address)` to check any address's token balance

## Transfer Process (Owners Only)

The transfer process consists of three steps: submission, confirmation, and execution.

### Step 1: Submit a Transfer Request

Only owners can submit transfer requests:

1. Connect to Remix with an owner's address
2. Find the `submitTransfer` function
3. Enter:
   - `to`: Recipient address
   - `amount`: Amount to transfer (in wei)
     - Example: To send 10 tokens, enter: 10000000000000000000
4. Click "transact"
5. Confirm the transaction in MetaMask

After submission:
- Note the transaction index from the emitted event (in the logs)
- Alternatively, the index is usually (`transactions.length - 1`)

### Step 2: Gather Confirmations

Each owner must separately confirm the transaction:

1. Connect with each owner's address one by one
2. Find the `confirmTransfer` function
3. Enter the `_txIndex` from Step 1
4. Click "transact"
5. Confirm in MetaMask

To check confirmation status:
- Call `isConfirmed(_txIndex, ownerAddress)` which returns true if that owner has confirmed
- Call `transactions(_txIndex)` to see the current confirmation count

### Step 3: Execute the Transfer

Once enough confirmations are gathered:

1. Connect with any owner's address
2. Find the `executeTransfer` function
3. Enter the same `_txIndex`
4. Click "transact"
5. Confirm in MetaMask

After execution:
- The tokens will move from the contract to the recipient
- `transactions(_txIndex).executed` will return `true`
- The recipient's balance will increase

## Viewing Transactions

To check the details of any transaction:

1. Call `transactions(index)` with the transaction index
2. This returns:
   - `to`: Recipient address
   - `amount`: Transfer amount (in wei)
   - `executed`: Boolean indicating if the transfer was executed
   - `numConfirmations`: Number of confirmations received so far

## Event Monitoring

The contract emits events that can be monitored:

### Submit Transaction Events

After submitting a transfer:
1. Check the transaction logs
2. Find the `SubmitTransaction` event with:
   - `owner`: Address that submitted the transaction
   - `txIndex`: Index of the new transaction
   - `to`: Recipient address
   - `amount`: Amount to transfer

### Confirmation Events

After each confirmation:
1. Check the transaction logs
2. Find the `ConfirmTransaction` event with:
   - `owner`: Address that confirmed
   - `txIndex`: Index of the confirmed transaction

### Execution Events

After execution:
1. Check the transaction logs
2. Find the `ExecuteTransaction` event with:
   - `owner`: Address that executed the transaction
   - `txIndex`: Index of the executed transaction

## Common Error Scenarios

### Not an Owner

Error message: "Caller is not an owner"
- Solution: Switch to an address that was defined as an owner during contract deployment

### Transaction Doesn't Exist

Error message: "Transaction does not exist"
- Solution: Verify the transaction index is correct and within range

### Already Executed

Error message: "Transaction already executed"
- Solution: This transaction has already been processed and cannot be confirmed or executed again

### Already Confirmed

Error message: "Transaction already confirmed"
- Solution: Each owner can only confirm once; this owner has already confirmed

### Insufficient Confirmations

Error message: "Insufficient confirmations"
- Solution: Wait for more owners to confirm until the required threshold is reached

## Walkthrough Example

Here's a complete example with 3 owners and 2 required confirmations:

1. **Initial Setup**:
   - Contract deployed with owners A, B, and C
   - Required confirmations: 2
   - All 1337 tokens are in the contract

2. **Submit Transfer**:
   - Owner A submits a transfer of 100 tokens to address X
   - Transaction index: 0
   - Event: SubmitTransaction(A, 0, X, 100000000000000000000)

3. **Confirmations**:
   - Owner A confirms: confirmTransfer(0)
   - Event: ConfirmTransaction(A, 0)
   - Owner B confirms: confirmTransfer(0)
   - Event: ConfirmTransaction(B, 0)
   - Now 2/3 owners have confirmed (threshold reached)

4. **Execute Transfer**:
   - Any owner executes: executeTransfer(0)
   - Event: ExecuteTransaction(executor, 0)
   - 100 tokens are transferred from contract to address X

5. **Verification**:
   - balanceOf(X) returns 100000000000000000000
   - transactions(0).executed returns true