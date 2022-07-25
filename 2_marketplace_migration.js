const Marketplace = artifacts.require("Marketplace");
require("dotenv").config();

module.exports = function (deployer) {
  //This is the contract address of the deployed smart contract for NFT minting and transfer
  let accountaddress = "0x4A619eC9A8Db54E33D56ba3b0b8690c4cD698FB1";

  let dummyaccountaddress = "0x039f99A4d040070f629f6C9bAFae8B99A582374a";

  deployer.deploy(Marketplace, accountaddress, process.env.METAMASK_PUBLIC_KEY);

  //This is the contract address of the deployed Markeplace smart contract

  // 0xf4818aeef557d58714b9e7a842a91ed2c2418877
};
