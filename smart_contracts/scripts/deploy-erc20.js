const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying from:", deployer.address);

  const MyToken = await ethers.getContractFactory("MyToken");
  const token = await MyToken.deploy(1000000); // ERC20: 1,000,000 tokens
  await token.deployed();

  console.log("MyToken deployed to:", token.address);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
