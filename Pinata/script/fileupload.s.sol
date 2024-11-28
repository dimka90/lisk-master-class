//SPDX-Licens-identifier: MIT

pragma solidity ^0.8.26;
import "forge-std/Script.sol";
import "../src/fileupload.sol";
import "forge-std/console.sol";
contract UploadScript is Script{
UploadImage image;
function setUp() external {

image=UploadImage(0x5FbDB2315678afecb367f032d93F642f64180aa3);
}

function run() external {

string memory name= "dimka.png";
string memory cid = "244444444";
image.uploadImage(name,cid);
(, , ,uint time) = image.images(0);
console.log(time);
}

}