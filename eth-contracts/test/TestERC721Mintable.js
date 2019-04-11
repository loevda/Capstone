/*var ERC721MintableComplete = artifacts.require('SolnSquareVerifier');*/
var ImmoERC721Token = artifacts.require('ImmoERC721Token');
var BigNumber = require('bignumber.js');

contract('TestERC721Mintable', accounts => {

    const account_one = accounts[0];
    const account_two = accounts[1];

    describe('match erc721 spec',  async () => {
        beforeEach(async function () { 
            this.contract = await ImmoERC721Token.new({from: account_one});
            // TODO: mint multiple tokens
            for(let i = 1; i < 10; i++) {
                try {
                    await this.contract.mint(account_one, i, {from: account_one});
                    //console.log(i);
                } catch(error) {
                    console.log(error.toString());
                }

            }
        })

        it('should return total supply', async function () {
            let num = await this.contract.totalSupply();
            assert.equal(num, 9, "Incorrect total supply");
        })

        it('should get token balance', async function () {
            let num = await this.contract.balanceOf(account_one);
            assert.equal(num, 9, "Incorrect token balance");
        })

        // token uri should be complete i.e: https://s3-us-west-2.amazonaws.com/udacity-blockchain/capstone/1
        it('should return token uri', async function () {
            let uri = await this.contract.tokenURI(1);
            assert.equal(uri,
                "https://s3-us-west-2.amazonaws.com/udacity-blockchain/capstone/1",
                "Incorrect URI");
        })

        it('should transfer token from one owner to another', async function () {
            let result = undefined;
            try {
                await this.contract.safeTransferFrom(account_one, account_two, 1);
                // check new owenership
                result = await this.contract.ownerOf(1);
            }catch(error) {
                console.log(error.toString());
            }
            // check owner
            assert.equal(result, account_two, "Incorrect token balance");
        })
    });

    describe('have ownership properties', async () => {
        beforeEach(async function () { 
            this.contract = await ImmoERC721Token.new({from: account_one});
        })

        it('should fail when minting when address is not contract owner', async function () {
            let result = undefined;
            try {
                result = await this.contract.mint(account_two, 122, {from: account_two});
                //console.log(i);
            } catch(error) {
                result = false;
            }
            assert.equal(result, false, "Only contract owner should be able to mint token");
        })

        it('should return contract owner', async function () { 
            let result = await this.contract.owner();
            assert.equal(result, account_one, "Invalid contract owner");
        })

    });
})