pragma solidity ^0.4.18;

contract Mylan {
    address owner;
    
    function Mylan() public {
        owner = msg.sender;
    }
    
    modifier onlyMylan {
        require(msg.sender == owner);
        _;
    }
}

contract SupplyChain is Mylan {
    struct medicine {
        uint ID;
        string med_name;
        bool initialised;
        address warehouse;
        address distributor;
        bool dist;
        address pharmacist;
        address person;
    }
}    