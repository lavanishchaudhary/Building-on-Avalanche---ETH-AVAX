// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    address private owner;

    constructo() ERC20("Degen Token", "DGN") {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }
    
    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function redeem() public {
        _burn(msg.sender, 100);
    }

    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    function burn() public {
        _burn(msg.sender, 100);
    }
}
