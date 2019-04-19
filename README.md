# Capstone Project

Decentralized housing product on the Ethereum blockchain using docker and Zokrates

## Setup project:
__Notes:__ The project has been tested with __Truffle v5.0.4__, __Solidity 0.5.2__ and __npm v10.15.1__
1. Clone the repository
2. Run command __npm install__ to install the project dependencies.
3. Create an .env file in the __eth-contracts__ folder and add you Infura API KEY:<br />
   __INFURA_KEY=YOUR_INFURA_API_KEY__
4. Create a __.secret__ file in the __eth-contracts__ folder and add your wallet seed.

## Generating proof
See [ZoKrates](https://github.com/Zokrates/ZoKrates) documentation

## Testing
1. cd eth-contracts
2. truffle compile --all
3. truffle dev
4. test

## Migrating to Rinkeby
1. cd eth-contracts
2. Make sure to update your seed and infura key as in the setup instructions
3. truffle compile --all
4. truffle migrate --reset --network rinkeby

## Minting token
1. Update the __prooofs__ variable inside the __./app/js/app.js__ file
2. __npm run dev__ to start a very basic front-end dapp

## Contract on Rinkeby

| Contract             | Address on Rinkeby test network                                    | 
|----------------------|--------------------------------------------------------------------|
| SquareVerifier       | 0x846F4f6FCF11BafC1D78bD70dfc63AdE741F6f57                         |
| SolnSquareVerifier   | 0xfd1eD88a56882627a12d010efe58D11092906167                         |

## ABIs

| Contract             | ABI path                                                           | 
|----------------------|--------------------------------------------------------------------|
| SquareVerifier       | ./eth-contracts/build/contracts/SquareVerifier.json                |
| SolnSquareVerifier   | ./eth-contracts/build/contracts/SolnSquareVerifier.json            |


## Opensea storefront

https://rinkeby.opensea.io/category/immotokenv2


# Project Resources

* [Remix - Solidity IDE](https://remix.ethereum.org/)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Truffle Framework](https://truffleframework.com/)
* [Ganache - One Click Blockchain](https://truffleframework.com/ganache)
* [Open Zeppelin ](https://openzeppelin.org/)
* [Interactive zero knowledge 3-colorability demonstration](http://web.mit.edu/~ezyang/Public/graph/svg.html)
* [Docker](https://docs.docker.com/install/)
* [ZoKrates](https://github.com/Zokrates/ZoKrates)
