// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "src/BasicNft.sol";

// import {DeployBasicNft} from "script/DeployBasicNft.s.sol";

contract MintBasicNft is Script {
    string public constant PUG =
        "https://ipfs.io/ipfs/bafybeibc5sgo2plmjkq2tzmhrn54bk3crhnc23zd2msg4ea7a4pxrkgfna/8430";

    function run() external {
        address mostRecentDeployment = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentDeployment);
        // console.log("Minted NFT on contract:", mostRecentDeployment);
        // console.log("Token URI:", BasicNft(mostRecentDeployment).tokenURI(0));
        // console.log("Owner of token 0:", BasicNft(mostRecentDeployment).ownerOf(0));
        // console.log("Balance of owner:", BasicNft(mostRecentDeployment).balanceOf(msg.sender));
        // console.log("Token counter:", BasicNft(mostRecentDeployment).getTokenCounter());
        // console.log("Token URI for token 0:", BasicNft(mostRecentDeployment).tokenURI(0));
    }

    function mintNftOnContract(address contractAddress) public {
        vm.broadcast();
        BasicNft basicNft = BasicNft(contractAddress);
        basicNft.mintNft(PUG);
    }
}
