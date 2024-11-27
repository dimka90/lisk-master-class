// SPDX-License-identifier: MIT
pragma solidity ^0.8.26;

import './Erc20.sol';

contract Stalking {
address owner;

Erc20 public erc20;

constructor(address tokenaddress)
{
    owner = msg.sender;
    erc20 = Erc20(tokenaddress);
}
event CreatePool(string indexed poolName,uint indexed Reward);
    modifier onlyOwner
    {
        require(msg.sender == owner);
        _;
    }

    struct Pool
    {
        string poolName;
        uint poolId;
        uint totalstaked;
        uint poolReward;
    }
    uint poolcount;

    struct Staker{

        address owner;
        uint duration;
        uint amount;
    }
    Pool[] public pools;
    // users data for a single user that stake in a pool
    mapping(uint =>Staker) public stakers;

    function createPool(
        string memory _poolname,
        uint _poolreward
    ) onlyOwner external returns(bool){

        
        pools.push(Pool({
            poolName: _poolname,
            poolId:poolcount,
            totalstaked:0,
            poolReward: _poolreward
        }));
        poolcount+=1;
        emit CreatePool(_poolname, _poolreward);
        return true;
    }

    function stake(uint poolId, uint _amount, uint _duration) external returns (bool)
    {
        require(pools[poolId].poolReward >0 , "Pools doe not exit");

        pools[poolId].totalstaked +=  _amount;

        // call the erc20 token transferFrom
        erc20.transferFrom(address(this), _amount);
        // emit erc20.Transfer(msg.sender, address(this), _amount);
        // store user information
        stakers[poolId] = Staker({
            owner:msg.sender,
            duration: _duration,
            amount: _amount
        });

        return true;
    }

function unstake(uint poolId) external returns (bool){

require(pools[poolId].poolReward > 0, "Pool does not exist");
require(stakers[poolId].amount>0, "You are poor");
erc20.transfer(address(this), msg.sender, stakers[poolId].amount);

// erc20.emit Transfer(address(this), msg.sender, stakers[poolId].amount);

return true;
}

function getPool() external view returns(Pool[] memory){
    return pools;
}
    }
