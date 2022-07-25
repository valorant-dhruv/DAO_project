//SPDX-License-Identifier:MIT

pragma solidity >=0.5.0 <0.9.0;

//Now we are first importing the required interfaces and contracts that needs to be used or inherited in our smart contract

//We are also importing the ERC721 smart contract
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//This is the ERC721URIStorage which is the implementation of the ERC721 Token along with the funtionality that it maps the tokenuri to the 
//given tokenId
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


//This is the Counters library which contains one struct Counter where one could increment the value of the tokenId
//This is useful in case of assigning the tokenIds to the newly minted tokens
import "@openzeppelin/contracts/utils/Counters.sol";

contract Nft is ERC721URIStorage{
    using Counters for Counters.Counter;

    //This is the struct of the Counters library
    Counters.Counter private _tokenIds;

    constructor() ERC721("Peter Griffin","PTG")
    {

    }

    function returnbalance(address to) public returns(uint)
    {
        return to.balance;
    }


   //Now this is the function to create a new token
   //The function is passed with two arguments the address to which the token must be sent after it is minted
   //The second argument is the tokenUri that is associated with the given token
    function mintingtoken(address to,string memory tokenuri) public returns(uint)
    {

        //Firstly we need to find the tokenId
        uint _tokenId=_tokenIds.current();

        //This is the mint function which assigns the owner to the tokenId
        _mint(to,_tokenId);

       //This is the function which sets the tokenuri to the given tokenId
        _setTokenURI(_tokenId,tokenuri);

        _tokenIds.increment();
        return _tokenId;

        
    }

    function Foo() public pure returns(string memory)
    {
        return "Foo";
    }


    //This is the transfer function where we are able to transfer the minted NFT from one account address to another account address
    function transferNFT(address from,address to,uint _tokenId) external
    {
        transferFrom(from,to,_tokenId);
    }
}