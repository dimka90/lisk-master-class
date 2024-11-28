//SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;
import "forge-std/Script.sol";
import "../src/fileupload.sol";
contract DeployUploadfile is Script{

function run() external {
   uint deployerPrivateKey =  vm.envUint("PRIVATE_KEY");
   vm.startBroadcast(deployerPrivateKey);
   UploadImage image = new UploadImage();

   console.log("Contract deployed at address", address(image));

   vm.stopBroadcast();

}

}