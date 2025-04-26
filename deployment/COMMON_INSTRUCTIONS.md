# Common Deployment Instructions

These instructions apply to both Basic and Multisig versions of SamerV42Token.

## Prerequisites

1. **Web browser** (Chrome/Firefox recommended)
2. **Wallet Setup**:
   - Install MetaMask or similar Ethereum wallet extension
   - Add Holesky Testnet:  
     https://revoke.cash/learn/wallets/add-network/ethereum-holesky
3. **Test ETH**:
   - Get free Holesky ETH for gas fees:  
     https://cloud.google.com/application/web3/faucet/ethereum/holesky

## Common Steps

### 1. Access Remix IDE

1. Open your web browser and navigate to https://remix.ethereum.org/
2. You'll see the default workspace with some example files

### 2. Create Contract File

1. In the File Explorer panel (left side), create a new file in the contracts folder

### 3. Add the Contract Code

1. Open your newly created `.sol` file
2. Copy and paste the token contract code from the prepared files

### 4. Compile the Contract

1. Click on the "Solidity Compiler" tab in the left sidebar
2. Make sure the compiler version is set to 0.8.0 or higher
3. Click "Compile [YourContract].sol"
4. Check for any compilation errors in the output panel

### 5. Connect Your Wallet

1. Click on the "Deploy & Run Transactions" tab
2. In the "Environment" dropdown, select "Injected Provider - MetaMask"
3. Select the account you want to use for deployment
4. Make sure you're connected to Holesky Testnet in MetaMask

## Next Steps

Now continue with the specific deployment instructions for your chosen version:

- For **Basic Token**: Proceed with [SamerV42Token_BASIC_DEPLOYMENT.md](SamerV42Token_DEPLOYMENT.md)
- For **Multisig Token**: Proceed with [SamerV42Token_MULTISIG_DEPLOYMENT.md](SamerV42TokenMULTISIG_DEPLOYMENT.md)

## Verification (After Deployment)

1. After deployment, note the contract address
2. Go to https://holesky.etherscan.io/
3. Search for your contract address
4. Click on the "Contract" tab
5. Click "Verify and Publish"
6. Follow the instructions to verify your source code
