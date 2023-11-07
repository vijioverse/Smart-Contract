// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Sample  {
    function Greater(uint[] calldata arr) public pure returns(uint) {
        uint result;
        for (uint i; i < arr.length;) {
            uint a = arr[i];
            assembly {
                if lt(result, a) { result := a }
                i := add(i, 1)
            }
        }
        return result;
    }
}
