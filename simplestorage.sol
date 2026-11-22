// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    uint256 private storedNumber;

    constructor(uint256 initialNumber) {
        storedNumber = initialNumber;
    }

    function setNumber(uint256 _number) public {
        storedNumber = _number;
    }

    function getNumber() public view returns (uint256) {
        return storedNumber;
    }
}