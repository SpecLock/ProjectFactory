# Solidity API

## Project

_A contract to manage project milestones, allowing the owner to add, complete, and approve milestones._

### Contract
Project : contracts/factory.sol

A contract to manage project milestones, allowing the owner to add, complete, and approve milestones.

 --- 
### Modifiers:
### onlyOwner

```solidity
modifier onlyOwner()
```

_Modifier to restrict functions to the owner._

 --- 
### Functions:
### constructor

```solidity
constructor(string _projectName, string _projectDescription, address payable _developerAddress) public
```

_Constructor to initialize the project._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _projectName | string | The name of the project. |
| _projectDescription | string | The description of the project. |
| _developerAddress | address payable | The address of the developer. |

### addMilestone

```solidity
function addMilestone(string _title, uint256 _tentativeDate, string _description, uint256 _amount) public
```

_Adds a new milestone to the project._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _title | string | The title of the milestone. |
| _tentativeDate | uint256 | The tentative date for the milestone. |
| _description | string | The description of the milestone. |
| _amount | uint256 | The amount allocated for the milestone. |

### completeMilestone

```solidity
function completeMilestone(uint256 _milestoneId, string _proof) public
```

_Marks a milestone as completed._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _milestoneId | uint256 | The ID of the milestone. |
| _proof | string | The proof of completion. |

### approveMilestone

```solidity
function approveMilestone(uint256 _milestoneId) public
```

_Approves a completed milestone and transfers the allocated amount to the developer._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _milestoneId | uint256 | The ID of the milestone. |

### receive

```solidity
receive() external payable
```

_Fallback function to receive funds and update total capital._

 --- 
### Events:
### MilestoneAdded

```solidity
event MilestoneAdded(uint256 milestoneId, string title, uint256 amount)
```

_Emitted when a new milestone is added._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| milestoneId | uint256 | The ID of the milestone. |
| title | string | The title of the milestone. |
| amount | uint256 | The amount allocated for the milestone. |

### MilestoneCompleted

```solidity
event MilestoneCompleted(uint256 milestoneId, string proof)
```

_Emitted when a milestone is completed._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| milestoneId | uint256 | The ID of the milestone. |
| proof | string | The proof of completion. |

### MilestoneApproved

```solidity
event MilestoneApproved(uint256 milestoneId, uint256 amount)
```

_Emitted when a milestone is approved._

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| milestoneId | uint256 | The ID of the milestone. |
| amount | uint256 | The amount transferred to the developer. |

