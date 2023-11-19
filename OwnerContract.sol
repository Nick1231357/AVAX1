// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract OwnerContract {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender; 
    }

    modifier OwnerAccess() {
        require(msg.sender == owner, "Only the original owner can call me!");
        _;
    }

    function setBalance(uint _balance) public OwnerAccess {
        balance = _balance;
    }

    function assertEx() public view {
        assert(balance > 0);
    }

    function revertFunction(uint _value) public pure {
        if (_value == 0) {
            revert("Value cannot be zero!");
        }
    }
}
