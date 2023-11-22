// SPDX-License-Identifier: GPL-3.0


pragma solidity 0.8.1;



contract NotesEleves {
   
    address owner; 
    address[] eleves;
    mapping(address=> uint[]) notes; 
    mapping(address=> bool) professors; 


    modifier onlyOwner() {
        require(msg.sender == owner, "you are not the owner");
        _;
 
    }
    modifier onlyValidatedProfs() {
                require(
            professors[msg.sender] == true,
            "only the professors user can modify"
        );
        _;
    }

    constructor(){
        owner=msg.sender;
    }

    function addProfessor(address _professorAddress) public onlyOwner{
        professors[_professorAddress] = true; 

    }

    function forbidProfessor(address _professorAddress) public onlyOwner{
        professors[_professorAddress] = false; 
    }
    function isProfessorValidated(address _professorAddress) public view returns (bool) {
        return  professors[_professorAddress];
    }

    function addNote(address _eleve, uint _note) public onlyValidatedProfs {
        notes[_eleve].push(_note);
        if (notes[_eleve].length == 0){
            eleves.push(_eleve);
        }
    }
    function notesEleve(address _eleve) public view returns (uint[] memory ) {
        return notes[_eleve];
        
    }  

    function calculMoyenne(address _eleve) public view returns(uint) {
        uint addition; 
        
        for (uint i = 0; notes[_eleve].length>i;i++){
            addition = addition + notes[_eleve][i];
        }
        return addition / notes[_eleve].length;

    }

    function suppressionNote(address _eleve, uint _indexNote) public onlyValidatedProfs {
            notes[_eleve][_indexNote] = notes[_eleve][notes[_eleve].length - 1];
            notes[_eleve].pop();
        }
    
    
 

    
}