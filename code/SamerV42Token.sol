// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SamerV42Token is ERC20 {
    uint256 public constant INITIAL_SUPPLY = 1337 * 10**18;
    
    constructor() ERC20("SamerV42", "SV42") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}