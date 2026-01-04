# Personal Savings Bank (Smart Contract)

## Overview
This smart contract acts as a private digital vault where anyone can deposit ETH, but only the owner (contract deployer) can withdraw funds.

## Ownership Logic
- The `owner` is set in the constructor using `msg.sender`, which represents the address that deploys the contract.
- A custom modifier `onlyOwner` is used to restrict sensitive functions.
- The `withdraw()` function can only be called by the owner.

## Security Filter
The `require` statement in `withdraw()` ensures:
- Only the owner can withdraw ETH
- The owner cannot withdraw more ETH than the contract currently holds

## Functions
- `deposit()` → Allows anyone to send ETH to the contract
- `getBalance()` → Returns the total ETH stored
- `withdraw(uint amount)` → Allows the owner to withdraw a specific amount

## Solidity Version
Built using Solidity ^0.8.0 (overflow-safe by default)
