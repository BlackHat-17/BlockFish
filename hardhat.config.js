require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.20",
  networks: {
    besu: {
      url: "http://localhost:8545", // your Besu node
      accounts: [process.env.PRIVATE_KEY], // funded dev key
    }
  }
};
