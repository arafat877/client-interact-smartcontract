pragma solidity ^0.4.19;

contract Professor {
    bytes32 firstname;
    bytes32 lastname;
    uint    collegeid;
    address owner;
    
    event ProfessorEv(
       bytes32 firstname,
       bytes32 lastname,
       uint    collegeid 
    );
    
    constructor() public {
    	owner = msg.sender; // owner contains the contract creator's address. 
    }
    
    
    function setProfessor(bytes32 fname, bytes32 lname, uint id)  external {
	    firstname = fname;
	    lastname  = lname;
	    collegeid = id;
	    emit ProfessorEv(fname, lname, id);
    }
    
    function getProfessor() view public returns(bytes32, bytes32, uint) {
        return (firstname, lastname, collegeid);
    }
}
