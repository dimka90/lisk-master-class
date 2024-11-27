// SPDX-License-identifier: MIT
pragma solidity ^0.8.26;

interface IErc20{
function  transfer(address from, address _to,uint amount) external returns(bool);
function approve(address _to, uint amount) external returns (bool);
}

