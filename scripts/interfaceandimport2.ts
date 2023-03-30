import { ethers } from "hardhat";
async function main(){
const [owner] = await ethers.getSigners();
const getcontract = await ethers.getContractFactory("interfaceandimport2");
const deploycontract = await getcontract.deploy();
const deployedcontract = await deploycontract.deployed();
const getcontractaddress = deployedcontract.address;
console.log("This is an import2 contract code " + "deployed at " + getcontractaddress);
console.log(await deployedcontract.word());
console.log(await deployedcontract.changeword());
console.log(await deployedcontract.showword());
}

    // We recommend this pattern to be able to use async/await everywhere
    // and properly handle errors.
    main().catch((error) => {
        console.error(error);
        process.exitCode = 1;
        });