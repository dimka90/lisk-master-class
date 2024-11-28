//SDPX-License-Identifier: MIT

pragma solidity ^0.8.26;
import "forge-std/Test.sol";
import "../src/fileupload.sol";
import "forge-std/console.sol";
contract FileUploadTest is Test{
   
UploadImage  _upload;
function setUp()external {

     vm.startPrank(vm.addr(1));
    _upload = new UploadImage();
    vm.stopPrank();
}

function testOwner() view external{

    assertEq(_upload.owner(), vm.addr(1), "Expected same address");
}

function testUploadImage() external{

    _upload.uploadImage(
        "Dimka.png",
        "1234456"
    );

  (string memory imageName,string memory cid, address uploader, uint time) =   _upload.images(0);

 assertEq(imageName, "Dimka.png", "Expected Name should be Dimka.png");
}
}