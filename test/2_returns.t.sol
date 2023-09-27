// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "forge-std/Test.sol";

// To run test: forge t --mc Test2 -vv

/**
 * CONCLUSION:
 *  - `return` returns the value and stops running the function - MUST BE USED AT THE END OF THE FUNCTION
 *  - `returns` returns the value at the end, it allows the function to finish - DOES NOT NEED TO BE USED AT THE END OF THE FUNCTION
 */

contract Test2 is Test {
    uint256 public num = 1;

    function test_return() external view returns (uint256) {
        _beforeReturn();
        return num;
        _afterReturn();
    }

    function test_returns() external view returns (uint256 num) {
        _beforeReturn();
        _returnNum();
        // _returnsNum();
        _afterReturn();
    }

    function _beforeReturn() public view {
        console.log("beforeReturn");
    }

    function _afterReturn() public view {
        console.log("afterReturn");
    }

    function _returnNum() public view returns (uint256) {
        return num;
    }

    function _returnsNum() public view returns (uint256 num) {}
}
