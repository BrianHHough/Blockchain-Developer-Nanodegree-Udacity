pragma solidity >=0.4.24;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";

contract SampleToken is ERC20Detailed, ERC20 {
string public name = "SampleToken";
string public symbol = "EGT";
uint public decimals = 10;
uint public INITIAL_SUPPLY = 1000 * (10 ** decimals);

constructor() public {
    _totalSupply = INITIAL_SUPPLY;
    _balances[msg.sender] = INITIAL_SUPPLY;
}
}