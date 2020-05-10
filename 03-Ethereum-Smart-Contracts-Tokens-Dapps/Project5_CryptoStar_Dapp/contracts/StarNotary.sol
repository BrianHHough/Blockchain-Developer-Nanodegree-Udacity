pragma solidity >=0.4.24;

//Importing openzeppelin-solidity ERC-721 implemented Standard
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

// StarNotary Contract declaration inheritance the ERC721 openzeppelin implementation
contract StarNotary is ERC721 {

    // Star data
    struct Star {
        string name;
    }

    // Implement Task 1 Add a name and symbol properties
    // name: Is a short name to your token
    string public name = "Interstellars";
    // symbol: Is a short string like 'USD' -> 'American Dollar'
    string public symbol = "INTX";

    // mapping the Star with the Owner Address
    mapping(uint256 => Star) public tokenIdToStarInfo;
    // mapping the TokenId and price
    mapping(uint256 => uint256) public starsForSale;
    // Create Star using the Struct
    function createStar(string memory _name, uint256 starTokenID) public { // Passing the name and tokenId as a parameters
        Star memory newStar = Star(_name); // Star is an struct so we are creating a new Star
        tokenIdToStarInfo[starTokenID] = newStar; // Creating in memory the Star -> tokenId mapping
        _mint(msg.sender, starTokenID); // _mint assign the the star with _tokenId to the sender address (ownership)
    }

    // Putting a Star for sale (Adding the star tokenid into the mapping starsForSale, first verify that the sender is the owner)
    function putStarUpForSale(uint256 starTokenID, uint256 _price) public {
        require(ownerOf(starTokenID) == msg.sender, "You can't sale a star that you don't own");
        starsForSale[starTokenID] = _price;
    }


    // Function that allows you to convert an address into a payable address
    function _make_payable(address x) internal pure returns (address payable) {
        return address(uint160(x));
    }

    function buyStar(uint256 starTokenID) public  payable {
        require(starsForSale[starTokenID] > 0, "The Star should be up for sale on StarNotary!");
        uint256 starCost = starsForSale[starTokenID];
        address ownerAddress = ownerOf(starTokenID);
        require(msg.value > starCost, "You need to have enough Ether to purchase this one!");

        // We can't use _addTokenTo or_removeTokenFrom functions, now we have to use _transferFrom
        _transferFrom(ownerAddress, msg.sender, starTokenID);

        // We need to make this conversion to be able to use transfer() function to transfer ethers
        address payable ownerAddressPayable = _make_payable(ownerAddress);
        ownerAddressPayable.transfer(starCost);
        if(msg.value > starCost) {
            msg.sender.transfer(msg.value - starCost);
        }
    }

    // Implement Task 1 lookUptokenIdToStarInfo
    function lookUptokenIdToStarInfo (uint starTokenID) public view returns (string memory) {
        //1. You should return the Star saved in tokenIdToStarInfo mapping
        return tokenIdToStarInfo[starTokenID].name;
    }

    // Implement Task 1 Exchange Stars function
    function exchangeStars(uint256 starTokenID1, uint256 starTokenID2) public {
        //1. Passing to star tokenId you will need to check if the owner of _tokenId1 or _tokenId2 is the sender
        if (msg.sender != ownerOf(starTokenID1) && msg.sender != ownerOf(starTokenID2)) {
            revert("You must be an owner of one of these stars to exchange it");
        }
        // Get address of two potential wallets
        address OwnerStar1 = ownerOf(starTokenID1);
        address OwnerStar2 = ownerOf(starTokenID2);
        //2. You don't have to check for the price of the token (star)
        if (OwnerStar1 == OwnerStar2) {
            revert("You already own both of these stars in the sky");
        }
        //3. Get the owner of the two tokens (ownerOf(_tokenId1), ownerOf(_tokenId1)
        //4. Use _transferFrom function to exchange the tokens.
        _transferFrom(OwnerStar1, OwnerStar2, starTokenID1);
        _transferFrom(OwnerStar2, OwnerStar1, starTokenID2);
    }

    // Implement Task 1 Transfer Stars
    function transferStar(address _to1, uint256 starTokenID) public {
        //1. Check if the sender is the ownerOf(_tokenId)
        if (msg.sender != ownerOf(starTokenID)) {
            revert("You must be one of these stars in the sky to exchange them!");
        }
        // address OwnerStar = ownerOf(_starTokenID);
        // require(msg.sender == OwnerStar, "You don't own these stars!");
        //2. Use the transferFrom(from, to, tokenId); function to transfer the Star
        _transferFrom(msg.sender, _to1, starTokenID);
    }

}