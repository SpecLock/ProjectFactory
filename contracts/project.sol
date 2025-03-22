// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

/**
 * @title Project
 * @dev A contract to manage project milestones, allowing the owner to add, complete, and approve milestones.
 */
contract Project {
    struct Milestone {
        string title;           // Title of the milestone
        uint256 tentativeDate;  // Tentative date for the milestone
        string description;     // Description of the milestone
        uint256 amount;         // Amount allocated for the milestone
        bool completed;         // Status of the milestone completion
    }
    
    address public owner;                      // Owner of the project
    string public projectName;                 // Name of the project
    string public projectDescription;          // Description of the project
    address payable public developerAddress;   // Address of the developer
    uint256 public totalCapital;               // Total capital received
    Milestone[] public milestones;             // List of milestones
    
    /**
     * @dev Emitted when a new milestone is added.
     * @param milestoneId The ID of the milestone.
     * @param title The title of the milestone.
     * @param amount The amount allocated for the milestone.
     */
    event MilestoneAdded(uint256 indexed milestoneId, string title, uint256 amount);
    
    /**
     * @dev Emitted when a milestone is completed.
     * @param milestoneId The ID of the milestone.
     * @param proof The proof of completion.
     */
    event MilestoneCompleted(uint256 indexed milestoneId, string proof);
    
    /**
     * @dev Emitted when a milestone is approved.
     * @param milestoneId The ID of the milestone.
     * @param amount The amount transferred to the developer.
     */
    event MilestoneApproved(uint256 indexed milestoneId, uint256 amount);
    
    /**
     * @dev Modifier to restrict functions to the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el owner puede ejecutar esta funcion");
        _;
    }
    
    /**
     * @dev Constructor to initialize the project.
     * @param _projectName The name of the project.
     * @param _projectDescription The description of the project.
     * @param _developerAddress The address of the developer.
     */
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
    
    /**
     * @dev Adds a new milestone to the project.
     * @param _title The title of the milestone.
     * @param _tentativeDate The tentative date for the milestone.
     * @param _description The description of the milestone.
     * @param _amount The amount allocated for the milestone.
     */
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
    
    /**
     * @dev Marks a milestone as completed.
     * @param _milestoneId The ID of the milestone.
     * @param _proof The proof of completion.
     */
    function completeMilestone(uint256 _milestoneId, string memory _proof) public onlyOwner {
        require(_milestoneId < milestones.length, "Milestone no existe");
        milestones[_milestoneId].completed = true;
        emit MilestoneCompleted(_milestoneId, _proof);
    }
    
    /**
     * @dev Approves a completed milestone and transfers the allocated amount to the developer.
     * @param _milestoneId The ID of the milestone.
     */
    function approveMilestone(uint256 _milestoneId) public onlyOwner {
        require(_milestoneId < milestones.length, "Milestone no existe");
        require(milestones[_milestoneId].completed, "Milestone no esta completado");
        developerAddress.transfer(milestones[_milestoneId].amount);
        emit MilestoneApproved(_milestoneId, milestones[_milestoneId].amount);
    }
    
    /**
     * @dev Fallback function to receive funds and update total capital.
     */
    receive() external payable {
        totalCapital += msg.value;
    }
}