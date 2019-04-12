var SolnSquareVerifier = artifacts.require('SolnSquareVerifier');
var SquareVerifier = artifacts.require('SquareVerifier');
var proof = require('./proof.json');
var truffleAssert = require('truffle-assertions');

contract('SolnSquareVerifier', accounts => {

    const account_one = accounts[0];
    const account_two = accounts[1];

    describe('Testing SolnSquareVerifier mint', async () => {
        beforeEach(async function () {
            let squareVerifier = await SquareVerifier.new(account_one);
            this.contract = await SolnSquareVerifier.new(squareVerifier.address, {from: account_one});
        });
        // Test if a new solution can be added for contract - SolnSquareVerifier
        // Test if an ERC721 token can be minted for contract - SolnSquareVerifier
        it('ERC721 token can be minted', async function () {
            let tokenId = 21;
            await this.contract.mintNewNFT(
                account_one,
                tokenId,
                proof.proof.A,
                proof.proof.A_p,
                proof.proof.B,
                proof.proof.B_p,
                proof.proof.C,
                proof.proof.C_p,
                proof.proof.H,
                proof.proof.K,
                proof.input,
                {from: account_one}
            );
            let result = await this.contract.ownerOf(tokenId);
            assert.equal(result , account_one, "Invalid token owner");
        });
    });
});