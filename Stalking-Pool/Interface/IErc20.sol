// SPDX-License-identifier: MIT
pragma solidity ^0.8.26;

interface IErc20{
function  transfer(address from, address _to,uint amount) external returns(bool);
function approve(address _to, uint amount) external returns (bool);
function transferFrom(address _to, uint amount) external returns (bool);
function getAllowances(address _to)view  external returns (uint);
function getSymbol() external view returns (string memory);
function gettotalSupply() external view returns (uint);
function getDecimal() external view returns (uint);
function getBalance() external view returns (uint);
function getbalance(address _owner) external view returns (uint);
function getSender() external view returns(address);
function owner() external view returns(address);
}

