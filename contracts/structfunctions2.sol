// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.1;
  //here we are going to create a struct function and write to it using parameters and multiple arguments
  contract sports {
      //first we create the struct
      struct thesports {
          string football;
          string volleyball;
           }
    //now we create the variable
   thesports public oursports;
   //now we write to the struct function using parameters and arguments
   function thesport(string memory _football) public {
       oursports.football = _football;
   }
   function theothersport(string memory _volleybal) public {
       oursports.volleyball = _volleybal;
   }

  }
