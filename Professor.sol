pragma solidity ^0.4.19;

contract Professor {
    bytes32 firstname; // use bytes32 instead of string, because the compiler couldn't know how many gas will be spent
    bytes32 lastname;
    uint    collegeid;
    address owner;
    
    event ProfessorEv(
       bytes32 firstname,
       bytes32 lastname,
       uint    collegeid 
    );
    
    constructor() public { // use constructor instead of function, and the visibility of a constructor is always inetrnal or public
    	owner = msg.sender; // owner contains the contract creator's address. 
    }
    
    
    function setProfessor(bytes32 fname, bytes32 lname, uint id)  external { // if you want to call this function from outside the this smart contract, you should put external
	    firstname = fname;
	    lastname  = lname;
	    collegeid = id;
	    emit ProfessorEv(fname, lname, id); // if you don't use the emit keyword it will propmpt an error
    }
    
    function getProfessor() view public returns(bytes32, bytes32, uint) { // use view to tell to the blockchain tht this function wouldn't consume any gas
        return (firstname, lastname, collegeid);
    }
}
