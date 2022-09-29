
/////////////////////////////////////////////////////////
//Cuenta de ahorro

//En un inicio el saldo es cero. 

//Ingresar saldo * V1
//Retirar saldo * V1

//Valide si es posible ingresar o retirar valor *

//Guardar mis datos
// Address de cuenta - Nombre, edad, color favorito. * V2


// SPDX-License-Identifier: MIT

/////////////////////////////////////////////////////////
// VERSION 1

/*


pragma solidity ^0.8.0;

contract Ejercicio1CuentaAhorro {

    int saldo;


    function ingresarSaldo (int saldoParaIngresar) public {
        require(saldoParaIngresar > 0, "saldo para ingresar debe ser mayor a 0");
        saldo += saldoParaIngresar;
    }

    function retirarSaldo (int saldoParaRetirar) public {
        require(saldoParaRetirar > 0, "saldo para retirar debe ser mayor a 0");
        require(c1.saldo >= saldoParaRetirar , "saldo para retirar no debe ser mayor a su saldo actuarl");
        saldo -= saldoParaRetirar;
    }

    function getSaldo () public view returns (int){
        return saldo;
    }
}
*/

/////////////////////////////////////////////////////////
// VERSION 2

/*
pragma solidity ^0.8.0;

contract Ejercicio1CuentaAhorro {

    struct CuentaAhorro {
        int saldo; 
        string addressCuenta;
        string nombre;
        int edad;
        string colorFavorito;
    }

    CuentaAhorro public c1 = CuentaAhorro(0, "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4", "Ivy", 25 ,"Purpura");


    function ingresarSaldo (int saldoParaIngresar) public {
        require(saldoParaIngresar > 0, "saldo para ingresar debe ser mayor a 0");
        c1.saldo += saldoParaIngresar;
    }

    function retirarSaldo (int saldoParaRetirar) public {
        require(saldoParaRetirar > 0, "saldo para retirar debe ser mayor a 0");
        require(c1.saldo >= saldoParaRetirar , "saldo para retirar no debe ser mayor a su saldo actuarl");
        c1.saldo -= saldoParaRetirar;
    }
}

*/



/////////////////////////////////////////////////////////
// VERSION 3


pragma solidity ^0.8.0;

contract Ejercicio1CuentaAhorro {

    struct CuentaAhorro {
        int saldo; 
        address addressCuenta;
        string nombre;
        int edad;
        string colorFavorito;
    }

    CuentaAhorro public c1 = CuentaAhorro(0, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "Ivy", 25 ,"Purpura");

    mapping (address => CuentaAhorro) public mappingCuentaAhorro;

    function addCuentaAhorro (string memory nombre, int edad, string memory colorFavorito) public {
        mappingCuentaAhorro[msg.sender] = CuentaAhorro(0, msg.sender, nombre, edad, colorFavorito);
    }

    function ingresarSaldo (int saldoParaIngresar) public {
        require(saldoParaIngresar > 0, "saldo para ingresar debe ser mayor a 0");
        mappingCuentaAhorro[msg.sender].saldo += saldoParaIngresar;
    }

    function retirarSaldo (int saldoParaRetirar) public {
        require(saldoParaRetirar > 0, "saldo para retirar debe ser mayor a 0");
        require(mappingCuentaAhorro[msg.sender].saldo >= saldoParaRetirar , "saldo para retirar no debe ser mayor a su saldo actual");
        mappingCuentaAhorro[msg.sender].saldo -= saldoParaRetirar;
    }
}
