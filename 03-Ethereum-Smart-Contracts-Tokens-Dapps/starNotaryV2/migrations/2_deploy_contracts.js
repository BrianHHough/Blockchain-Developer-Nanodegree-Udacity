// use artificats to require the JSON format of the smart contract
const StarNotary = artifacts.require("StarNotary");

// we deploy the smart contract here:
module.exports = function(deployer) {
  deployer.deploy(StarNotary);
};