pragma solidity 0.5.16;

contract WE {

   // variables    /////////////////////////////////////////////////////////////////////////////////////////////////

   address owner;

   uint nOv;
   uint nOc;
   uint public nOc_counter;
   uint public nOv_counter;
   
   
   mapping(uint => Candidate) public Candidates;
   mapping(address => uint) public Voters;

   Candidate winner = Candidate(0,"win", 0);
   // modeifiers   /////////////////////////////////////////////////////////////////////////////////////////////////


   modifier onlyOwner {
      require(msg.sender == owner);
      _;
   }

   // structures   /////////////////////////////////////////////////////////////////////////////////////////////////

   struct Candidate{
      uint id;
      string name;
      uint votes;
   }

 

   // States      /////////////////////////////////////////////////////////////////////////////////////////////////

   enum state{REG_CANDIDATES,REG_VOTERS, VOTING, FINISH}
   state contract_state = state.REG_CANDIDATES;

   
   
   // functions  /////////////////////////////////////////////////////////////////////////////////////////////////

   function reg_candidate(string memory _name) public onlyOwner {
      //candidates should be added
      if(nOc_counter==nOc){contract_state=state.VOTING;}
      require(nOc_counter<=nOc || contract_state==state.REG_CANDIDATES, "Sorry there is an error!");
      nOc_counter++;
      Candidates[nOc_counter]=Candidate(nOc_counter,_name, 0);
   }


   function vote(uint candidate_id) payable public {
      //add votes for the selected candidate
      require(contract_state==state.VOTING || msg.value>=10^18 || Voters[msg.sender]!=0,"Sorry there is an error!");
      nOv_counter++;
      if (nOv==nOv_counter){contract_state==state.FINISH;}

      Candidates[candidate_id].votes+=msg.value;
      Voters[msg.sender]=msg.value;
      if (winner.votes < Candidates[candidate_id].votes){
         winner=Candidates[candidate_id];
      }
   }
   

   function find_winner() public view returns(string memory){
      //find the winner of the election
      require(contract_state==state.FINISH,"Election has not been finnished yet!!");
      return winner.name;
   }

   // constractor    ///////////////////////////////////////////////////////////////////////////////////////////
   
   
   constructor(uint numOfcandidates, uint numOfvoters) public {
      owner=msg.sender;
      nOv=numOfvoters;
      nOc=numOfcandidates;
      
   }



}

