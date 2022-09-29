// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//cuenta de ahorro saldo inicial 0 

//ingresar dinero (valor)
//retirar valor 
//valide si es posible ingresar o retirar valor 
//guardar mis datos de usuario, de la cuenta etc 
//Address de cuenta metodo de identificacion
// 

//28 sept
//Hacer algo para que solo el owner pueda ejecutar las funciones. 
//Al contrato se le transfiera Ether

 

contract cuentaAhorro{

    struct Cliente{
        string nombre;
        int8 edad;
        string colorFav;
        uint8 saldo;
    }


    Cliente public c1;

    mapping (address => Cliente) mappingCliente; 

    address owner;

    constructor(string memory _nombre, int8  _edad, string memory _colorFav){
        
        c1.nombre = _nombre;
        c1.edad = _edad;
        c1.colorFav = _colorFav;
        c1.saldo = 0;

        //Guardar la dirección de quien ejecuta en una variable
        owner = msg.sender;
    }
    
    
    function addCliente () internal{
        mappingCliente[msg.sender] = c1;
    }

    //Devuelve saldo del cliente
    function getSaldo() public view returns (uint8){
        return c1.saldo;
    }

    //Agrega Saldo
    function agregarSaldo (uint8 monto) public {
        c1.saldo = c1.saldo + monto; 
    }

    //Quita saldo
    function restarSaldo (uint8 monto) public {
        require(monto < c1.saldo, "Saldo insuficiente"); 
        c1.saldo = c1.saldo - monto ;
    } 
           
    //AL contrato transferir Ether

    address payable _to = payable(this);

    //AL contrato transferir Ether
    //funcion sendEther ()
    
    receive() external payable{
        
    }
}

contract llamarCuentaAhorro{

    cuentaAhorro miCuenta = new cuentaAhorro ("Lizeth", 22, "morado");

    function operacion() public returns (uint){
        miCuenta.agregarSaldo(10);
        miCuenta.restarSaldo(5); 

        uint saldo = miCuenta.getSaldo();
        return saldo;
    }
}