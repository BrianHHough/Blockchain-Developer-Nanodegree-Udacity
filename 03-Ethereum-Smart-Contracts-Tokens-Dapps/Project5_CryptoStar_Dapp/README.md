# StarNotary Token DAPP

## Core project information

### Truffle and OpenZeppelin versions used in project:
- Truffle v5.1.23 (Core: 5.1.23)
- OpenZeppelin v2.1.2

### The ERC-721 Token Name
Interstellars

### Your ERC-721 Token Symbol
INTX

### Your “Token Address” on the Rinkeby Network

## Resources
- [Open-Zeppelin documentation](https://docs.openzeppelin.com/cli/2.8/faq])
- [Solidity documentation](https://solidity.readthedocs.io/en/v0.6.7/)
- [Stackoverflow](https://stackoverflow.com/questions/54210366/why-does-the-solidity-compiler-throw-a-parse-error-on-import-statements-whats) + Udacity mentors: fixing issue with version differences between solidity & dependencies of Web3 in JSON files and the parser issues b/c of version control


## Task 1
**Your Project is to Modify the StarNotary version 2 contract code to achieve the following:**
- Add a name and a symbol for your starNotary tokens. Resource
Add a function lookUptokenIdToStarInfo, that looks up the stars using the Token ID, and then returns the name of the star.
- Add a function called exchangeStars, so 2 users can exchange their star tokens...Do not worry about the price, just write code to exchange stars between users.
- Write a function to Transfer a Star. The function should transfer a star from the address of the caller. The function should accept 2 arguments, the address to transfer the star to, and the token ID of the star.

## Task 2
**Add supporting unit tests, to test the following:**
- The token name and token symbol are added properly.
- 2 users can exchange their stars.
- Stars Tokens can be transferred from one address to another.

## Task 3
**Deploy your Contract to Rinkeby**
- Edit the truffle.config file to add settings to deploy your contract to the Rinkeby Public Network.
*Helper Points:*
- Command used to deploy to Rinkeby truffle migrate --reset --network rinkeby
- You will need to have your Metamask’s seed and Infura setup.
- This was shown to you in detail in the lesson on Solidity, while creating ERC-20 tokens on Rinkeby.

## Task 4
**Modify the front end of the DAPP to achieve the following:**
- Lookup a star by ID using tokenIdToStarInfo() (you will have to add code for this in your index.html and index.js files)


# Steps / Tasks:

## Working locally:
- Open the **package-lock.json** file and confirm that `truffle-hdwallet-provider` and `openzeppelin-solidity` dependencies are installed. If they aren't, install them with the following:
    - Step 1: 
    `npm install --save truffle-hdwallet-provider`
    - Step 2: 
    `npm install --save openzeppelin-solidity`
- Confirm truffle version: 
`truffle -version`
- Starting the development console, run: 
`truffle develop`
- To compile the contract inside the dev console, run: 
`compile`

## Deploying to Rinkeby Testnet:
- Create a `.gitignore` file and a `secret` file that can hold the pneumonic:
`echo "MY-PROJECT-SECRET-ID" > .secret`


**Successfully compiled contracts in Truffle Developer Environment:**
![image](https://github.com/BrianHHough/Blockchain-Developer-Nanodegree-Udacity/blob/master/Documentation/Project-StarNotary/Contracts-compiled-successfully.png)

- To migrate the contract to the locally running Ethereum network inside the dev console, run: 
`migrate --reset`
- To run unit tests of the compiled contract inside the dev console, run:
`test`

**Successfully passed all 9 tests:**
![image](https://github.com/BrianHHough/Blockchain-Developer-Nanodegree-Udacity/blob/master/Documentation/Project-StarNotary/Passes_All_Tests.png)

- To run the front end of the Dapp, open another terminal window, `cd` into the project directory and run:
`cd app`
`npm run dev`



