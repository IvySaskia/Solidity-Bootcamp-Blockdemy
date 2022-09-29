// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract UnidadesEther{


    uint public oneWei = 1 wei;
    uint public oneGwei = 1 gwei;
    uint public oneEther = 1 ether;
}

contract TranferirEther{

    //transfer()
    function transferEther(address payable _to) public payable {
        _to.transfer(msg.value);
    }


    //send()
    function sendEther(address payable _to) public payable returns (bool ok){
        ok = _to.send(msg.value);
    }

    //call()
    function callEther(address payable _to) public payable returns (bool sent, bytes memory data)
    {
        (sent, data) = _to.call{value: msg.value}("");
    }
}

contract RecibirEther{

    function getBalance() public view returns(uint){
        return address(this).balance;
    }


    receive() external payable{

    }
}