import { ethers } from "hardhat";
async function main() {
    const [owner] = await ethers.getSigners();
    const getcontract = await ethers.getContractFactory("Web3Token");
    const deploycontract = await getcontract.deploy();
    const deployedcontract = await deploycontract.deployed();
    const getcontractaddress = deployedcontract.address;
    console.log(`This is my token on ${getcontractaddress}`);
    
    const getUSDTcontractAddress = await ethers.getContractAt("IERC20", "0x337610d27c682E347C9cD60BD4b3b107C9d34dDd");
    getUSDTcontractAddress.approve(getcontractaddress, ethers.utils.parseUnits("100000000", 18));

    const getBUSDcontractAddress = await ethers.getContractAt("IERC20", "0xeD24FC36d5Ee211Ea25A80239Fb8C4Cfd80f12Ee");
    getBUSDcontractAddress.approve(getcontractaddress, ethers.utils.parseUnits("100000000", 18));

    const getPATOcontractAddress = await ethers.getContractAt("IERC20", "0x64544969ed7EBf5f083679233325356EbE738930");
    getPATOcontractAddress.approve(getcontractaddress, ethers.utils.parseUnits("100000000", 18));
    }

    // We recommend this pattern to be able to use async/await everywhere
    // and properly handle errors.
    main().catch((error) => {
        console.error(error);
        process.exitCode = 1;
        });