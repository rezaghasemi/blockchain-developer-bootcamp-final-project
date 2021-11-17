function tableCreator(candidate_list) {
    var table = document.getElementById("myTable");
    
    candidate_list=candidate_list.reverse()

   
    
    for (let index = 0; index < candidate_list.lengh; index++) {
        const element = array[index];
        var row = table.insertRow(0);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        cell1.innerHTML = candidate_list[i];
        cell2.innerHTML = i+1;        
    }
    
    var row = table.insertRow(0);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    cell1.innerHTML = "Candidate";
    cell2.innerHTML = "id";
  }