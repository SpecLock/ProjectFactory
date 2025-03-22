# Solidity API

## SimpleContract

### Contract
SimpleContract : contracts/factory.sol

 --- 
### Functions:
### constructor

```solidity
constructor(address _owner, string _phrase) public
```

### getPhrase

```solidity
function getPhrase() public view returns (string)
```

## Factory

### Contract
Factory : contracts/factory.sol

 --- 
### Functions:
### createContract

```solidity
function createContract(string _phrase) public returns (address)
```