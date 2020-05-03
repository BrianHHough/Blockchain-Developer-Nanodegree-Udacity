pragma solidity >=0.4.24;

contract StarNotary {
    // Define 2 public storage variables
    string public starName; // stores name of star
    address public starOwner; // stores address of star

    // Event function
    event starClaimed(address owner);

    // Constructor functions called automatically in a sol. contract
    constructor() public {
        starName = "Awesome Udacity Star"; // star name automatically set to this value
    }

    function claimStar() public {
        starOwner = msg.sender;
        emit starClaimed(msg.sender);
    }

}