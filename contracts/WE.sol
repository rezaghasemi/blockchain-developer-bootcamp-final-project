pragma solidity ^0.5.0;

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




   constructor(uint numOfparticipants) public {
     

   }
}