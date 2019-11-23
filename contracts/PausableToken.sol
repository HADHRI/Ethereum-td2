import "./StandardToken.sol";
import "./Pausable.sol";
contract PausableToken is StandardToken, Pausable {
  	function transfer(address _to, uint256 _value)public  whenNotPaused returns (bool){
    	return super.transfer(_to, _value);
  	}

  	function transferFrom(address _from, address _to, uint256 _value)public whenNotPaused returns (bool){
    	return super.transferFrom(_from, _to, _value);
  	}
}