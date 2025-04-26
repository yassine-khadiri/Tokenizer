# Multisig SamerV42Token Deployment Guide

This guide provides step-by-step instructions for deploying the multisignature version of the SamerV42Token using Remix IDE.

**Before starting**: Complete all common steps from [COMMON_INSTRUCTIONS.md](COMMON_INSTRUCTIONS.md)

## Specific Instructions

### Step 1: File Setup

- **File Name**: `SamerV42TokenMultisig.sol`

## Step 2: Prepare Constructor Arguments

For the multisig version, you need to provide two constructor arguments:

1. `_owners`: Array of owner addresses who can propose and approve transfers
2. `_numConfirmationsRequired`: Number of confirmations needed to execute a transfer

Example scenarios:

- Single owner: `["0xYourAddress"]` with `1` confirmation required
- Two owners: `["0xYourAddress", "0xAnotherAddress"]` with `1` or `2` confirmations required
- Three owners: `["0xAddress1", "0xAddress2", "0xAddress3"]` with `1`, `2`, or `3` confirmations required

## Step 3: Deploy the Contract

1. In the "Contract" dropdown, select "SamerV42TokenMultisig"
2. Below the Deploy button, you'll see fields for constructor arguments
3. For `_owners`, enter an array of addresses in this format: ["0x123...", "0x456...", "0x789..."]
4. For `_numConfirmationsRequired`, enter a number that is:
   - At least 1
   - Less than or equal to the number of owners
5. Click the "Deploy" button
6. MetaMask will pop up asking you to confirm the transaction
7. Review the gas fees and click "Confirm"
8. Wait for the transaction to be mined

## Step 4: Verify Deployment

1. Once deployed, the contract will appear under "Deployed Contracts" in Remix
2. Expand the contract to view its functions
3. Copy the contract address (click the copy icon)
4. Save this address - you'll need it to interact with your token

## Step 5: Confirm Contract Setup

To verify everything worked properly:

1. Call the `name()` function - should return "SamerV42"
2. Call the `symbol()` function - should return "SV42"
3. Call the `balanceOf()` function with the contract's own address - should show 1337000000000000000000 (all tokens)
4. Call the `owners(0)` function - should return the first owner address
5. Call the `numConfirmationsRequired()` function - should return your chosen threshold

## Next Steps

Now that your multisig SamerV42Token is deployed, refer to [SamerV42TokenMultisig_USAGE.md](../documentation/SamerV42TokenMultisig_USAGE.md) for instructions on how to use your token.

## Important Notes

- Remember that all tokens are initially held by the contract itself, not by any individual owner
- To transfer tokens, owners must follow the submit-confirm-execute process
- Make sure all owners have access to their private keys, as losing access could impact the ability to reach the confirmation threshold
