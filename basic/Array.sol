// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Array {
    // Several ways to initialize an array
    uint[] public arr = [1, 2, 3, 20, 36, 50, 100];
    uint[] public arr2 = [1, 2, 3];
    // Fixed sized array, all elements initialize to 0
    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    // Solidity can return the entire array.
    // But this function should be avoided for
    // arrays that can grow indefinitely in length.
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        // Append to array
        // This will increase the array length by 1.
        arr.push(i);
    }

    function pop() public {
        // Remove last element from array
        // This will decrease the array length by 1
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        // Delete does not change the array length.
        // It resets the value at index to it's default value,
        // in this case 0
        delete arr[index];
    }
}

contract CompactArray {
    uint[] public arr = [1, 2, 3, 20, 36, 50, 100];

    // Deleting an element creates a gap in the array.
    // One trick to keep the array compact is to
    // move the last element into the place to delete.
    function remove(uint index) public {
        // Move the last element into the place to delete
        arr[index] = arr[arr.length - 1];
        // Remove the last element
        arr.pop();
    }
    
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function test() public {
        arr.push(1);
        arr.push(2);
        arr.push(3);
        arr.push(4);
        // [1, 2, 3, 4]

        remove(1);
        // [1, 4, 3]

        remove(2);
        // [1, 4]
    }
}

// 0  1  2   3   4   5    6
//[1, 2, 3, 0, 36, 50, 100]
