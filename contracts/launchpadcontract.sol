// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract LaunchPadToken is ERC20, ERC20Burnable, ERC20Snapshot, Ownable, Pausable, ERC20Permit, ERC20Votes {
    constructor() ERC20("Launch Finance", "LFINANCE") ERC20Permit("Launch Finance") {
        _mint(address(this), 100000000 * 10 ** decimals());
    }

    function receiveBNB(uint256 amount) public payable {
      uint256 _tokenAmount = amount* 10 ** decimals();
    uint256 sendMyTokenAmount = (100 * _tokenAmount * 10 ** decimals());
     _transfer(address(this), msg.sender, sendMyTokenAmount);
    }
    //this shows the Ether balance of my contract
   function showBalance() external view returns (uint){
    return address(this).balance;
   }

   function userWithdrawMyToken() public {}

   // to make the contract send out ether
function sendOutBNB(address payable amount) external payable onlyOwner{
    (bool success,) = amount.call{value:msg.value}("");
    require (success, "the transaction has failed");
}
       
    function snapshot() public onlyOwner {
        _snapshot();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}
