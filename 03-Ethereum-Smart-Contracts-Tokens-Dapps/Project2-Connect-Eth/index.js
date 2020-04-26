/*##########################

CONFIGURATION
##########################*/

// Step 1: Set up the appropriate configuration
var Web3 = require('web3')
var EthereumTransaction = require("ethereumjs-tx")
// var url = 'HTTP://127.0.0.1:7545' // 8545 if using ganache-cli
var web3 = new Web3('HTTP://127.0.0.1:7545')

// web3.eth.getAccounts().then(accounts => console.log(accounts));

// web3.eth.getAccounts().then(accounts => console.log(accounts[0]))

// Step 2: Set the sending and receiving addresses for the transaction
var sendingAddress = '0x54DE20218D0e557c5Bc93C23A12C87Bf580b8Ab9'
var receivingAddress = '0xD1DAe12dDc990e6C1f52d603f716b7a42c478253'

// Step 3: Check the balances of each address
web3.eth.getBalance(sendingAddress).then(console.log)
web3.eth.getBalance(receivingAddress).then(console.log)

/*##########################

CREATE A TRANSACTION
##########################*/

// Step 4: Set up the transaction using the transaction variables as shown 

var rawTransaction = { 
    nonce: 0, 
    to: receivingAddress, 
    gasPrice: 20000000, 
    gasLimit: 30000, 
    value: 100, 
    data: "" 
}

/*##########################

Sign the Transaction
##########################*/

// -- Step 7: Sign the transaction with the Hex value of the private key of the sender 
var privateKeySender = 'PRIVATEKEY' 
var privateKeySenderHex = new Buffer(privateKeySender, 'hex') 
var transaction = new EthereumTransaction(rawTransaction) 
transaction.sign(privateKeySenderHex)

/*#########################################

Send the transaction to the network
#########################################*/

// Step 8: Send the serialized signed transaction to the Ethereum network. 
var serializedTransaction = transaction.serialize(); 
web3.eth.sendSignedTransaction(serializedTransaction);

