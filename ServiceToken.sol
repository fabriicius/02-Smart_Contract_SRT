// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract ServiceToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    event ServicePurchased(address indexed  receiver , address indexed  buyer);

    constructor() ERC20("ServiceToken", "SRT") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount * 10 ** decimals());
    }

    function buy_ONE_service() public {
        _burn(_msgSender(), 1 * 10 ** decimals());
        emit ServicePurchased(_msgSender(), _msgSender());
    }

    function buy_ONE_service_From(address account) public {
        _spendAllowance(account, _msgSender(), 1 * 10 ** decimals());
        _burn(_msgSender(), 1 * 10 ** decimals());
        emit ServicePurchased(_msgSender(), account);
    }

}
