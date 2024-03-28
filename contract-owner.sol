// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./contract-owner-token.sol";
import "./contract-diamond.sol";


contract DiamondOwners {
    constructor() {}
    struct OwnerStruct{
        string  name;
        string location;
        string email; 
        OwnerType ownerType;
    }

    event NewDiamoIsAdded(address miner, address diamond);
    mapping (address => OwnerStruct) public owners; 

    mapping (address => address) public ownersDiamond; 
    mapping (address => address[]) public minedOwnersDiamond; 

    function addOwners(string memory _name, string memory _location, string memory _email, OwnerType _ownerType) public  {
    //function addOwners(OwnerStruct memory _ownerStruct) public  {
        OwnerStruct memory _ownerStruct = OwnerStruct(_name, _location, _email, _ownerType); 
        Owner _owner = new Owner(_ownerStruct.name, _ownerStruct.location, _ownerStruct.email, _ownerStruct.ownerType);
        owners[address(_owner)] = _ownerStruct;
    }


    // 
    function mining(address addr, string memory signature, string memory color, string memory origin)  public isMiner(addr) {
        require((addr != address(0) && ownersDiamond[addr] == address(0)), "Owners doesn't exist!");
        Diamond dd = new Diamond();
        bytes32 key = sha256(bytes(signature));
        dd.mintDiamond( addr, 0, "", "", color, origin, key);
        minedOwnersDiamond[addr].push(address(dd));
        emit NewDiamoIsAdded(addr, address(dd));
    }

    modifier isMiner(address add) {
        require(owners[add].ownerType == OwnerType.Miners, "You are not miner!");
        _;
    }


}


