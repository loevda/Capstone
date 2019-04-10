pragma solidity >=0.4.21 <0.6.0;

import "./ERC721Mintable.sol";
import "./Verifier.sol";

// TODO define a contract call to the zokrates generated solidity contract <Verifier> or <renamedVerifier>
contract SquareVerifier is Verifier {}
// TODO define another contract named SolnSquareVerifier that inherits from your ERC721Mintable class
contract SolnSquareVerifier is ImmoERC721Token {

    SquareVerifier squareVerifier;

    constructor (address _squareVerifier) public {
        squareVerifier = SquareVerifier(_squareVerifier);
    }

    // TODO define a solutions struct that can hold an index & an address
    struct Solution {
        uint256 tokenId;
        address owner;
    }

    // TODO define an array of the above struct
    Solution[] private solutions;

    // TODO define a mapping to store unique solutions submitted
    mapping(bytes32 => Solution) private solutionsMap;


    // TODO Create an event to emit when a solution is added
    event SolutionAdded(uint256 _tokenId, address _owner);

    // TODO Create a function to add the solutions to the array and emit the event
    function addSolution(uint256 _tokenId, address _owner) public {
        solutions.push(Solution(_tokenId, _owner));
        emit SolutionAdded(_tokenId, _owner);
    }


    // TODO Create a function to mint new NFT only after the solution has been verified
    //  - make sure the solution is unique (has not been used before)
    //  - make sure you handle metadata as well as tokenSuplly
    function mintNewNFT() public pure {

    }

}
























