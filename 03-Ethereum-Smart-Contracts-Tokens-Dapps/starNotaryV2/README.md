# Creating an Ethereum DAPP - Part II

## **IMPORTANT:**

**If there are extra `node_modeules` folders, try the following to consolidate and fix:**
1. Delete the `node_modules` folder
2. run `npm install truffle --save`
3. run `npm install`

**It's important to make sure all solidity files that have pragma solidity ^version...all have the same number**
1. Check the `node_modules/open-zeppelin/token/ERC-271` files to make sure they all have `^0.6.2`
2. Check out the `truffle-congig.js` file to make sure that it has `version: "0.6.2",`

