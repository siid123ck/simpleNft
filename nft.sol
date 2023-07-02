// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract Nft{
    mapping(uint=>address) public owners;

    function ownerOf(uint tokenId) external view returns(address){
        require(owners[tokenId] != address(0), "No such token");
        return owners[tokenId];
    }
    function mint(uint tokenId) external {
        require(owners[tokenId]==address(0), "Already minted");
        require(tokenId <= 100, "Token id is too large");
        owners[tokenId] = msg.sender;
    }
    function transferFrom(address from, address to, uint tokenId) external {
        require(owners[tokenId] != address(0), "No such token");
        require(msg.sender == from, "only owner should be able to transfer");
        require(owners[tokenId]==from, "the owner of token should be from");
        owners[tokenId] = to;
    }
}
