// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract GCDTest {

    //this function calculates the GCD (Greatest Common Divisor)
    function gcd(uint a, uint b) public pure returns (uint) {
        // if(a < b) {
        //     (a, b) = (b, a);    
        // }
        uint z = a % b;
        while(z != 0) {
            a = b;
            b = z;
            z = a % b;
        }
        return b;
    }
}
