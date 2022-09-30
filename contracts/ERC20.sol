
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// interface - ERC 165 

interface IERC20 {
    function totalSupply() external  view returns (uint256);
    function balanceOf(address _owner) external view returns (uint256 balance);
    function transfer(address _to, uint256 _value) external  returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
    function approve(address _spender, uint256 _value) external  returns (bool success);
    function allowance(address _owner, address _spender) external  view returns (uint256 remaining);
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract ERC20 is IERC20 {
    
    // variables
    string public constant name = "Blockdemy Comunnity Token";
    string public constant symbol = "BCT";
    uint8 public constant decimals = 18;

    uint256 constant _totalSupply = 1000 ether;
    /*
    uint256 _totalSupply = 1000 * 1e18;
    uint256 _totalSupply = 1000 * 1*10**18;
    uint256 _totalSupply = 1000 * 1*10**decimals();
    */

    mapping(address => uint256) balances;
    // Allowed
    // owner => spender => valor
    // spender => owner => valor
    mapping(address => mapping(address => uint256) )allowed;

    constructor() {
        balances[address(this)] = _totalSupply; // total supply para el contrato
        //balances[msg.sender] = _totalSupply; total supply para el owner
    }

    // funciones

    function totalSupply() public override view returns(uint256){
        return _totalSupply;
    }

    function balanceOf(address _owner) public override view returns (uint256 balance){
        return balances[_owner];
    }

    /* Transfer function
        verificar que el numero de tokens es menor o igual al balance de quien envia
        actualizas balance de quien envia
        actualizas balance de quien recibe
        emitir el evento transfer
        retornamos true

    
    */

    function transfer(address _to, uint256 _value) public override  returns (bool success){
        require(balances[msg.sender] <= _value, "No te alcanza para transferir");
        balances[msg.sender] -= _value; // Esta notacion tambien es valida: balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] += _value; // Esta notacion tambien es valida: balances[_to] = balances[_to] + _value;
        emit Transfer( msg.sender, _to, _value);
        return true;
    }

    // transferFrom
    /*
        verificar que el numero de tokens a enviar sean igual o menor que el balance del owner
        verificar que el numero de tokens a enviar sean igual o menor que los permitidos por el owner
        
        actualizar el balance de quien envia 
        actualizar el balance de allowance del spender
        actualizar el balance del _to
        emitir el vento transfer
        retornar true

    */

    function transferFrom(address _from, address _to, uint256 _value) public override returns (bool success){
        require(balances[_from] <= _value, "No le alcanza al owner para transferir");
        require(allowed[_from][msg.sender] <= _value, "El owner no te ha dado permiso de gastar esta cantidad");

        balances[_from] -= _value; 
        allowed[_from][msg.sender] -= _value;
        balances[_to] += _value; 

        emit Transfer( _from, _to, _value);
        return true;

    }

    /* aprove function
    verificar que se tiene la cantidad dictaminada a gastar
    actualizar el mapping del allowed con el address del dueño y despues del spender igual al numero de tokens a gastar owner => spender => valor
    emitimos el evento aproval
    retornamos true
    
    */

    function approve(address _spender, uint256 _value) public override  returns (bool success){
        require(balances[msg.sender] <= _value, "No te alcanza para permitir gastar a alguien mas");
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public override  view returns (uint256 remaining){
        return allowed[_owner][_spender];
    }
}