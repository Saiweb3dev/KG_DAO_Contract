// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

// Box contract inherits from Ownable, allowing for ownership management
contract Box is Ownable {
    // Private state variable to store a number
    uint256 private s_number;

    // Event emitted when the stored number is changed
    event NumberChanged(uint256 number);

    // Constructor that sets the initial owner of the contract
    constructor(address _owner) Ownable(_owner) {}

    // Function to store a new number, only callable by the owner
    function store(uint256 _number) public onlyOwner {
        s_number = _number;
        emit NumberChanged(s_number);
    }

    // Function to retrieve the stored number
    function getNumber() external view returns (uint256) {
        return s_number;
    }
}