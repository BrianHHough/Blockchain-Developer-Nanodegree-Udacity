// calling StarNotary and calling artifacts to record the JSON format of the smart contract and then deploying it .deploy function
const StarNotary = artifacts.require("starNotary.sol");

module.exports = function(deployer) {
  deployer.deploy(StarNotary);
};
