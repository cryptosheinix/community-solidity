// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Mapping {
    // Mapping from address to uint
    mapping(uint => address) public myMap;

    function get(uint _i) public view returns (address) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        return myMap[_i];
    }

    function set(address _addr, uint _i) public {
        // Update the value at this address
        myMap[_i] = _addr;
    }

    function remove(uint _i) public {
        // Reset the value to the default value.
        delete myMap[_i];
    }
}
