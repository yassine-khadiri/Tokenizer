# Basic SamerV42Token Usage Guide

This document provides instructions on how to interact with the basic version of the SamerV42Token using Remix IDE.

## Accessing Your Deployed Contract

1. In Remix, navigate to the "Deploy & Run Transactions" tab
2. Under "Deployed Contracts", find your SamerV42Token contract
3. If you don't see it, paste the contract address in "Load contract from Address" and click "At Address"

## Reading Token Information

### Basic Token Details

1. In the deployed contract interface, click the following read functions:
   - `name()` - Returns "SamerV42"
   - `symbol()` - Returns "SV42"
   - `decimals()` - Returns 18
   - `totalSupply()` - Returns 1337000000000000000000 (1337 tokens with 18 decimals)

### Checking Balances

1. Find the `balanceOf` function in the contract interface
2. Enter an address to check (e.g., your wallet address)
3. Click "call"
4. The result shows the balance in wei (divide by 10^18 to get the token amount)

## Transferring Tokens

### Simple Transfer

1. Find the `transfer` function
2. Enter the following parameters:
   - `to`: The recipient's address
   - `amount`: The number of tokens to send (in wei)
     - Example: To send 10 tokens, enter: 10000000000000000000
3. Click "transact"
4. Confirm the transaction in MetaMask

### Checking Transfer Results

1. After the transaction is confirmed, use `balanceOf` to verify:
   - Your new balance (should be reduced by the transferred amount)
   - The recipient's balance (should be increased by the transferred amount)

## Approvals and Delegated Transfers

### Approving Another Address to Spend Tokens

1. Find the `approve` function
2. Enter the following parameters:
   - `spender`: The address you want to authorize
   - `amount`: The maximum amount they can spend (in wei)
3. Click "transact"
4. Confirm the transaction in MetaMask

### Checking Allowances

1. Find the `allowance` function
2. Enter:
   - `owner`: Your address
   - `spender`: The address you approved
3. Click "call"
4. The result shows how many tokens the spender can transfer on your behalf

### Using TransferFrom (for approved spenders)

To use this function, the caller must be previously approved by the token owner:

1. Connect MetaMask with the spender's account
2. Find the `transferFrom` function
3. Enter:
   - `from`: The token owner's address
   - `to`: The recipient's address
   - `amount`: The number of tokens to transfer (in wei)
4. Click "transact"
5. Confirm the transaction in MetaMask

## Interacting with Events

### Viewing Transfer Events

After making transfers, you can view the events:

1. Go to the "Remix Transactions" panel
2. Click on your transaction
3. Expand the "logs" section
4. You should see the `Transfer` event with:
   - `from`: Sender address
   - `to`: Recipient address
   - `value`: Amount transferred

### Viewing Approval Events

Similarly for approvals:

1. Find your approval transaction
2. Expand the "logs" section
3. View the `Approval` event with:
   - `owner`: Your address
   - `spender`: Approved address
   - `value`: Approved amount

## Common Issues and Troubleshooting

### Transaction Fails

If your transaction fails, check for these common issues:

- **Insufficient Token Balance**: Ensure you have enough tokens to transfer
- **Insufficient ETH**: You need ETH to pay for transaction gas
- **Incorrect Amount Format**: Remember to use the correct number of decimals (18)
- **Approval Issues**: For `transferFrom`, make sure the allowance is sufficient

### Gas Settings

If transactions are stuck:

1. In MetaMask, check your gas settings
2. You may need to increase the gas price for faster confirmation
3. For large transfers or complex operations, you may need to increase the gas limit

## Contract Interaction Example

Here's a step-by-step example of a typical interaction flow:

1. Deploy the contract (tokens are minted to your address)
2. Check your balance using `balanceOf`
3. Transfer 100 tokens to a friend:
   - `transfer("0xFriend'sAddress", 100000000000000000000)`
4. Approve an exchange to spend up to 200 tokens:
   - `approve("0xExchangeAddress", 200000000000000000000)`
5. The exchange can now transfer up to 200 tokens from your account using `transferFrom`