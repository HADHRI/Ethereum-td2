// Creating a contract extraction
const AnasToken = artifacts.require("./AnasToken.sol");
const WhiteListAnasToken=artifacts.require("./WhitelistAnasToken.sol");

module.exports = function(deployer) {
  deployer.deploy(AnasToken, 1000000);
  deployer.deploy(WhiteListAnasToken,1000000);
};
