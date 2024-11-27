pragma solidity ^0.8.26;

library libErrors{

error InsufficientAmount(uint name);
error NofundAvaibleForspender();

}

// forge create --rpc-url https://rpc.sepolia-api.lisk.com   --etherscan-api-key GTT7DH386XJ2JDK8RAU64UPYBT1D4GGEQW   --verify   --verifier blockscout   --verifier-url https://sepolia-blockscout.lisk.com/api   --private-key 0x3c52739c9a662defb57de6b8aa2d742a0e42f95ef4c7a1064428e39f7fc61909   src/Erc20.sol:Erc20 --constructor-args 10000000000000