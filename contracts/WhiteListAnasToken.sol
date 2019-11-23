pragma solidity >=0.4.21 <0.6.0;
import "./WhitelistedRole.sol";
import "./AnasToken.sol";
/**
 * @title WhitelistAnasToken 
 * @dev AnasToken in which only whitelisted users can contribute.
 */
contract WhitelistAnasToken is WhitelistedRole, AnasToken {

     constructor(uint256 _initialSupply)  AnasToken( _initialSupply) public{ 
     }

    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal view {
        require(isWhitelisted(_beneficiary), "WhitelistCrowdsale: beneficiary doesn't have the Whitelisted role");
        super._preValidatePurchase(_beneficiary, _weiAmount);
    }
}