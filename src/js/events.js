window.onload = async function () {
  var metamask = false;
	if (window.ethereum) {
		window.web3 = new Web3(ethereum);
		metamask = true;
		try {
			await ethereum.enable();
			accounts= await web3.eth.getAccounts();
			option={from: account[0] };
		} catch (error) {
			// User denied account access...
		}
	}
	// Legacy dapp browsers...
	else if (window.web3) {
		window.web3 = new Web3(web3.currentProvider);
		metamask = true;
		// Acccounts always exposed
		try {
			web3.eth.defaultAccount = web3.eth.accounts[0];
			option = {from: web3.eth.accounts[0]}
		} catch (error) {

		}
		web3.eth.sendTransaction({/* ... */});
	}
	// Non-dapp browsers...
	else {
		web3 = new Web3(new Web3.providers.HttpProvider(inforaUrl));
		var account = web3.eth.accounts.create();
		option = {from: account.address};
	}

  WeAddress = '0x8E7459DC17b5731C74D5D529896b9b8339E90385';
  WeAbi = [{"inputs":[{"internalType":"uint256","name":"numOfvoters","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"constant":true,"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"Candidates","outputs":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"votes","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"Voters","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"contract_state","outputs":[{"internalType":"enum WE.state","name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"find_winner","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"getVots","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"nOc","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"nOc_counter","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"nOv","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"nOv_counter","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"_name","type":"string"}],"name":"reg_candidate","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"candidate_id","type":"uint256"}],"name":"vote","outputs":[],"payable":true,"stateMutability":"payable","type":"function"}];
  WE = new web3.eth.Contract(WeAbi, WeAddress);


  document.getElementById('updateTable').onclick = async function() {
    var Ali_votes = await WE.methods.getVots(1).call();
    var Reza_votes = await WE.methods.getVots(2).call();

   // document.getElementById("Ali_Votes").innerHTML = Ali_votes.toString();
    //document.getElementById("Reza_Votes").innerHTML = Reza_votes.toString();

    console.log(Ali_votes);

  }


}
