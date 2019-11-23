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
//declaring a mapping for balance field
mapping(address => uint256) public balanceOf; 
//Nested mapping for allowance fielc
mapping(address => mapping(address => uint256))public allowance;


//Transfer Event
 event Transfer(
     address indexed _from,
     address indexed _to,
     uint256 _value
 );

 //approve Event
 event Approval(
     address indexed _owner,
     address indexed _spender,
     uint256 _value
 );

    constructor(uint256 _initialSupply) public {
        // allocate the initiale supply
        balanceOf[msg.sender]= _initialSupply;
        totalSupply = _initialSupply;    // all existing tokens 
} 

//Transfer
function transfer(address _to, uint256 _value)public returns(bool success){
    //Exception if account doesn't have enough token to transfer
    require(balanceOf[msg.sender] >= _value);
    //Transfer the balance
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    //Transfer Event ( declaring the event in the begining) 
    emit Transfer(msg.sender, _to, _value);
    // Return a true boolean 
    return true;  
}
//Approve function
function approve(address _spender, uint256 _value) public returns(bool success){
    //allownance
    allowance[msg.sender][_spender] = _value;
    //Approve event
    emit Approval(msg.sender, _spender, _value);
    return true;
}

//TransferFrom function 
function transferFrom(address _from,address _to, uint256 _value)public returns(bool success){
    //Require _from has enough tokens 
     require(_value <= balanceOf[_from]); 
    //Requife allowance is big enough
    require(_value <= allowance[_from][msg.sender]);
    //Change the balance
    balanceOf[_from] -= _value;
    balanceOf[_to] += _value;
    //Update the allowance
    allowance[_from][msg.sender] -= _value;
    //Transfer event 
    emit Transfer(_from, _to, _value);
    return true;
}

function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal view {
        require(beneficiary != address(0), "Crowdsale: beneficiary is the zero address");
        require(weiAmount != 0, "Crowdsale: weiAmount is 0");
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
    }



} 