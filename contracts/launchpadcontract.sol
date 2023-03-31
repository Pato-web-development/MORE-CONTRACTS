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
     
      //mapping keeps record of every account
        mapping(address => uint256) public rewardBalance;
        mapping(address => uint256) public ETHbalance;

        function depositEther() public payable {
          ETHbalance[msg.sender] += msg.value;
          rewardBalance[msg.sender] += msg.value * 100;
           }

    function withdrawToken(uint256 amount) public {
         rewardBalance[msg.sender] -= amount * 100;
           ETHbalance[msg.sender] -= amount / 100;
        require(rewardBalance[msg.sender] >= amount * 100, "Insufficient tokens balance");
          require(ETHbalance[msg.sender] >= amount, "Insufficient balance");
         _transfer(address(this), msg.sender, amount * 100);
    }

    function userWithdrawEther(address inputAddress, uint amount) external payable{
    (bool success,) = inputAddress.call{value:amount}("");
    require(success, "the transaction has failed");
    ETHbalance[msg.sender] -= amount;
     rewardBalance[msg.sender] -= amount * 100;
        require(ETHbalance[msg.sender] >= amount, "Insufficient balance");
        require(rewardBalance[msg.sender] >= amount * 100, "Insufficient tokens balance");
}

   //will show Ether balance of the contract
   function showBalance() external view returns (uint){
    return address(this).balance;
   }

   // to make the contract send out ether... to be done by only the admin
function sendOutEther(address inputAddress, uint amount) external payable onlyOwner{
    (bool success,) = inputAddress.call{value:amount}("");
    require(success, "the transaction has failed");
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
