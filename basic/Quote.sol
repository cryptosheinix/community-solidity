// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

contract Quote {
    
  address public owner; //Dueño
  
  string private message; // Cita
  
  mapping(address => bool) private whiteList; //Lista permitida 

  constructor() { //funcion que se ejecuta solo una vez en el despliegue
      owner = msg.sender; //El dueño del contrato es el llamador del deploy
      whiteList[msg.sender] = true; // Ingresa al deployer en la whitelist
  }
  
  modifier onlyOwner {
      require(msg.sender == owner,"Only owner"); // Verifica que el que llama sea el dueño
      _;
  }
    
  modifier onlyWhitelist {
      require(whiteList[msg.sender] == true, "Only whitelist"); // Verifica que el que llama esté en la whitelist
      _;
  }
  
  function getAddrWL(address _addr) public view returns(bool) {
      return whiteList[_addr]; //Verifica una address en la whitelist
  }
  
  function changeOwner(address _newOwner) public onlyOwner {
      owner = _newOwner; //Cambia el owner actual
  }

  function setQuote(string memory _message) public onlyWhitelist {
      message = _message; //guarda el message
  }

  function getQuote() public view returns (string memory) {
      return message; //retorna message
  }

  function addMember (address _member) public onlyOwner {
      whiteList[_member] = true; // ingresa una address a la whiteList
  }
  
  function delMember (address _member) public onlyOwner {
      whiteList[_member] = false; // elimina una address de la whiteList
  }   
}
