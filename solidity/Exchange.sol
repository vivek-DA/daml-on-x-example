pragma solidity ^0.4.25;

contract KV_State_Manager {
    string state;

    constructor() public {
        state = "{}";
    }
    
    function get() public view returns(string) {
        return state;
    }
    
    function set(string _newState) public {
        state = _newState;
    }
}


// pragma solidity ^0.5.9;

// contract Hi {
//     function hi() public pure returns (string memory) {
//         return "hi";
//     }

//     function life() public pure returns (uint) {
//         return 42;
//     }
// }

// pragma solidity ^0.5.8;

// contract Exchange {
//     struct AccountInfo {
//         string memberName;
//         address account;
//     }

//     address private operator;
//     mapping(address => AccountInfo) private accounts;

//     constructor() public {
//         operator = msg.sender;
//     }

//     function registerMember(string memory mName, address mAddress) public {
//         require(
//             msg.sender == operator,
//             "Only the operator can onboard new members."
//         );
//     }
// }



// curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":4213}' http://localhost:8540



// pragma solidity >0.5.8;

// contract Exchange {
// //     struct Account {
// //         string memberName;
// //     }
    
// //     address private operator;
// //     mapping(address => Account) private accounts;
    
// //     // event strMember(string member);
//     event logUint(string desc, uint number);
    
// //     constructor() public {
// //         operator = msg.sender;
// //     }

//     function someInteger() public { 
//         emit logUint("Value", 1234);
//     }

// //     // function register() public view returns (uint256) {
// //     //     return 1234;
// //     // }

// //     // function register(string memory mName) public returns (string memory) {
// //     //     require(msg.sender != operator, "Operator cannot register itself.");
// //     //     Account storage newAccount = accounts[msg.sender];
// //     //     newAccount.memberName = mName;
// //     //     // emit strMember(mName);
// //     //     return "Success.";
// //     // }
    
// //     // function returnMembers() public {
// //     //     // for (uint p = 0; p < accounts.length; p++) {
// //     //     //     return accounts[p].memberName;
// //     //     // }
// //     //     // return "Hello";
// //     //     emit strMember("Hello");
// //     // }
    
// //     // function destruct() public {
// //     //     require(operator == msg.sender);
// //     //     selfdestruct(msg.sender);
// //     // }
// }