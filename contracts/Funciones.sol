// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Funciones{

    //Setter - Función que recibe datos
    function setData (uint8 parametro1, uint8 parametro2) public pure{
        parametro1 = parametro1 + 1;
        parametro2 += 1;
    }

    //Getter - Función que regresa datos
    function getData() public pure returns (uint8 parametro3){
        parametro3 += parametro3;
        return parametro3;
    }

    //variable de estado - Storage EVM
    address sender = msg.sender;

    //Getter 
    function getData2() public view returns (address){
        return sender;
    }

    int numero1 = 2;
    int numero2 = 3;
    int resultado;

    //Visibilidad
    function operacion1() external{
        
    }

    function operacion2() public{
        
    }

    function operacion3() internal{
        operacion4();
        this.operacion1();
        operacion3();
    }

    function operacion4() private{
        resultado = numero1 + numero2;
    }

    function suma() public pure returns(uint){
        
        return 2+2;
    }

    uint x = 8;

    function incrementar() public view returns (uint){

        return x + 2;
    }


}

