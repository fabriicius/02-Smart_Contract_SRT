// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface IERC20 {
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
    function decimals() external view returns(uint);
}

contract ServiceTokenSale  {

    uint ServiceTokenInWei = 1 ether;
    IERC20 token ;
    address public tokenOwner;

    constructor(address _token){
        tokenOwner = msg.sender;
        token = IERC20(_token);
    }

    function addService() public payable {
        require(msg.value >= ServiceTokenInWei, "Not enough money sent");
        uint tokensToTransfer = msg.value / ServiceTokenInWei;
        uint remainder = msg.value - tokensToTransfer * ServiceTokenInWei;
        token.transferFrom(tokenOwner , msg.sender, tokensToTransfer * 10 ** token.decimals());
        payable(msg.sender).transfer(remainder);
    }
    
}
