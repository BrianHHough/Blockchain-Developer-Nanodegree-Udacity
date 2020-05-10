// artificats to require the JSON format of the smart contract:
const StarNotary = artifacts.require("StarNotary");

// how we deploy the smart contract:
module.exports = function(deployer) {
  deployer.deploy(StarNotary);
};
