// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.0;

// Import ERC721 standard
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Diamond is ERC721 {
    uint256 public totalTokens; // Variable to track total minted tokens
    // Define struct to represent a diamond
    struct DiamondData {
        uint256 carat;
        string cut;
        string clarity;
        string color;
        string origin;
        bytes32 kpCertificate; // Store hash of the certificate
    }

    // Mapping to store diamond data against token IDs
    mapping(uint256 => DiamondData) public diamonds;

    constructor() ERC721("MyDiamond", "DIA") {}

    // Function to mint a new diamond token with data
    function mintDiamond(
        address owner,
        uint256 carat,
        string memory cut,
        string memory clarity,
        string memory color,
        string memory origin,
        bytes32 kpCertificate
    ) public {
        uint256 tokenId = totalTokens; // Use totalTokens instead of totalSupply
        diamonds[tokenId] = DiamondData(carat, cut, clarity, color, origin, kpCertificate);
        _mint(owner, tokenId); // Mint the token to the owner
        totalTokens++;
    }

    // Function to get diamond data by token ID
    function getDiamondData(uint256 tokenId) public view returns (DiamondData memory) {
        require(_exists(tokenId), "ERC721: operator query for nonexistent token");
        return diamonds[tokenId];
    }

   function _exists(uint tokenId) public view  returns (bool) {
        if( tokenId >=  totalTokens) {
            return  false;
            }
        if (bytes(diamonds[tokenId].origin).length == 0) {
          return false;
        }
        return true;
    }
}
