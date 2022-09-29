// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TipoValor{

    // Booleanos
    bool flagVerdadero = true;
    bool flagFalso = false;


    //Entero con signo - Positivos y Negativos

        //256 bits
        int numero1 = 2;
        int256 numero2 = -3;
        // int numero2 = -3;

        //8 bits
        int8 numero5 = 1;

        //32 bits
        int32 numero6 = 10;
    

    //Entero sin signo - Positivos

        //256 bits
        uint numero3 = 2;
        uint256 numero4 = 4;
        // uint numero4 = 4;

        //16 bits
        uint16 numero7 = 10;


    //Address - 20 bytes - Direccion de una cuenta

        //msg.sender -> variabe que guarda la direccion que ejecuta el contract
        //msg.value -> cantidad de ether que va a tener mi transaccion
        //msg/ata -> datos de mi contract

        //Externally Owned Account
        address addressExternally = msg.sender;
        address public addressExternally1 = msg.sender; //auttomaticamente crea un getter por el public

        //Contract Account
        address addressContract = address(this);
        address public addressContract1 = address(this); //auttomaticamente crea un getter por el public


    // Arrays - Tamanio fijo

        //1 byte -8 bits
        bytes data1 = "9";

        //2 byte -16 bits
        bytes2 data2 = "10";

        //32 bytes
        bytes32 hola = "hello world";


        //Size
        uint public lengthData1 = data1.length; //1
        uint public lengthData2 = data2.length; //2






}