var WE =  artifacts.require("./WE.sol")

contract("WE",function(accounts){
    it("Good. We have more than one candidate.",function(){
        return WE.deployed(3).then(function(instance){
            return instance.nOc();

        }).then(function(count){
            assert.isAtLeast(parseInt(count),2);
        });
    });
});

contract("WE",function(accounts){
    it("Good. We will have more than one voter.",function(){
        return WE.deployed(3).then(function(instance){
            return instance.nOv();

        }).then(function(count){
            assert.isAtLeast(parseInt(count),2);
        });
    });
});