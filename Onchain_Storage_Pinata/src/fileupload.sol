//SPDX-Licens-identifier: MIT

pragma solidity ^0.8.26;

contract UploadImage{


address public owner;
event Upload(string, address,uint);
struct Image{
    string imageName;
    string imageCid;
    address uploader;
    uint time;
}
modifier onlyOwner(){
    require(msg.sender == owner, "You are not the Owner");
    _;
}
Image[] public images;

function uploadImage(
    string memory _name,
    string memory _cid
) external {

images.push(
    Image({
        imageName: _name,
        imageCid: _cid,
        uploader:msg.sender,
        time:block.timestamp
    }));
    emit Upload(_name,msg.sender,block.timestamp);
}
constructor (){
    owner =msg.sender;
}

function getImage(uint index)  external  view returns(Image memory){
    require(index<images.length,"Index not in array");
    return images[index];
}

function getImageCid(uint index) external view returns (string memory){
     require(index<images.length,"Index not in array");

     return images[index].imageCid;


}

function getAllImages() external view returns(Image[] memory){
return images;
}
// function getOwner() external returns(address)
// {
//     return owner;

// }
}