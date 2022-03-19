// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Constants {
    
    // coding convention to uppercase constant variables
    
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    
    uint public constant MY_UINT = 123;
    
    /* This function will fail
    function change(address _addr, uint _num) public {
        MY_ADDRESS = _addr;
        MY_UINT = _num;
    }
    */
}
