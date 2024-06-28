# KG_DAO Project

## Introduction

The KG_DAO project is a decentralized autonomous organization (DAO) built using Solidity smart contracts and deployed via Hardhat. This DAO is designed to manage various aspects of a blockchain-based project, including governance, proposal management, and access control through a timelock mechanism. It comprises several key components:

- **GovToken**: An ERC20 token that serves as the governance token, allowing holders to vote on proposals.
- **TimeLock**: Manages the execution timing of proposals, ensuring that actions are taken after a specified delay.
- **KG_Governor**: Orchestrates the governance process, handling proposal submission, voting, and decision-making.
- **Box**: Represents a simple contract within the DAO's ecosystem, subject to governance and operational controls.

## Overview

### Contracts

#### 1. GovToken
An ERC20 token with enhanced functionality for governance purposes. Token holders can participate in voting to influence decisions within the DAO.

#### 2. TimeLock
A contract that introduces a delay mechanism for executing proposals. This ensures that significant actions within the DAO are carefully considered and executed at an appropriate time.

#### 3. KG_Governor
Serves as the central governance contract. It facilitates the creation, voting, and execution of proposals, ensuring that all decisions are made democratically and transparently.

#### 4. Box
A versatile contract that can be customized for various uses within the DAO. Its operations are governed by the DAO's governance mechanisms.

## Getting Started

To get started with the KG_DAO project, you'll need to have Node.js (version 12 or later) installed on your machine, along with either npm or yarn for package management.

### Prerequisites

- Node.js (v12 or later)
- npm or yarn

### Installation

1. **Clone the Repository**

First, clone the KG_DAO project repository to your local machine:

 git clone https://github.com/Saiwebdev2005/KG_DAO_Contract.git cd KG_DAO_Contract

2. **How it works**

The deployment script performs the following actions:

- Deploys the GovToken contract.
- Deploys the TimeLock contract.
- Deploys the KG_Governor contract, passing the addresses of GovToken and TimeLock.
- Deploys the Box contract.
- Sets up roles in the TimeLock contract.
- Saves deployment information and ABIs to the `deployments` folder.

## Contributing

Contributions to the KG_DAO project are welcome. Please feel free to submit pull requests or open issues for discussion.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
