import { ethers } from "hardhat";

async function main() {
const [owner] = await ethers.getSigners();
const getmycontract = await ethers.getContractFactory("arrayinarray");
const deploymycontract = await getmycontract.deploy();
const deployedcontract = await deploymycontract.deployed();
const getcontractaddress = deployedcontract.address;
console.log("We have deloyed our contract at " + getcontractaddress);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
