// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract DiamondLedger {
    mapping (uint256 => uint256) public diamonds;
    
    //this function imports the diamonds (range: 0 <= weight <=1000)
    function importDiamonds(uint[] calldata weights) public {
        for (uint256 i; i < weights.length; i++) {
            diamonds[weights[i]]++;
        }
    }

    //this function returns the total number of available diamonds as per the weight
    function availableDiamonds(uint weight) public view returns(uint) {
        return diamonds[weight];
    }
}
