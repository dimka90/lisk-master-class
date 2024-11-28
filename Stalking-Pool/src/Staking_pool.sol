// SPDX-License-identifier: MIT
pragma solidity ^0.8.26;

import './Erc20.sol';

contract Staking {
address owner;

Erc20 public erc20;


event CreatePool(string indexed poolName,uint indexed Reward);
    modifier onlyOwner
    {
        require(msg.sender == owner, "Only Owner can modify");
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
        uint duration;
        uint amount;
        uint[] poolId;
    }
    Pool[] public pools;
    // users data for a single user that stake in a pool
    // mapping( uint => Staker) public stakers;
    mapping(address => Staker) public stakers;


    constructor(address tokenaddress)
{
    owner = msg.sender;
    erc20 = Erc20(tokenaddress);
}

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
         erc20.transfer(msg.sender, address(this), _amount);
        // store user information
        stakers[msg.sender] = Staker({
            duration: _duration,
            amount: _amount,
            poolId: new uint[](poolId)
        });

        return true;
    }

function unstake(uint poolId) external returns (bool){

require(pools[poolId].poolReward > 0, "Pool does not exist");
require(stakers[msg.sender].amount>0, "You are poor");
erc20.transfer(address(this), msg.sender, stakers[msg.sender].amount);
erc20.addBalance(pools[poolId].poolReward);

emit Erc20.Transfer (address(this), msg.sender, stakers[msg.sender].amount);



return true;
}

function getPool() external view returns(Pool[] memory){
    return pools;
}
    }
