// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleContract {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }
}

contract Factory {
    SimpleContract[] public contracts;

    function createContract() public {
        SimpleContract newContract = new SimpleContract(msg.sender);
        contracts.push(newContract);
    }
}