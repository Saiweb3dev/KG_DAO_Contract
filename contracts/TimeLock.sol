// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

import {TimelockController} from "@openzeppelin/contracts/governance/TimelockController.sol";

// TimeLock contract inherits from OpenZeppelin's TimelockController
contract TimeLock is TimelockController {
    // Constructor to initialize the TimelockController
    constructor(
        uint256 minDelay,
        address[] memory proposers,
        address[] memory executors
    ) TimelockController(minDelay, proposers, executors, msg.sender) {}
}