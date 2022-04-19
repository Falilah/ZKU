    //code snippet of the require implemetTion required;
    uint public startTime;

    //t@notice he modifier that will added to the vote function
    modifier voteEnded(){
        uint CurrentTime = block.timestamp - startTime;
        require(CurrentTime < 300);

        _;
    }

    //@notice the chairman the right to start vote
    function setStartTime() public{
        (msg.sender== chairperson, "you are not the chair person");
        startTime = block.timestamp;
    }
    //@notice added the modifier to the vote function.
    function vote(uint proposal) external voteEnded{
        Voter storage sender = voters[msg.sender];
        require(sender.weight != 0, "Has no right to vote");
        require(!sender.voted, "Already voted.");
        sender.voted = true;
        sender.vote = proposal;

        // If `proposal` is out of the range of the array,
        // this will throw automatically and revert all
        // changes.
        proposals[proposal].voteCount += sender.weight;
    }
