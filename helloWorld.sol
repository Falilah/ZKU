// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.6;

contract Number{

    //state variable to assign variable.
    uint256 number;

    //@notice assign a number to a state variable.
    //@param _number assined the state variable.

    function storeNumber(uint _number) public{
        number = _number;

    }
    //@notice returned the state variable number.
    function retrieveNumber() public view returns(uint _number){
        _number = number;
    } 
}