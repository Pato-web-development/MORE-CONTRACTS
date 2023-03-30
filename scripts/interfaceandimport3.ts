import { ethers} from "hardhat";
async function main() {
    const [owner] = await ethers.getSigners();
    const getcontract = await ethers.getContractFactory("interfaceandimport3");
    const deploycontract = await getcontract.deploy();
    const deployedcontract = await deploycontract.deployed();
    const getcontractaddress = deployedcontract.address;
    console.log("This shit is going well @ " + getcontractaddress);
    console.log(await deployedcontract.callfunction1("0xdb6BAee08D1662D067c5dD19A7310Fa5611Cc2eB"));
    console.log(await deployedcontract.callfunction2("0xdb6BAee08D1662D067c5dD19A7310Fa5611Cc2eB"));
    console.log(await deployedcontract.callfunction3("0xdb6BAee08D1662D067c5dD19A7310Fa5611Cc2eB"));
}

    // We recommend this pattern to be able to use async/await everywhere
    // and properly handle errors.
    main().catch((error) => {
        console.error(error);
        process.exitCode = 1;
        });