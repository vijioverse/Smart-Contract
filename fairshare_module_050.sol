// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract FairShare {
    struct Member {
        address memberAddress;
        uint256 depositAmount;
        uint256 withdrawalAmount;
        uint256 timeConstraint;
        string name;
        bool isOwner;
        bool hasDeposited; // New field to track if a member has deposited
    }
    
    Member[] public members;
    uint256 public currentMonth = 1;
    uint256 public totalPayouts = 0;
    uint256 public totalMembers = 0;
    uint256 public poolBalance = 0;
    uint256 public totalRequiredPayouts;
    bool public systemOpen = false;
    uint256 public systemOpenTimestamp;

    event MemberAdded(address indexed memberAddress, uint256 timeConstraint);
    event Deposit(address indexed memberAddress, uint256 amount);
    event SavingsPoolComplete(uint256 totalPayouts);

    constructor(uint256 _totalRequiredPayouts, uint256 _minimumMembers, uint256 _maximumMembers, uint256 _waitDays) {
        require(_totalRequiredPayouts > 0, "Total required payouts must be greater than zero");
        require(_maximumMembers >= _minimumMembers, "Maximum members must be greater than or equal to minimum members");
        require(_waitDays > 0, "Wait days must be greater than zero");
        totalRequiredPayouts = _totalRequiredPayouts;
        members.push(Member(msg.sender, 0, block.timestamp, true, false));
        emit MemberAdded(msg.sender, block.timestamp);
        totalMembers++;
        poolBalance = msg.value;
        systemOpenTimestamp = block.timestamp + (_waitDays * 1 days);
        if (totalMembers >= _minimumMembers && totalMembers <= _maximumMembers) {
            systemOpen = true;
        }
    }
