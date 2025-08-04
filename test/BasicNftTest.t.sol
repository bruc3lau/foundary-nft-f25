// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "src/BasicNft.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public user = makeAddr("user");
    string public constant PUG = "https://ipfs.io/ipfs/QmbWqxBEKC3P8tqsKc98xmWNzrzDtRLMiMPL8wBuTGsMnR";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory testName = "Doggie";
        bytes32 hashedName = keccak256(abi.encodePacked(testName));
        // console.log("Hashed Name:", hashedName);
        console.logBytes32(hashedName); // 使用 console2.logBytes32

        string memory name = basicNft.name();
        console.logBytes32(keccak256(abi.encodePacked(name))); // 使用 console2.logBytes32
        assertEq(name, testName);

        assert(
            keccak256(abi.encodePacked(testName)) ==
                keccak256(abi.encodePacked(name))
        );
    }

    function testMintNft() public {
        vm.prank(user); // 模拟发送者
        // console.log(basicNft.balanceOf(user));
        basicNft.mintNft(PUG);
        console.log(basicNft.tokenURI(0));
        console.log(basicNft.balanceOf(user));
        assertEq(basicNft.ownerOf(0), user);
        assertEq(basicNft.tokenURI(0), PUG);
    }
}
