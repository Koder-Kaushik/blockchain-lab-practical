// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    mapping(uint256 => Candidate) private candidates;
    mapping(address => bool) private voters;
    uint256 private candidateCount;

    event VoteCast(address indexed voter, uint256 indexed candidateId);

    constructor() {
        _addCandidate("Alice");
        _addCandidate("Bob");
        _addCandidate("Charlie");
    }

    function _addCandidate(string memory _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }

    function vote(uint256 candidateId) public {
        require(!voters[msg.sender], "You have already voted.");
        require(candidateId >= 1 && candidateId <= candidateCount, "Invalid candidate ID.");

        voters[msg.sender] = true;
        candidates[candidateId].voteCount += 1;

        emit VoteCast(msg.sender, candidateId);
    }

    function getCandidate(uint256 candidateId) public view returns (uint256, string memory, uint256) {
        require(candidateId >= 1 && candidateId <= candidateCount, "Invalid candidate ID.");
        Candidate memory c = candidates[candidateId];
        return (c.id, c.name, c.voteCount);
    }

    function getCandidateCount() public view returns (uint256) {
        return candidateCount;
    }

    function hasVoted(address voter) public view returns (bool) {
        return voters[voter];
    }
}