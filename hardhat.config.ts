import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";
dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.17",
  // defaultNetwork: "hardhat",
  networks: {
    hardhat: {
      forking: {
        enabled: true,
        //@ts-ignore
        url: process.env.MAINNET_RPC
      }
    },
    goerli: {
      url: process.env.GOERLI_RPC,
      //@ts-ignore
      accounts: [process.env.PRIVATE_KEY1]
    },
    polygonmumbai: {
      url: process.env.POLYGON_RPC,
      //@ts-ignore
      accounts: [process.env.PRIVATE_KEY1]
    },
    sepoliatestnetwork: {
      url: process.env.SEPOLIA_RPC,
      //@ts-ignore
      accounts: [process.env.PRIVATE_KEY1]
    },
    smartchaintestnetwork: {
      url: process.env.SMARTCHAINTESTNET_RPC,
      //@ts-ignore
      accounts: [process.env.PRIVATE_KEY1]
    },
    smartchainmainnet: {
      url: process.env.SMARTCHAINMAINNET_RPC,
      //@ts-ignore
      accounts: [process.env.PRIVATE_KEY1]
    },
  },
  
  etherscan: {
    apiKey: process.env.ETHERSCAN,
  },
  bscscan: {
    apiKey: process.env.BSCSCAN,
  },
};

export default config;
