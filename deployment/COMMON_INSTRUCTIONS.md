# Common Deployment Instructions

These instructions apply to both Basic and Multisig versions of SamerV42Token.

## Prerequisites

1. **Web browser** (Chrome/Firefox recommended)
2. **Wallet Setup**:
   - Install MetaMask or similar Ethereum wallet extension
   - Add Holesky Testnet:  
    [Holesky Network Configuration Guide](https://revoke.cash/learn/wallets/add-network/ethereum-holesky)
3. **Test ETH**:
   - Get free Holesky ETH for gas fees:  
    [Holesky Faucet](https://cloud.google.com/application/web3/faucet/ethereum/holesky)

## Common Steps

### 1. Access Remix IDE

1. Open your web browser and navigate to [Remix Ethereum IDE](https://remix.ethereum.org/)
2. You'll see the default workspace with some example files

### 2. Create Contract File

1. In the File Explorer panel (left side), create a new file named (SamerV42Token.sol or SamerV42TokenMultisig.sol) inside contracts folder

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

- For **Basic Token**: Proceed with [SamerV42Token_DEPLOYMENT.md](SamerV42Token_DEPLOYMENT.md)
- For **Multisig Token**: Proceed with [SamerV42TokenMultisig_DEPLOYMENT.md](SamerV42TokenMultisig_DEPLOYMENT.md)

## Verification (After Deployment)

#### Method 1: Remix Etherscan Plugin (Recommended)

[![Step-by-Step Video Guide](https://img.youtube.com/vi/hEJ1OlT8jQ4/0.jpg)](https://www.youtube.com/watch?v=hEJ1OlT8jQ4)

_Benefits_:

- Handles constructor arguments automatically
- Directly connects to your deployed contract
- No manual file uploads required

#### Method 2: Manual Etherscan Verification

**Steps**:

1. Note your contract address after deployment
2. Go to [Holesky Etherscan](https://holesky.etherscan.io/)
3. Search for your contract address
4. Click the "Contract" tab → "Verify and Publish"
5. Select:
   - Compiler type: Solidity (Single/Multi-File)
   - Compiler version (must match!)
6. Upload source files
