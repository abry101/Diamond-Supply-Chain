// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract Logistic is ERC20, ERC20Permit {
    event LogisticUpdated(address indexed diamond, address from, address to);
    struct NewLogistic{
        address diamond;
        address from;
        address to;
    }

    NewLogistic[] public logistics;

    constructor() ERC20("Logistic", "LGT") ERC20Permit("Logistic") {
    }

    function addLogistics(NewLogistic memory _newLogistic) public  {
        logistics.push(_newLogistic);
        emit LogisticUpdated(_newLogistic.diamond, _newLogistic.from, _newLogistic.to);
    }
}
