import {ethers} from "hardhat";
async function main() {
    const [owner] = await ethers.getSigners();
    const getcontract = await ethers.getContractFactory("randomnumbers");
    const deploycontract = await getcontract.deploy();
    const deployedcontract = await deploycontract.deployed();
    const getcontractaddress = deployedcontract.address;
    console.log(`We are just getting started, we are coming for Polygon, but 
    we just deployed at ${getcontractaddress}`);
    console.log(await deployedcontract.makerandomnum());
    console.log(await deployedcontract.viewrandomnum());
    
}

  // We recommend this pattern to be able to use async/await everywhere
    // and properly handle errors.
    main().catch((error) => {
        console.error(error);
        process.exitCode = 1;
        });