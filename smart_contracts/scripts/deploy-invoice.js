const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying InvoiceToken with the account:", deployer.address);

  const InvoiceToken = await ethers.getContractFactory("InvoiceToken");
  const invoiceToken = await InvoiceToken.deploy(deployer.address); // Pass initial owner

  await invoiceToken.deployed();

  console.log("InvoiceToken deployed to:", invoiceToken.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
