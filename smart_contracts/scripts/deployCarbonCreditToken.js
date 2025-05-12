const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying CarbonCreditToken with account:", deployer.address);

  const CarbonCreditToken = await ethers.getContractFactory("CarbonCreditToken");
  const carbonCreditToken = await CarbonCreditToken.deploy(deployer.address);

  await carbonCreditToken.deployed();

  console.log("CarbonCreditToken deployed to:", carbonCreditToken.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
