const Nft = artifacts.require("Nft");

module.exports = async function (deployer) {
  await deployer.deploy(Nft);

  let contractaddress = await Nft.deployed();
  console.log(contractaddress.address, "This is the contract addresss");
};
