//SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import "../src/Erc20.sol";

contract Erc20Test is Test{
Erc20 erc20;
function setUp() external {
vm.startPrank(vm.addr(1));
     
erc20 = new Erc20(100);
vm.stopPrank();

}
function  testOwner() external{
    vm.startPrank(vm.addr(1));
  
    assertEq(erc20.getBalance(), 100, "Balance of deployer should be 100");
  
 vm.stopPrank();
}
function  testOwnwerName() external{
    assertEq(erc20.owner(), vm.addr(1), "Address should be thesame");
}

function  testtotalSupply()  external view {
    console.log("Indside owner supply");
    assertEq(erc20.gettotalSupply(), 100, "Total supply should be 100");
     console.log("Supply", msg.sender);
}
function  testUser() external {
    console.log("Indside User");
    vm.startPrank(vm.addr(2));
    assertEq(erc20.getBalance(), 0, "User have zero Balance");
     console.log("User", msg.sender);
    vm.stopPrank();
}
function  testTransfer() external {

    erc20.transfer(vm.addr((1)), vm.addr(2), 10);
    assertEq(erc20.balances(vm.addr(2)), 10, "Balance should be 10");
    console.log(" Balance of owner",erc20.balances(vm.addr(1)));

}

function testApproveSpender() external{
erc20.approve(vm.addr(2), 20);

console.log("Vm2 allowance", erc20.getAllowances(vm.addr(2)));
}

function testTransferFrom() external{
    vm.startPrank(vm.addr(1));
    erc20.approve(vm.addr(2), 20);
    erc20.transferFrom(vm.addr(2), 20);
    vm.stopPrank();

    vm.startPrank(vm.addr(2));
   assertEq(erc20.getBalance(), 20 , " Address 2 should be 20");
    vm.stopPrank();

}
}


