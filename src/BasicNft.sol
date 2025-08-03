// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) s_tokenIdToUri;

    constructor() ERC721("Doggie", "Dog") {
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }

    // uint256 private s_tokenCounter;
    // string private constant TOKEN_URI = "ipfs://QmXnnyufdzAWLZy1f8z5b6d7c9f8e7a5b6d7c9f8e7a5b6d7c9f8e7a5b6d7c9f8e";

    // constructor() ERC721("Basic NFT", "BNFT") {
    //     s_tokenCounter = 0;
    // }

    // function mintNft() public returns (uint256) {
    //     _safeMint(msg.sender, s_tokenCounter);
    //     s_tokenCounter++;
    //     return s_tokenCounter - 1;
    // }

    // function getTokenCounter() public view returns (uint256) {
    //     return s_tokenCounter;
    // }

    // function tokenURI(uint256) public pure override returns (string memory) {
    //     return TOKEN_URI;
    // }
}
