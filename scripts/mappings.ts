import { ethers } from "hardhat";
async function main() {
    const [owner] = await ethers.getSigners();
    const getcontract = await ethers.getContractFactory("themapping");
    const deploycontract = await getcontract.deploy();
    const deployedcontract = await deploycontract.deployed();
    const getcontractaddress = deployedcontract.address;
    console.log(`This is the mapping script right here @ ${getcontractaddress}`);
    console.log(await deployedcontract.addvalues(5, "five"));
    console.log(await deployedcontract.getvalues(5));
    console.log(await deployedcontract.getvalues(4));

}

    // We recommend this pattern to be able to use async/await everywhere
    // and properly handle errors.
    main().catch((error) => {
        console.error(error);
        process.exitCode = 1;
        });