// Importing the StartNotary Smart Contract ABI (JSON representation of the Smart Contract from the Truffle compiled command) - allows us to request a usable contract abstraction for a specific solidity contract 
const StarNotary = artifacts.require("StarNotary"); // just need to pass through the name of the contract

var accounts; // List of development accounts provided by Truffle
var owner; // Global variable use it in the tests cases

// This called the StartNotary Smart contract and initialize it
contract('StarNotary', (accs) => {
    accounts = accs; // Assigning test accounts
    owner = accounts[0]; // Assigning the owner test account
});

// Example test case, it will test if the contract is able to return the starName property 
// initialized in the contract constructor

// all this test libraries use Promises, why we're using in each function the keywords `async` and `await`.
it('has correct name', async () => {
    let instance = await StarNotary.deployed(); // Making sure the Smart Contract is deployed and getting the instance.
    let starName = await instance.starName.call(); // Calling the starName property
    assert.equal(starName, "Awesome Udacity Star"); // Assert if the starName property was initialized correctly
});