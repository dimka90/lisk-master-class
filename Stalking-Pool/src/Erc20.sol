// SPDX-License-identifier: MIT

pragma solidity ^0.8.26;
import '../Interface/IErc20.sol';
import "./libraries/LibErrors.sol";

contract Erc20 is IErc20 { 
uint totalsupply; 
uint decimal = 18;
string symbol = "DKT";
address public  owner;

event Transfer(address indexed from, address indexed _to,uint indexed amount);
event Approve(address indexed _to, uint indexed amount); 

mapping(address => uint) public balances;
mapping(address => mapping(address=>uint)) public allowance; 

constructor (uint _initialsupply){
totalsupply = _initialsupply;
balances[msg.sender] = totalsupply;
owner = msg.sender;
}

function transfer(address from, address _to, uint amount) external returns (bool){
// check if the user has the amount to stake
if(balances[from] < amount)
{
    revert libErrors.InsufficientAmount(amount);
}
require(amount > 0, " Amount must be greater than zero");
balances[from] -= amount;
balances[_to] += amount;
emit Transfer(from, _to, amount);

return true;
}
// function to approve an address to spend on your behalf
function approve(address _spender, uint amount) external returns (bool)
{
allowance[msg.sender][_spender] = amount;
emit Approve(_spender, amount);
return true;

}

function transferFrom(address _to, uint amount) external returns (bool)
{
// if(allowance[msg.sender][_to] < amount){
//  revert  libErrors.NofundAvaibleForspender();
//   }
    // check if the user has the amount to give
    require(balances[msg.sender] > amount, "Your depositor is broke");
    // update both users balance
    balances[msg.sender] -= amount;
    balances[_to] += amount;
    emit Transfer(msg.sender, _to, amount);
    return true;

}
function getAllowances(address _to)view  external returns (uint)
{
    return allowance[msg.sender][_to];
}

// working with getter functions
 function getSymbol() view external returns (string memory)
 {
    return symbol;
 }

 function gettotalSupply() view external returns (uint )
 {
    return totalsupply;
 }

  function  getDecimal() view external returns (uint )
 {
    return decimal;
 }

function getBalance() view external returns (uint)
{
return balances[msg.sender];
}

function getbalance(address _owner) view external returns (uint)
{
return balances[_owner];
}

function getSender() view external returns(address)
{
    return msg.sender;
}

 function addBalance(uint256 amount) external {
        balances[msg.sender] += amount;
        balances[owner] -= amount;
    }
}

// forge create --rpc-url https://rpc.sepolia-api.lisk.com \
// --etherscan-api-key GTT7DH386XJ2JDK8RAU64UPYBT1D4GGEQW\
// --verify \
// --verifier blockscout \
// --verifier-url https://sepolia-blockscout.lisk.com/api \
// --private-key 3c52739c9a662defb57de6b8aa2d742a0e42f95ef4c7a1064428e39f7fc61909\
// src/Staking_pool.sol:Staking

// forge verify-contract 0xD5706cE7B5304e3F9Fe56C72b4892Be90B445686 \
// ./src/Staking_pool.sol:Staking\
// --chain 4202 \
// --watch \
// --verifier blockscout \
// --verifier-url https://sepolia-blockscout.lisk.com/api