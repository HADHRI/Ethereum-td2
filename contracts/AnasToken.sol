pragma solidity >=0.4.21 <0.6.0;
contract AnasToken {
//Constructor 
//Set the total number of tokens 
//Read the total of tokens
uint256 public totalSupply;
//Name
string public name= "AnasToken";
//Ticker
string public ticker="ANA";
//Decimal number
 uint8 public decimals=0;


mapping(address => uint256) public balanceOf; //declaring a mapping for balance field
    constructor(uint256 _initialSupply) public {
        // allocate the initiale supply
        balanceOf[msg.sender]= _initialSupply;
        totalSupply = _initialSupply;    // all existing tokens 
}

} 