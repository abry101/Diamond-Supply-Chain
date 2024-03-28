// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

enum OwnerType {Miners, Cutters, Exporter, Traders, PTraders, Retailers }


contract Owner {
    string public name;
    string public location;
    string public email;
    OwnerType public ownerType;

        constructor(string memory _name, string memory _location, string memory _email, OwnerType _ownerType) {
            name = _name;
            location = _location;
            email = _email;
            ownerType = _ownerType;
        }
}