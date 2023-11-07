// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract ChcolateShop  {
    uint256 private chocolates;
    //this function allows gavin to buy n chocolates
    function buyChocolates(uint n) external {
        unchecked {
            chocolates += n;
        }
    }

    //this function allows gavin to sell n chocolates
    function sellChocolates(uint n) external {
        if(chocolates < n) {
            chocolates = 0;
        } else {
            unchecked {
                chocolates -= n;
            }
        }
    }

    //this function returns total number of chocolates in bag
    function chocolatesInBag() public view returns(uint n) {
        return chocolates;
    }
}
