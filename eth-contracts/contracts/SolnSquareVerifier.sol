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
        address to;
    }

    // TODO define an array of the above struct
    Solution[] private solutions;

    // TODO define a mapping to store unique solutions submitted
    mapping(bytes32 => Solution) private solutionsMap;


    // TODO Create an event to emit when a solution is added
    event SolutionAdded(uint256 _tokenId, address _to);

    // TODO Create a function to add the solutions to the array and emit the event
    function addSolution(uint256 _tokenId, address _to, bytes32 _k) internal {
        Solution memory solution = Solution({tokenId: _tokenId, to: _to});
        solutions.push(solution);// what for?
        solutionsMap[_k] = solution;
        emit SolutionAdded(_tokenId, _to);
    }


    // TODO Create a function to mint new NFT only after the solution has been verified
    //  - make sure the solution is unique (has not been used before)
    //  - make sure you handle metadata as well as tokenSuplly
    function mintNewNFT
    (
        address to,
        uint256 tokenId,
        uint[2] memory a,
        uint[2] memory a_p,
        uint[2][2] memory b,
        uint[2] memory b_p,
        uint[2] memory c,
        uint[2] memory c_p,
        uint[2] memory h,
        uint[2] memory k,
        uint[2] memory input
    )
    public
    {
        require(squareVerifier.verifyTx(a, a_p, b, b_p, c, c_p, h, k, input),
            "Verification has failed.");
        bytes32 _k = keccak256(abi.encodePacked(a, a_p, b, b_p, c, c_p, h, k, input));
        require(solutionsMap[_k].to == address(0), "Solution already exists");
        addSolution(tokenId, to, _k);
        super.mint(to, tokenId);
    }
}
























