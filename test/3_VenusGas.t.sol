// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "forge-std/Test.sol";

struct Token {
    bool exists;
    bool isIrrevocable;
}

contract Test3 is Test {
    mapping(address => Token) public tokens;

    address alice = makeAddr("alice");

    function test_VenusGas() external {
        toggleAliceTokenExists(false, false);
        xvsUpdated(alice);
    }

    function test_VenusGasOptimized() external {
        toggleAliceTokenExists(false, false);
        xvsUpdatedOptimized(alice);
    }

    function toggleAliceTokenExists(bool toggle, bool toggle2) public {
        tokens[alice].exists = toggle;
        tokens[alice].isIrrevocable = toggle2;
    }

    function xvsUpdated(address user) public {
        if (tokens[user].exists) {
            if (tokens[user].isIrrevocable) {
                console.log("accrue interest");
            } else {
                console.log("burn");
            }
        } else if (!tokens[user].exists) {
            console.log("stakedAt = 0");
        } else if (!tokens[user].exists) {
            console.log("stakedAt = block.timestamp");
        } else if (tokens[user].exists) {
            console.log("accrue interest");
        }
    }

    function xvsUpdatedOptimized(address user) public {
        bool userTokenExists = tokens[user].exists;

        if (userTokenExists) {
            if (tokens[user].isIrrevocable) {
                console.log("accrue interest");
            } else {
                console.log("burn");
            }
        } else if (!userTokenExists) {
            console.log("stakedAt = 0");
        } else if (!userTokenExists) {
            console.log("stakedAt = block.timestamp");
        } else if (userTokenExists) {
            console.log("accrue interest");
        }
    }
}

/*

    function xvsUpdated(address user) external {
        uint256 totalStaked = _xvsBalanceOfUser(user); // total XVS amount - the amount pending to withdraw
        bool isAccountEligible = isEligible(totalStaked); // true if totalStaked >= 1000e18, false otherwise

        if (tokens[user].exists && !isAccountEligible) {
            if (tokens[user].isIrrevocable) {
                _accrueInterestAndUpdateScore(user); // accrue interest and update score for the user
            } else {
                _burn(user); // burn the users prime token
            }
        } else if (!isAccountEligible && !tokens[user].exists && stakedAt[user] > 0) {
            stakedAt[user] = 0;
        } else if (stakedAt[user] == 0 && isAccountEligible && !tokens[user].exists) {
            stakedAt[user] = block.timestamp;
        } else if (tokens[user].exists && isAccountEligible) {
            _accrueInterestAndUpdateScore(user);
        }
    }

*/
