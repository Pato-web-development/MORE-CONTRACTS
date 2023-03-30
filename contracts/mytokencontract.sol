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

contract SafeFinance5 is ERC20, ERC20Burnable, ERC20Snapshot, Ownable, Pausable, ERC20Permit, ERC20Votes {
    constructor() ERC20("Safe Finance", "SFC12") ERC20Permit("Safe Finance") {
        _mint(address(this), 100000000 * 10 ** decimals());
    }

    function buyTokenWithToken(address _tokenContractAddress, uint256 _tokenAmount) internal {
        IERC20(_tokenContractAddress).transferFrom(msg.sender, address(this), _tokenAmount * 10 ** decimals());
        uint256 mintMyTokenAmount = (100 * _tokenAmount * 10 ** decimals());
        _transfer(address(this), msg.sender, mintMyTokenAmount);
        }

        function buyTokenWithUSDT(uint256 _tokenAmount) public {
        buyTokenWithToken(0x337610d27c682E347C9cD60BD4b3b107C9d34dDd, _tokenAmount);
    }

     function buyTokenWithBUSD(uint256 _tokenAmount) public {
        buyTokenWithToken(0xeD24FC36d5Ee211Ea25A80239Fb8C4Cfd80f12Ee, _tokenAmount);
    }

     function buyTokenWithUSDC(uint256 _tokenAmount) public {
        buyTokenWithToken(0x64544969ed7EBf5f083679233325356EbE738930, _tokenAmount);
    }

     function buyTokenWithPATO(uint256 _tokenAmount) public {
        buyTokenWithToken(0x532DDd8581481DB7e5c4A0E0a213BeE8A8717e78, _tokenAmount);
    }

   function transferToken(address _tokenContractAddress, address _receivingAddress, uint256 _tokenAmount) public onlyOwner {
        IERC20(_tokenContractAddress).transfer(_receivingAddress, _tokenAmount * 10 ** decimals());
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
