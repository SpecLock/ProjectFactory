// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

/**
 * @title Project
 * @dev A contract to manage project milestones, allowing the owner to add, complete, and approve milestones.
 */
contract Project {
    struct Milestone {
        string title;           
        uint256 tentativeDate;  
        string description;     
        uint256 amount;         
        bool completed;         
    }
    
    address public owner;                       
    string public projectName;                  
    string public projectDescription;           
    address payable public developerAddress;    
    uint256 public totalCapital;                
    Milestone[] public milestones;              
    
    event MilestoneAdded(uint256 indexed milestoneId, string title, uint256 amount);
    event MilestoneCompleted(uint256 indexed milestoneId, string proof);
    event MilestoneApproved(uint256 indexed milestoneId, uint256 amount);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el owner puede ejecutar esta funcion");
        _;
    }
    
    constructor(
        string memory _projectName,
        string memory _projectDescription,
        address payable _developerAddress
    ) {
        owner = msg.sender;
        projectName = _projectName;
        projectDescription = _projectDescription;
        developerAddress = _developerAddress;
    }
    
    function addMilestone(
        string memory _title,
        uint256 _tentativeDate,
        string memory _description,
        uint256 _amount
    ) public onlyOwner {
        milestones.push(Milestone({
            title: _title,
            tentativeDate: _tentativeDate,
            description: _description,
            amount: _amount,
            completed: false
        }));
        emit MilestoneAdded(milestones.length - 1, _title, _amount);
    }
    
    function completeMilestone(uint256 _milestoneId, string memory _proof) public onlyOwner {
        require(_milestoneId < milestones.length, "Milestone no existe");
        milestones[_milestoneId].completed = true;
        emit MilestoneCompleted(_milestoneId, _proof);
    }
    
    function approveMilestone(uint256 _milestoneId) public onlyOwner {
        require(_milestoneId < milestones.length, "Milestone no existe");
        require(milestones[_milestoneId].completed, "Milestone no esta completado");
        developerAddress.transfer(milestones[_milestoneId].amount);
        emit MilestoneApproved(_milestoneId, milestones[_milestoneId].amount);
    }
    
    receive() external payable {
        totalCapital += msg.value;
    }
}

contract ProjectFactory {
    Project[] public projects;

    function createProject(
        string memory _projectName,
        string memory _projectDescription,
        address payable _developerAddress
    ) public {
        Project newProject = new Project(_projectName, _projectDescription, _developerAddress);
        projects.push(newProject);
    }

    function getProjectsByOwner(address _owner) public view returns (Project[] memory) {
        uint count;
        for (uint i = 0; i < projects.length; i++) {
            if (projects[i].owner() == _owner) {
                count++;
            }
        }
        Project[] memory result = new Project[](count);
        uint index;
        for (uint j = 0; j < projects.length; j++) {
            if (projects[j].owner() == _owner) {
                result[index] = projects[j];
                index++;
            }
        }
        return result;
    }

    function getProjectsByDeveloper(address _developer) public view returns (Project[] memory) {
        uint count;
        for (uint i = 0; i < projects.length; i++) {
            if (projects[i].developerAddress() == _developer) {
                count++;
            }
        }
        Project[] memory result = new Project[](count);
        uint index;
        for (uint j = 0; j < projects.length; j++) {
            if (projects[j].developerAddress() == _developer) {
                result[index] = projects[j];
                index++;
            }
        }
        return result;
    }
}