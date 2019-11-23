pragma solidity >=0.4.21 <0.6.0;
import "./MintableToken.sol";
import "./TokenTimelock.sol";
import "./PausableToken.sol";
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


//Token Distribution
uint256 public tokenSalePercentage =70;
uint256 public foundersPourcentage =10;
uint256 public foundationPercentage =10;
uint256 public partenersPercentage =10;
// minimum amount of funds to be raised in weis
uint public goal=10;
// Amount of wei raised
uint256 public weiRaised=10;
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

 /**
   * @dev enables token transfers, called when owner calls finalize()
  */
  /*function finalization() internal {
    if(goalReached()) {
      MintableToken _mintableToken = MintableToken(token);
      uint256 _alreadyMinted = _mintableToken.totalSupply();

      uint256 _finalTotalSupply = _alreadyMinted.div(tokenSalePercentage).mul(100);

      foundersTimelock= new TokenTimelock(token, foundersFund, releaseTime);
      foundationTimelock= new TokenTimelock(token, foundationFund, releaseTime);
      partnersTimelock = new TokenTimelock(token, partnersFund, releaseTime);

      _mintableToken.mint(address(foundersTimelock),   _finalTotalSupply.mul(foundersPercentage).div(100));
      _mintableToken.mint(address(foundationTimelock), _finalTotalSupply.mul(foundationPercentage).div(100));
      _mintableToken.mint(address(partnersTimelock),   _finalTotalSupply.mul(partnersPercentage).div(100));

      _mintableToken.finishMinting();
      // Unpause the token
      PausableToken _pausableToken = PausableToken(token);
      _pausableToken.unpause();
      _pausableToken.transferOwnership(wallet);
    }

    super.finalization();
  } */

  function goalReached() public view returns (bool) {
        return weiRaised >= goal;
    }



} 