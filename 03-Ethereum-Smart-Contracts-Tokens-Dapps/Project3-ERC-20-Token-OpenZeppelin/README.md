# Creating an ERC-20 Token with Open Zeppelin

# PART 1: Create a folder of node_modules

### Step 1: Open your terminal, make a directory, and cd into it.
`mkdir projectFolder` <----don't name this folder web3
`cd projectFolder`

### Step 2: Initialize node to create a package.json file (choose defaults)
`npm init`

### Step 3: Install web3 and save it as a dependency to package.json
`npm install web3` --save

### Step 4: Open node from your terminal window.
`node`

### Step 5: Require web3 as Web3 variable.
`var Web3 = require('web3')`

### Step 6: Read the Web3 variable.
`Web3`

# PART 2: Create `Contracts`, `Migrations` + JSON Folders

1) Verify you have the Truffle (v5.0.2) latest installed if not use the command `npm install -g truffle`

2) Use `mkdir SampleToken` to create a directory

3) `cd SampleToken`

4) Run the command: `truffle init` to initialize a truffle project.

5) Run `npm install --save truffle-hdwallet-provider` used to set up the provider to connect to the Infura Node

6) Run `npm install openzeppelin-solidity`

7) Go into your contracts folder, and create your token smart contract file `SampleToken.sol`


