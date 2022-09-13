// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract SimpleStorage {

    // Initializes to 0.
    // The default visibility is internal 
    uint256 public favoriteNumber;

    People public person = People({
        favoriteNumber: 2,
        name: "Fischer"
    });

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        
        // Called in here you will have to pay gas to use this function even though it is a view function.
        retrieve();
    }

    // view and pure functions, when called alone, don't spend gas.
    // view just means we are going to read state from this function.
    // view and pure functions disallow modification of state.
    // Pure functions additionally disallow you to read from the blockchain state.
    // If a gas calling function calls a view or pure function - only then will it cost gas.
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }
}

// Contract Address:
// 0xd9145CCE52D386f254917e481eB44e9943F39138
