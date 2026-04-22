const { ethers } = require("ethers");
require('dotenv').config();

const provider = new ethers.providers.JsonRpcProvider('http://small.tixier.org:8545') 
const address = '0x3fD652C93dFA333979ad762Cf581Df89BaBa6795'


const main = async () => {
    const balance = await provider.getBalance(address)
    console.log(`La balance de ${address} est de ${ethers.utils.formatEther(balance)} Ethers`)
}
main()