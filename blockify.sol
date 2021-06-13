pragma solidity >=0.5.0;

contract TransactionList {
    uint public transactionCount = 0;

    //This is the transaction object that will be stored on the Blockchain
    struct Transaction {
        // Unique id for the transaction
        uint id;

        //Timestamp of the transaction
        uint timestamp;

        //This is an order object that encases information including the restaurant and food ordered
        struct Order {
            string restaurant;
            uint orderSize;
            string food[orderSize];
        }

        //This is a driver object that encases the information of the driver
        struct Driver {
            //Unique id of the driver
            uint id;

            string name;

            string car;

            string location;

            //Full payment directly given to the driver from the college student
            uint payment;
        }

        //This is a college student object that encases the information for the orderer 
        struct CollegeStudent {
            uint price;
            uint timeOfDelivery;
        }
    }

    //This creates an array of transactions that will be stored on the blockchain
    mapping(uint => Transaction) public transactions;

    //This function createsTransaction from information passed in
    function createTransaction(string memory _content) public {
        transactionCount++;
        transactions[transactionCount] = Transaction(transactionCount, _content, false)
    }

}