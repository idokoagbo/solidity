// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Ipo{
    mapping(address => uint256) public balances;
    address payable wallet;

    constructor(address payable _wallet){
        wallet = _wallet;
    }

    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );

    function initiatePurchase() external payable {
        buyToken();
    }

    function buyToken() public payable {
        // assign token
        balances[msg.sender] += 1;
        // transfer ether to contract owner
        wallet.transfer(msg.value);

        emit Purchase(msg.sender, 1);
    }
}