import { ethers } from "hardhat";
async function main() {
    const [owner] = await ethers.getSigners();
    const getcontract = await ethers.getContractFactory("theparameters");
    const deploycontract = await getcontract.deploy();
    const deployedcontract = await deploycontract.deployed();
    const getcontractaddress = deployedcontract.address;
    console.log("So we can add this parameter and argument contract to another contract address " + getcontractaddress );
    console.log(await deployedcontract.ourparameters("volleyball")); 
    console.log("another function here for the game " + await deployedcontract.viewparametersandarguments());
    }
    //console.log only affects our local machine or the user's local machine
    // We recommend this pattern to be able to use async/await everywhere
    // and properly handle errors.
    main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
    });