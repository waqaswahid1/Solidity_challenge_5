pragma solidity 0.6.0;

contract WithdrawTimeStamp{
    
    address payable public Receiver;
    uint public deadline;
    
    constructor(address payable _receiver , uint _deadline ) public payable
    {
        require(_deadline > block.timestamp);
        Receiver = _receiver;
        deadline = _deadline;
    }
    
    function PayRelease () public
    {
        require(block.timestamp >= deadline);
        Receiver.transfer(address(this).balance);
    }
}