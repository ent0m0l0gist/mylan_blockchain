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

    mapping(uint => medicine) medicine_map;
    medicine[] medicines;
    medicine[5][] warehouseMedicines;
    
    function add_medicine(uint _ID, string _med_name) public onlyMylan {
        var med = medicine_map[_ID];
        med.ID = _ID;
        med.med_name = _med_name;
        med.initialised = true;
        medicines.push(med) -1;
    }
     struct stakeHolderInfo {
        address stakeHolderAddress;
        string stakeHolderType;
    }
    
    mapping (address => stakeHolderInfo) stakeHolder;
    address[]  warehouses;
    address[]  distributors;
    address[]  retialers;
    address[]  consumers;
    
    function addWarehouse(address _warehouseAddress) onlyMylan public {
        var newWarehouse = stakeHolder[_warehouseAddress];
        newWarehouse.stakeHolderAddress = _warehouseAddress;
        newWarehouse.stakeHolderType = "WAREHOUSE";
        warehouses.push(_warehouseAddress) -1;
    }
}    