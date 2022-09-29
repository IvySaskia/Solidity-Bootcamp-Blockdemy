// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DataTypesReferencia{


    //Struct 
    struct Persona{
        bool vacunado;
        uint8 edad;
        bytes32 nombre;
    }

    Persona public p1 = Persona(true, 20, "Evelyn");

    Persona public p2 = Persona({
        nombre: "Zuri",
        edad: 30,
        vacunado: true
    });

    bytes32 public getNombre = p1.nombre;
    uint8 public getEdad = p1.edad;

    struct Poderes{
	    bytes32 nombrePoder;
	    int nivel;
    }

    struct Pokemon {
	    bytes32 nombrePokemon;
	    Poderes poder;
    }

    //Mapping 

    //(Llave -> Valor) = (0x623, Fernanda), (2, Itzallana), (3, Nancy)

    mapping (address => bytes32) public nombres;

    function addNombre() public{
        nombres[msg.sender] = "Fernanda";
    }

    int8 public numero2; 
    bool public flag;
 

    struct Auto{
        string tipoAuto;
        string color; 
        int8 numLlantas; 
        int8 cantidadPuertas;
        string marca;
    }

    Auto public auto1 = Auto("nuevo", "negro", 4, 4, "Nissan");
    Auto public auto2 = Auto("usado", "blanco", 4, 4, "Nissan");
    mapping (int16 => Auto) public mappingAutos; 
    //(100, auto1), (101, auto2), (103, auto3), (104, auto4)

    function addAuto() public{
        mappingAutos[100] = auto1;
        mappingAutos[101] = auto2;
    }

}

///////////////////////////////////////////////////////////////////
