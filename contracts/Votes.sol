//////////////////////////////// votes ///////////////////////////////////////
// Sesion 5


// "SPDX-License-Identifier: MIT"
pragma solidity ^0.8.0;

// Contrato de votaciones:
    // registrar candidatos
        // iniciar votacion

    // dar derecho a alguien de votar
    // votar



contract Vote {

    struct candidatos {
        uint8 id;
        string nombre;
        string partido;
        uint256 votos;
    }

    struct Votantes {
        bool votoRegistrado;
        bool puedeVotar;
    }


    
    mapping (address => Votantes) public votantes;


    // tipo de dato - visibilidad del estado - nombre de la variable - asignacion (opcional)
    candidatos public c1; 
    candidatos public c2;

    address owner;
 

    constructor(string memory _nombre, string memory _partido, uint8 _id1, string memory _nombre2, string memory _partido2, uint8 _id2){
        
        owner = msg.sender;
        c1.nombre = _nombre;
        c1.partido = _partido;
        c1.id = _id1;

        /*
        c1 = candidatos({
            nombre: _nombre,
            partido: _partido,
            votos: 0
        });
        */
   

        c2.nombre = _nombre2;
        c2.partido = _partido2;
        c2.id = _id2;

        /*
        c2 = candidatos({
            nombre: _nombre2,
            partido: _partido2,
            votos: 0
        });
        */

    }

    // dar derecho a alguien de votar
    function derechoAVotar(address votante) public{
        require(owner == msg.sender, "No eres el INE DEX");
        votantes[votante].puedeVotar = true;
    }
    // votar
        // validar que puedes votar
        // aumentar el numero de votos por tu candidato seleccionado 

    function votar(uint8 idCandidato )public {
        require(votantes[msg.sender].puedeVotar, "No tienes derecho a votar");
       
       if(idCandidato == c1.id ){
           c1.votos += 1;
       } else {
           c2.votos += 1;
       }

    }
} 
