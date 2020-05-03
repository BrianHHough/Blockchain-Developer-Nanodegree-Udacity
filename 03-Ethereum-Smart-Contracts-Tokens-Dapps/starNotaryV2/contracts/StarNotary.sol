pragma solidity ^0.6.0;

// import this so we can call functions on it
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

// how we define interfaces (inherit)
abstract contract StarNotary is ERC721 {

    // hold name of star here
    struct Star {
        string name;
    }

    // two mappings: 1st stores token ID of the star as the `key` and the star details as the `value`; 2nd stores stars up for sale, star price as value
    mapping(uint256 => Star) public tokenIdToStarInfo;
    mapping(uint256 => uint256) public starsForSale;


    // Create Star using the Struct
    function createStar(string memory _name, uint256 _tokenId) public { // Passing the name and tokenId as a parameters
        Star memory newStar = Star(_name); // Star is an struct so we are creating a new Star
        tokenIdToStarInfo[_tokenId] = newStar; // Creating in memory the Star -> tokenId mapping
        _mint(msg.sender, _tokenId);
        // _mint assign the the star with _tokenId to the sender address (ownership) - mints new tokens and adds them to the notary
    }

    // Putting an Star for sale (Adding the star tokenid into the mapping starsForSale, first verify that the sender is the owner)
    function putStarUpForSale(uint256 _tokenId, uint256 _price) public {
        require(ownerOf(_tokenId) == msg.sender, "You can't sale the Star you don't owned");
        starsForSale[_tokenId] = _price;
    }


    // Function that allows you to convert an address into a payable address
    function _make_payable(address x) internal pure returns (address payable) {
        return address(uint160(x));
    }

    // get tokenID of the star we want to buy -
    function buyStar(uint256 _tokenId) public  payable {
        require(starsForSale[_tokenId] > 0, "The Star should be up for sale"); // greater than 0 means up for sale
        uint256 starCost = starsForSale[_tokenId];
        address ownerAddress = ownerOf(_tokenId);
        // so we can send the funds to
        require(msg.value > starCost, "You need to have enough Ether");
        // whatever the msg.value is, it's greater than the starCost to ensure purchase
        transferFrom(ownerAddress, msg.sender, _tokenId);
        // We can't use _addTokenTo or_removeTokenFrom functions, now we have to use _transferFrom
        address payable ownerAddressPayable = _make_payable(ownerAddress);
        // We need to make this conversion to be able to use transfer() function to transfer ethers
        ownerAddressPayable.transfer(starCost);
        if(msg.value > starCost) {
            msg.sender.transfer(msg.value - starCost);
        }
    }

}