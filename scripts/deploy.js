const hre = require("hardhat");

async function main() {
  await hre.run("compile");

  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const ProjectFactory = await hre.ethers.getContractFactory("ProjectFactory");
  const projectFactory = await ProjectFactory.deploy();

  await projectFactory.deployed();

  console.log("ProjectFactory deployed to:", projectFactory.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
