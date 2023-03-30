import {ethers} from "hardhat";
async function main() {
    const [owner] = await ethers.getSigners();
    const getcontract = await ethers.getContractFactory("StudentDetails");
    const deploycontract = await getcontract.deploy();
    const deployedcontract = await deploycontract.deployed();
    const getcontractaddress = deployedcontract.address;
    console.log(`We are just getting started, we are coming for Binance, but 
    we just deployed at ${getcontractaddress}`);
    console.log(await deployedcontract.registerStudent("Flora", "0x0A9c2Ab6F4dd5Fbeb544c3d76dC0a65A7E79be79", "25", "female"));
    console.log(await deployedcontract.registerStudent("Olamide", "0x5b133baD621F9cE287E00Ad4967fF44801713981", "20", "male"));
    console.log(await deployedcontract.getStudent("0x5b133baD621F9cE287E00Ad4967fF44801713981"));
    console.log(await deployedcontract.studentsDetails());
    
}

  // We recommend this pattern to be able to use async/await everywhere
    // and properly handle errors.
    main().catch((error) => {
        console.error(error);
        process.exitCode = 1;
        });