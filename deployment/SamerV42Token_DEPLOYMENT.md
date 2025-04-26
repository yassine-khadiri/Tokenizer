# Basic SamerV42Token Deployment Guide

This guide provides step-by-step instructions for deploying the basic version of the SamerV42Token using Remix IDE.

**Before starting**: Complete all common steps from [COMMON_INSTRUCTIONS.md](COMMON_INSTRUCTIONS.md)

## Specific Instructions

### Step 1: File Setup

- **File Name**: `SamerV42Token.sol`

### Step 2: Deploy the Contract

1. In the "Contract" dropdown, select "SamerV42Token"
2. Click the "Deploy" button
3. MetaMask will pop up asking you to confirm the transaction
4. Review the gas fees and click "Confirm"
5. Wait for the transaction to be mined

## Step 3: Verify Deployment

1. Once deployed, the contract will appear under "Deployed Contracts" in Remix
2. Expand the contract to view its functions
3. Copy the contract address (click the copy icon)
4. Save this address - you'll need it to interact with your token

## Step 4: Confirm Token Details

To verify everything worked properly:

1. Call the `name()` function - should return "SamerV42"
2. Call the `symbol()` function - should return "SV42"
3. Call the `totalSupply()` function - should return 1337000000000000000000 (1337 with 18 decimals)
4. Call the `balanceOf()` function with your wallet address - should show you own all tokens

## Step 5: Add to MetaMask

To see your tokens in MetaMask:

1. Open MetaMask
2. Scroll down and click "Import tokens"
3. Enter your token contract address
4. The "Token Symbol" and "Decimals" should auto-populate
5. Click "Add Custom Token" then "Import Tokens"

## Next Steps

Now that your basic SamerV42Token is deployed, refer to [SamerV42Token_USAGE.md](../documentation/SamerV42Token_USAGE.md) for instructions on how to use your token.
