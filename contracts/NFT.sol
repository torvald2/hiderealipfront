// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@5.0.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@5.0.0/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts@5.0.0/access/Ownable.sol";

contract HideIP is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {


    uint256 public constant ONE_MONTH_PRICE = 1 ether;  
    uint256 public constant THREE_MONTHS_PRICE = 2 ether ;
    uint256 public constant SIX_MONTHS_PRICE = 4 ether;
    uint256 public constant TWELVE_MONTHS_PRICE = 8 ether;
    uint256 public constant TWENTY_FOUR_MONTHS_PRICE = 12 ether;

    event InvalidMonthsError(uint8 months);

    event IncorrectPaymentError(uint256 sentValue, uint256 expectedValue);

    mapping(uint8 => string) public metadataLinks;

    uint256 public totalSupply;


    constructor(address initialOwner)
        ERC721("MyToken", "MTK")
        Ownable(initialOwner)
    {
        metadataLinks[1] = "ipfs://bafkreiefnfgapjifvjzkrycfho375w33ee4xfwnfohksrewkr24ut24zsq";
        metadataLinks[3] = "ipfs://bafkreib24gavleokcqo5e4disisoqeo2u5ap2d754f3xabblpgmyi43muq";
        metadataLinks[6] = "ipfs://bafkreidltwuik4dv2u24krfeu6rfms3yngx6qsgjhug65n6vyr2nhm2lby";
        metadataLinks[12] = "ipfs://bafkreid2bdmahsyugb2k2knhxnxv6q6pqalwjrwbaq5l5t6et77ryr7bje";
        metadataLinks[24] = "ipfs://bafkreie6femojqz2ecpkldaue4izrgdwa266zf2oqnyqr7scuemb3xlfhi";
    }

   
     function mintToCaller(uint8 months)
        payable 
        public
        
    {
        if (!(months == 1 || months == 3 || months == 6 || months == 12 || months == 24)) {
            emit InvalidMonthsError(months);
            revert("Invalid number of months");
        }
        

        if (msg.value != calculatePrice(months)) {
            emit IncorrectPaymentError(msg.value, calculatePrice(months));
            revert("Incorrect payment");
        }
        totalSupply = totalSupply + 1;
        string memory metadataLink = metadataLinks[months];

        _safeMint(msg.sender, totalSupply);
        _setTokenURI(totalSupply, metadataLink);
    }


    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function calculatePrice(uint8 months) internal pure returns (uint256) {
        
        if (months == 1) {
            return ONE_MONTH_PRICE;
        } else if (months == 3) {
            return THREE_MONTHS_PRICE;
        } else if (months == 6) {
            return SIX_MONTHS_PRICE;
        } else if (months == 12) {
            return TWELVE_MONTHS_PRICE;
        } else {
            return TWENTY_FOUR_MONTHS_PRICE;
        }
    }

}

