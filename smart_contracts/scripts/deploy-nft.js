const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  const MyNFT = await ethers.getContractFactory("MyNFT");
  const nft = await MyNFT.deploy();
  await nft.deployed();
  console.log("MyNFT deployed to:", nft.address);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
