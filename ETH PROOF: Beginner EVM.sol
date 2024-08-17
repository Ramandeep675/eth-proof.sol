// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {
    // Public variables
    string public tokenName = "Raman";
    string public tokenAbbrv = "ETH";
    uint256 public totalSupply = 0;

    // Mapping variable
    mapping(address => uint256) public balances;

    // Events
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    // Mint function
    function mint(address _address, uint256 _value) public {
        totalSupply += _value;
        balances[_address] += _value;
        emit Mint(_address, _value);
    }

    // Burn function
    function burn(address _address, uint256 _value) public {
        require(balances[_address] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balances[_address] -= _value;
        emit Burn(_address, _value);
    }
}
