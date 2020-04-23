# Project #1: Create Your Own Private Blockchain
This is the first Udacity Blockchain Nanodegree project, where I created a private blockchain utilizing `Node.js` and `JavaScript`.

## The tools and technologies I used to create my private blockchain:
- Languages: `Node.js` and `JavaScript`
- IDE: Visual Studio Code
- Libraries and npm modules used:
    - "bitcoinjs-lib": "^4.0.3",
    - "bitcoinjs-message": "^2.0.0",
    - "body-parser": "^1.18.3",
    - "crypto-js": "^3.1.9-1",
    - "express": "^4.16.4",
    - "hex2ascii": "0.0.3",
    - "morgan": "^1.9.1"

## What the Libraries Do:
- `bitcoinjs-lib` and `bitcoinjs-message` helps verify wallet address ownership and signatures.
- `express` is a node framework used to create The REST API.
- `body-parser` is a middleware module for Express and helps to read the json data submitted in a POST request.
- `crypto-js` contains some of the most important cryptographic methods and helps create the block hash.
- `hex2ascii` helps decode the data saved in the body of a Block.


# STEP 1: REVIEW BOILERPLATE CODE

Check in the terminal that the Express application is listening in the PORT 8000

![image](https://github.com/BrianHHough/Blockchain-Developer-Nanodegree-Udacity/blob/master/02-Blockchain-Fundamentals/PROJECT-Create-Your-Own-Blockchain/Screenshots/Part1-port8000.png)


