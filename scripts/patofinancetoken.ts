import { ethers } from "hardhat";
async function main() {
    const [owner] = await ethers.getSigners();
    const getcontract = await ethers.getContractFactory("PatoFinance");
    const deploycontract = await getcontract.deploy();
    const deployedcontract = await deploycontract.deployed();
    const getcontractaddress = deployedcontract.address;
    console.log(`This is the script of my personal erc20token code from openzeppelin right here @ ${getcontractaddress}`);
    console.log(await deployedcontract.mint("0x5b133baD621F9cE287E00Ad4967fF44801713981", "150000000"));

}

    // We recommend this pattern to be able to use async/await everywhere
    // and properly handle errors.
    main().catch((error) => {
        console.error(error);
        process.exitCode = 1;
        });