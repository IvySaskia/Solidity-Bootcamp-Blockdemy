// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Sesion 4

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BAMToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Blockdemy community token", "BCT") {
        _mint(address(this), initialSupply);
    }
}