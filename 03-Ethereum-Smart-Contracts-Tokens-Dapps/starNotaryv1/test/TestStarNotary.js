// Importing the StartNotary Smart Contract ABI (JSON representation of the Smart Contract from the Truffle compiled command) - allows us to request a usable contract abstraction for a specific solidity contract 
const StarNotary = artifacts.require("StarNotary"); // just need to pass through the name of the contract

var accounts; // List of development accounts provided by Truffle
var owner; // Global variable use it in the tests cases

// This called the StartNotary Smart contract and initialize it
// Contract function provides a list of accounts available by ETH client so you can write your contract 
contract('StarNotary', (accs) => {
    accounts = accs; // Assigning test accounts
    owner = accounts[0]; // Assigning the owner test account - the first person to deploy the contract @ index 0
});

// Example test case, it will test if the contract is able to return the starName property 
// initialized in the contract constructor

// all this test libraries use Promises, why we're using in each function the keywords `async` and `await`.
it('has correct name', async () => {
    let instance = await StarNotary.deployed(); // Making sure the Smart Contract is deployed and getting the instance.
    let starName = await instance.starName.call(); // Calling the starName property
    assert.equal(starName, "Awesome Udacity Star"); // Assert if the starName property was initialized correctly
});

// Web3 instances already available in the test file

// It function - async is the second function (await) to claim a star
it('can be claimed', async () => {
    let instance = await StarNotary.deployed(); // Making sure the Smart Contract is deployed and getting the instance.
    await instance.claimStar({from: owner}); // Calling the Smart Contract function claimStar
    let starOwner = await instance.starOwner.call(); // Getting the owner address
    assert.equal(starOwner, owner); // Verifying if the owner address match with owner of the address
});

// Example test case, it will test is the Smart Contract function claimStar assigned the Star to the owner address and it can be changed
// await syntax b/c everything in blockchain is asynchronous 
it('can change owners', async () => {
    let instance = await StarNotary.deployed();
    let secondUser = accounts[1];
    await instance.claimStar({from: owner});
    let starOwner = await instance.starOwner.call();
    assert.equal(starOwner, owner);
    await instance.claimStar({from: secondUser});
    let secondOwner = await instance.starOwner.call();
    assert.equal(secondOwner, secondUser);
 });