pragma solidity 0.5.16;

contract WE {
   address owner;

   modifier onlyOwner {
      require(msg.sender == owner);
      _;
   }

   struct Candidate{
      uint id;
      string nick_name;
      uint votes;
   }

   struct Voter{
      uint id;
      string nick_name;
      uint eth;
   }
   enum state{REG_CANDIDATES,REG_VOTERS, VOTING, FINISH}


   mapping(uint => Voter) public Voters;
   mapping(uint => Candidate) public Candidates;
   uint nOv;
   uint public nOc;

   function reg_candidate(string memory _name) public onlyOwner {
      //candidates should be added
      nOc_counter++;
      Candidates[nOc_counter]=Candidate(nOc_counter,_name, 0);
   }

   function reg_voter() public payable {
      //register an voter and gets 1 eth for guarantee


   }

   function vote(uint candidate_id) public {
      //add votes for the selected candidate
   }
   uint public nOc_counter;
   uint public nOv_counter;


   constructor(uint numOfcandidates, uint numOfvoters) public {
      owner=msg.sender;
      nOv=numOfvoters;
      nOc=numOfcandidates;
   
   }



}

