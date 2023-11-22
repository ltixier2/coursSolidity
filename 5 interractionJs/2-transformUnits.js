const { ethers } = require("ethers");

//const provider = new ethers.providers.JsonRpcProvider('http://small.tixier.org:8545') 
const provider = new ethers.providers.JsonRpcProvider("https://eth.rpc.blxrbdn.com")
const main = async () => {

    const gasPrice = await provider.getGasPrice()
    //prix en ether
    console.log(ethers.utils.formatEther(gasPrice))
    //prix en gwei 
    console.log(ethers.utils.formatUnits(gasPrice,'gwei'))
}
main()