const { ethers } = require("ethers");
require('dotenv').config();
const abi = require('./ABI/erc20.json')

const erc20Address = '0x1012be22B522f46857F3d491A9469278F542F112'


const provider = new ethers.providers.JsonRpcProvider(process.env.tixierorg)

wallet = new ethers.Wallet(process.env.prvtKeyWalletTest, provider)

const destination = '0x9f433C885b4acCf39B632cF19Bf557C68afeA5FD'
const source = '0x3fD652C93dFA333979ad762Cf581Df89BaBa6795'

const contract = new ethers.Contract(erc20Address,abi, provider)
const contractSigner = contract.connect(wallet)
const main = async () => {
    let balanceOfSource = await contract.balanceOf(source)
    console.log(ethers.utils.formatEther(balanceOfSource))

    const mint = await contractSigner.mint(source,ethers.utils.parseEther('100'))

    balanceOfSource = await contract.balanceOf(source)
    console.log(ethers.utils.formatEther(balanceOfSource))

}
main()