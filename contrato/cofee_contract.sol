// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importamos la implementación auditada de OpenZeppelin
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/access/Ownable.sol";

/// @title CoffeeChain Loyalty Token
/// @notice Token ERC‑20 para recompensar clientes de CoffeeChain S.A.
contract CoffeeChainToken is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("CoffeeChain Token", "CFT") {
        // Al desplegar, mint inicial al creador (plataforma)
        _mint(msg.sender, initialSupply);
    }

    /// @notice La empresa (owner) puede acuñar más tokens para recompensas
    function mintRewards(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
}
}