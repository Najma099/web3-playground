pragma solidity >=0.5.0 <0.6.0 // We enter the solidity version here 

//we define contract by using the contract keyword
contract ZombieFactory {
    event NewZombie(uint zombieId, string name, uint dna); //declaring event 
    struct Zombie {
        string name;
        uint dna;
    }
    uint dna = 16; //uint--> uint256
    uint dnaModulus = 10 ** dnaDigits; // a**b acts as a to the power b
    Zombie[] public zombies; //dynamic array of Zombie 

    function _createZombie (string memory _name, uint _dna) private {
       zombies.push(Zombie(_name, _dna));
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}