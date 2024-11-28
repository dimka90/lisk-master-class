//SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;
import "forge-std/Test.sol";
import "../src/Staking_pool.sol";
import "../Interface/IErc20.sol";
import "forge-std/console.sol";


contract StalkingTest is Test{
IErc20 token;
Staking staking_pool;
function setUp() external
{
    vm.startPrank(vm.addr(1));
    token = new Erc20(10000);
// token = IErc20(0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512);

staking_pool = new Staking(address(token));
vm.stopPrank();
}

function testOwner() external view {
    // vm.expectRevert();
    // console.log("ss",token.getSymbol());
    assertEq(token.owner(), vm.addr(1), "Address should be same");
}

function testCreatePool() external 
{
    vm.startPrank(vm.addr(1));
    
    staking_pool.createPool(
        "USDT/ETH",
        100);
    vm.stopPrank();
Staking.Pool[] memory _pools = staking_pool.getPool();
assertEq(_pools.length, 1, "Expected one pool");
assertEq(_pools[0].poolName, "USDT/ETH");
}
function testStake() external{

    vm.startPrank(vm.addr(1));
    
    staking_pool.createPool(
        "USDT/ETH",
        100);
   
    Staking.Pool[] memory _pools = staking_pool.getPool();

    staking_pool.stake(_pools[0].poolId,10, 1 weeks);
    (,,uint total,) = staking_pool.pools(0);

    assertEq( total, 10, "Expected the total stake ");
     vm.stopPrank();

}

function testUnstake() external {
vm.startPrank(vm.addr(1));
 staking_pool.createPool(
        "USDT/ETH",
        100);

  Staking.Pool[] memory _pools = staking_pool.getPool();

    staking_pool.stake(_pools[0].poolId,10, 1 weeks);
   
staking_pool.unstake(0);

vm.stopPrank();

}

}