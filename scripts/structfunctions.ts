import { ethers } from "hardhat";
async function main() {
    const [owner] = await ethers.getSigners();
    const getcontract = await ethers.getContractFactory("structfunctions");
    const deploycontract = await getcontract.deploy();
    const deployedcontract = await deploycontract.deployed();
    const getcontractaddress = deployedcontract.address;
    console.log("So we can add this struct function to another contract address " + getcontractaddress);
    console.log(await deployedcontract.changeleader("OBJ"));
    console.log(await deployedcontract.showdetails());
    const leader = await deployedcontract.showleader();
    console.log(leader);
    console.log(await deployedcontract.showparty());
    }
    

    // We recommend this pattern to be able to use async/await everywhere
    // and properly handle errors.
    main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
    });