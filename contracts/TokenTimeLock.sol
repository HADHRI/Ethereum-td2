
pragma solidity >=0.4.21 <0.6.0;
import "./ERC20Basic.sol";
/**
 * @title TokenTimelock
 * @dev TokenTimelock is a token holder contract that will allow a
 * beneficiary to extract the tokens after a given release time
 */
contract TokenTimelock { //is Ownable
    // using SafeERC20 for ERC20Basic;

    // ERC20 basic token contract being held
    ERC20Basic token;

    // beneficiary of tokens after they are released
    address public beneficiary;

    // timestamp when token release is enabled
    uint64 public releaseTime;

    constructor(ERC20Basic _token, address _beneficiary, uint64 _releaseTime) public {
        require(_releaseTime > now);
        token = _token;
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }


}