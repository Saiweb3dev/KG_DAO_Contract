import { ethers } from "hardhat";
import * as fs from "fs";
import * as path from "path";

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  // Deploy GovToken
  const GovToken = await ethers.getContractFactory("GovToken");
  const govToken = await GovToken.deploy(deployer.address);
  await govToken.waitForDeployment();
  console.log("GovToken deployed to:", await govToken.getAddress());

  // Deploy TimeLock
  const minDelay = 172800; // 2 days in seconds
  const TimeLock = await ethers.getContractFactory("TimeLock");
  const timeLock = await TimeLock.deploy(minDelay, [], []);
  await timeLock.waitForDeployment();
  console.log("TimeLock deployed to:", await timeLock.getAddress());

  // Deploy KG_Governor
  const KG_Governor = await ethers.getContractFactory("KG_Governor");
  const kgGovernor = await KG_Governor.deploy(await govToken.getAddress(), await timeLock.getAddress());
  await kgGovernor.waitForDeployment();
  console.log("KG_Governor deployed to:", await kgGovernor.getAddress());

  // Deploy Box
  const Box = await ethers.getContractFactory("Box");
  const box = await Box.deploy(await timeLock.getAddress());
  await box.waitForDeployment();
  console.log("Box deployed to:", await box.getAddress());

  // Set up roles
  const proposerRole = await timeLock.PROPOSER_ROLE();
  const executorRole = await timeLock.EXECUTOR_ROLE();

  await timeLock.grantRole(proposerRole, await kgGovernor.getAddress());
  await timeLock.grantRole(executorRole, ethers.ZeroAddress); // Anyone can execute


  console.log("Roles set up");

  // Save deployment information
  const deploymentInfo = {
    GovToken: await govToken.getAddress(),
    TimeLock: await timeLock.getAddress(),
    KG_Governor: await kgGovernor.getAddress(),
    Box: await box.getAddress(),
  };

  const deploymentInfoPath = path.join(__dirname, "..", "deployments", "deployment-info.json");
  fs.writeFileSync(deploymentInfoPath, JSON.stringify(deploymentInfo, null, 2));
  console.log("Deployment info saved to:", deploymentInfoPath);

  // Save ABIs
  const contracts = [
    { name: "GovToken", instance: govToken },
    { name: "TimeLock", instance: timeLock },
    { name: "KG_Governor", instance: kgGovernor },
    { name: "Box", instance: box },
  ];

  for (const contract of contracts) {
    const abiPath = path.join(__dirname, "..", "deployments", `${contract.name}-abi.json`);
    fs.writeFileSync(abiPath, JSON.stringify(contract.instance.interface.fragments, null, 2));
    console.log(`${contract.name} ABI saved to:`, abiPath);
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });