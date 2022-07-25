//SPDX-License-Identifier:UNLICENSED

pragma solidity >=0.5.0 <0.9.0;

//For tokenIds we are going to use the Counters library 
import '@openzeppelin/contracts/utils/Counters.sol';

import './Nft.sol';


//This is the contract for the NFT marketplace
contract Marketplace {
    using Counters for Counters.Counter;

    Nft public nft;
    address private from;

    constructor(address _nft,address _from)
    {
        //This is creating an instance of the deployed smart contract
        nft=Nft(_nft);
        from=_from;
    }

    //Now we are creating a state variable for the struct of the Counters library
    Counters.Counter private _tokenIds;

    //Now this is the mapping which maps the tokenId to the given account address
    //This mapping indicates which account address bought which tokens
    mapping(uint256=>address) public owners;

    //This is the mapping which indicates whether the token has even been minted or not
    mapping(uint256=>bool) public minted;

   //This function returns the account address of the nft smart contract
    function getnftdetails() external returns(Nft) {
        return nft;
    }

    //For simplicity the prices of each NFT has been kept 0.1 ether only
    uint public nft_price=0.1 ether;

    //This is the purchase function
    function purchase(uint256 _tokenId) external payable{

        require(available(_tokenId),"The NFT you want to purchase has already been purchased");

        //We also need to see whether the value passed by the account address is equal to the nft_price
        require(msg.value==nft_price,"You must pay the nft_price to buy the nft");

        owners[_tokenId]=msg.sender; 
        nft.transferNFT(from,msg.sender,_tokenId);

    }

   //This is just the test function
    function tp() public view returns(string memory){
        return nft.Foo();
    }

    function getprice() public view returns(uint){
        return nft_price;
    }

    function getbalance() public view returns(uint)
    {
        return address(this).balance;
    }

    function available(uint _tokenId) internal view returns(bool)
    {
        //In solidity by default if no tokenId is mapped to a particular address then by default it shows that the tokenId is mapped to
        //address(0) which is equal to the address 0x000000000000

        if(owners[_tokenId]==address(0))
        {
            //This means that the NFT is available
            return true;
        }

        else{
            return false;
        }
    }

    function isminted(uint _tokenId) external returns(bool)
    {
        return minted[_tokenId];
    }

    function setminted(uint _tokenId) external returns(bool) {
        minted[_tokenId]=true;
        return minted[_tokenId];
        
    }

}