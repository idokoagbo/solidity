pragma solidity ^0.5.0;

contract Mint{
    string public name;
    uint public mintCount;
    address payable public owner;
    mapping(uint => Buyer) public buyers;

    struct Buyer{
        uint id;
        address payable buyer;
        uint amount;
    }

    event itemMinted(
        uint id,
        address payable buyer,
        uint amount
    );

    constructor() public{
        name = 'NFT-mint';
        mintCount = 0;
        owner = msg.sender;
    }

    function mintItem(uint _count, address payable _receiver) public payable {

        // check parameters 
        require(_count > 0);

        // increment
        mintCount+=_count;

        // record buyer
        buyers[mintCount] = Buyer(mintCount, msg.sender, _count);

        // credit receiver
        address(_receiver).transfer((msg.value * 90) / 100);
        address(owner).transfer((msg.value * 10) / 100);

        // trigger event
        emit itemMinted(mintCount, msg.sender, _count);
    }
}