const Marketplace = artifacts.require("Marketplace");
const { expect, assert } = require("chai");
require("dotenv").config();
const contractnft = require("../build/contracts/Nft.json");
var Accounts = require("web3-eth-accounts");

contract("Nft marketplace testing", (accounts) => {
  let marketplace;
  let acc0;
  let acc1;
  let acc2;
  let instance;
  let tpaccount;

  let nft_contract_address;
  let buyingaddress;

  // Passing in the eth or web3 package is necessary to allow retrieving chainId, gasPrice and nonce automatically
  // for accounts.signTransaction().
  let arr;

  var accounts;

  before(async () => {
    marketplace = await Marketplace.deployed();
    nft_contract_address = "0x4a619ec9a8db54e33d56ba3b0b8690c4cd698fb1";
    buyingaddress = "0x37c6e1cea5df9bc7db29fa099c3ee66df926f504";

    //The thing is we need to create
    // acc0 = "0x755E7A5F0332C0E5D81Af09665A971d20872117d";
    // acc1 = "0xE27E8bE768b01070F4eb12523e8a52F8D682F1Fa";
    // acc2 = "0x38f639f204015CC2964e5991E0d697055B9fb87E";

    tpaccount = accounts[0];

    arr = await web3.eth.getAccounts();

    acc0 = web3.eth.accounts.privateKeyToAccount(
      process.env.METAMASK_PRIVATE_KEY
    );
    // accounts = new Accounts(process.env.ALCHEMY_URL);
  });

  it("Should get the price of the nft token", async () => {
    let price = await marketplace.getprice();
    let price3 = web3.utils.fromWei(price, "ether");
    console.log(arr);
    // console.log(accounts);
    console.log(acc0);
    expect(price3).to.equal("0.1");
  });

  it("Should test the minting mapping of the NFT", async () => {
    let value = await marketplace.minted[0];
    console.log(value);
    let value2 = await marketplace.setminted.call(0);
    console.log(value2);
  });

  // it("Should return the nft smart contract", async () => {
  //   let ans = await marketplace.getnftdetails.call();

  //   console.log(ans);
  //   assert(true);
  // });

  it("This is just the test block", async () => {
    try {
      let str = await marketplace.tp.call();
      console.log(str);
    } catch (error) {
      assert(false, error.toString());
    }
  });

  it("Should check the purchase function", async () => {
    try {
      let msg_value = await web3.utils.toWei("0.1", "ether");
      let balance = await web3.eth.getBalance(tpaccount);
      console.log(balance);
      await marketplace.purchase(0, {
        from: tpaccount,
        value: msg_value,
      });

      assert(true);
    } catch (error) {
      assert(false, error.toString());
    }
  });

  it("Should check the balance of the marketplace smart contract", async () => {
    let balance = await marketplace.getbalance();
    let balance2 = await web3.utils.fromWei(balance, "ether");
    expect(balance2).to.equal("0.1");
  });
});
