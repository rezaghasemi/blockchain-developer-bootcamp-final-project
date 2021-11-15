pragma solidity 0.5.16;

contract WE {

   // variables    /////////////////////////////////////////////////////////////////////////////////////////////////

   address owner;

   uint nOv;
   uint nOc;
   uint public nOc_counter;
   uint public nOv_counter;

   mapping(address => Voter) public Voters;
   mapping(uint => Candidate) public Candidates;
   

   // modeifiers   /////////////////////////////////////////////////////////////////////////////////////////////////


   modifier onlyOwner {
      require(msg.sender == owner);
      _;
   }

   // structures   /////////////////////////////////////////////////////////////////////////////////////////////////

   struct Candidate{
      uint id;
      string nick_name;
      uint votes;
   }

   struct Voter{
      uint id;
      string nick_name;
      address add;
      uint eth;
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
      require(contract_state==state.VOTING || msg.value>=10^18,"Sorry there is an error!");


      // here
      
      

   }
   

   // constractor    ///////////////////////////////////////////////////////////////////////////////////////////
   
   
   constructor(uint numOfcandidates, uint numOfvoters) public {
      owner=msg.sender;
      nOv=numOfvoters;
      nOc=numOfcandidates;
   
   }



}

