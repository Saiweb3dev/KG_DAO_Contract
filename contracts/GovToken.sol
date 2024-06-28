// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

// GovToken contract inherits from ERC20, Ownable, ERC20Permit, and ERC20Votes
contract GovToken is ERC20, Ownable, ERC20Permit, ERC20Votes {
    // Constructor sets the token name, symbol, initial owner, and initializes ERC20Permit
    constructor(address initialOwner)
        ERC20("KG_Decentralized_Token", "KGT")
        Ownable(initialOwner)
        ERC20Permit("KG_Decentralized_Token")
    {}

    // Function to mint new tokens, only callable by the owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Override required by Solidity to update token balances and voting power
    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Votes)
    {
        super._update(from, to, value);
    }

    // Override required by Solidity to handle nonces for ERC20Permit
    function nonces(address owner)
        public
        view
        override(ERC20Permit, Nonces)
        returns (uint256)
    {
        return super.nonces(owner);
    }
}