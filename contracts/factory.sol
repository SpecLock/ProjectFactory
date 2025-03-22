// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleContract {
    address public owner;
    string public phrase;

    constructor(address _owner, string memory _phrase) {
        owner = _owner;
        phrase = _phrase;
    }

    function getPhrase() public view returns (string memory) {
        return phrase;
    }
}

contract Factory {
    SimpleContract[] public contracts;

    function createContract(string memory _phrase) public returns (address) {
        SimpleContract newContract = new SimpleContract(msg.sender, _phrase);
        contracts.push(newContract);
        return address(newContract);
    }
}