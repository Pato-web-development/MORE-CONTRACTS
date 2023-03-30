import { ethers } from "hardhat";
async function main() {
    const [owner] = await ethers.getSigners();
    const getcontract = await ethers.getContractFactory("Lottery");
    const deploycontract = await getcontract.deploy(ethers.utils.parseUnits("10", 18), "15", "0xeDceC4Bce45bB9eEEc775e4d1D65E63751C79003");
    const deployedcontract = await deploycontract.deployed();
    const getcontractaddress = deployedcontract.address;
    console.log(`This is the script of the code right here @ ${getcontractaddress}`);
   

    


}

    // We recommend this pattern to be able to use async/await everywhere
    // and properly handle errors.
    main().catch((error) => {
        console.error(error);
        process.exitCode = 1;
        });