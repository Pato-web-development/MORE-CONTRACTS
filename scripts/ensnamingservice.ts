import { ethers } from "hardhat";

async function main() {
const [owner] = await ethers.getSigners();
const getmycontract = await ethers.getContractFactory("Registry");
const deploymycontract = await getmycontract.deploy();
const deployedcontract = await deploymycontract.deployed();
const contaddress = deployedcontract.address;
console.log(`And we finally deployed our ENS contract at ${contaddress}`);
console.log(await deployedcontract.addEthName("pato", "0x5b133baD621F9cE287E00Ad4967fF44801713981"));
console.log(await deployedcontract.addEthName("dani", "0x0A9c2Ab6F4dd5Fbeb544c3d76dC0a65A7E79be79"));
console.log(await deployedcontract.getAddress("pato"));
console.log(await deployedcontract.getDomainNames());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });