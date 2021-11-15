var WE = artifacts.require("./WE.sol");

module.exports = function(deployer) {
  deployer.deploy(WE,3,10);
};
