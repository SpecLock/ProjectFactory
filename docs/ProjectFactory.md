# Solidity API

## Project

_A contract to manage project milestones, allowing the owner to add, complete, and approve milestones._

### Contract
Project : contracts/ProjectFactory.sol

A contract to manage project milestones, allowing the owner to add, complete, and approve milestones.

 --- 
### Modifiers:
### onlyOwner

```solidity
modifier onlyOwner()
```

 --- 
### Functions:
### constructor

```solidity
constructor(string _projectName, string _projectDescription, address payable _developerAddress) public
```

### addMilestone

```solidity
function addMilestone(string _title, uint256 _tentativeDate, string _description, uint256 _amount) public
```

### completeMilestone

```solidity
function completeMilestone(uint256 _milestoneId, string _proof) public
```

### approveMilestone

```solidity
function approveMilestone(uint256 _milestoneId) public
```

### receive

```solidity
receive() external payable
```

 --- 
### Events:
### MilestoneAdded

```solidity
event MilestoneAdded(uint256 milestoneId, string title, uint256 amount)
```

### MilestoneCompleted

```solidity
event MilestoneCompleted(uint256 milestoneId, string proof)
```

### MilestoneApproved

```solidity
event MilestoneApproved(uint256 milestoneId, uint256 amount)
```

## ProjectFactory

### Contract
ProjectFactory : contracts/ProjectFactory.sol

 --- 
### Functions:
### createProject

```solidity
function createProject(string _projectName, string _projectDescription, address payable _developerAddress) public
```

### getProjectsByOwner

```solidity
function getProjectsByOwner(address _owner) public view returns (contract Project[])
```

### getProjectsByDeveloper

```solidity
function getProjectsByDeveloper(address _developer) public view returns (contract Project[])
```

