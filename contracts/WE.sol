pragma solidity 0.5.3;

contract WE {

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


   mapping(uint => Voter) public Voters;
   mapping(uint => Candidate) public Candidates;
   uint nOv;

   function reg_voter() public payable {
      //register an voter and gets 1 eth for guarantee
   }

   function vote(uint candidate_id) public {
      //add votes for the selected candidate
   }



   constructor(uint numOfvoters) public {
      nOv=numOfvoters;
   
   }



}