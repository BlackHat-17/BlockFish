# Trade Finance Tokenization Prototype

This prototype demonstrates a **minimum viable tokenization** model for trade finance using Ethereum-based smart contracts. It implements token standards (ERC-721, ERC-1400-compatible structure), digital identity, and automated payment via smart contracts.

---

## Features

### 1. Tokenized Invoices (ERC-721)
- Unique, traceable invoice tokens
- Can be uploaded, financed, and transferred between parties

### 2. Tokenized Bills of Lading (ERC-721)
- Represents goods shipment
- Enables conditional payment upon BoL transfer

### 3. Tokenized Letters of Credit / Guarantees (ERC-1400-Ready)
- Structured for compliance and permissioned transfers (future extension)

### 4. Simplified Digital Identity Registry
- Register participants as buyers, sellers, or banks
- Basic role-based access control

### 5. Smart Contract for Automated Payment
- Automatically transfers invoice token when BoL ownership changes
- Demonstrates programmable logic for trustless settlement

---

## Smart Contracts

- `InvoiceToken.sol` – Tokenizes invoices (ERC-721)
- `BoLToken.sol` – Tokenizes Bills of Lading (ERC-721)
- `IdentityRegistry.sol` – Manages participant roles and addresses
- `BoLPaymentAutomation.sol` – Releases payment upon BoL transfer

---

## Getting Started

### Prerequisites
- Node.js + Hardhat
- MetaMask or Web3 wallet
- Ethereum testnet (e.g., Sepolia, Goerli)
