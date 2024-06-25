// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Box is Ownable {
    uint256 private s_number;

    event NumberChanged(uint256 number);

    constructor(address _owner) Ownable(_owner) {}

    function store(uint256 _number) public onlyOwner {
        s_number = _number;
        emit NumberChanged(s_number);
    }

    function getNumber() external view returns (uint256) {
        return s_number;
    }
}