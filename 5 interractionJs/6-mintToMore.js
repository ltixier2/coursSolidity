const { ethers } = require("ethers");
require('dotenv').config();
const abi = require('./ABI/erc20.json')

const erc20Address = '0x1012be22B522f46857F3d491A9469278F542F112'


const provider = new ethers.providers.JsonRpcProvider(process.env.tixierorg)

wallet = new ethers.Wallet(process.env.prvtKeyWalletTest, provider)

const destination = '0x9f433C885b4acCf39B632cF19Bf557C68afeA5FD'
const source = '0x3fD652C93dFA333979ad762Cf581Df89BaBa6795'
const etudiants = ['0x57283B4BFa8849fD8436f461039aF6bb6c06340B','0x72406C3fdc96999337Aa25f0659e4ca0F9eBe68d','0xF7510889DC357182f6d9870AAEAFc406878FD668','0x27A2Ad5A292048B38c75d1D66cfcfebd829aD2AB']
const contract = new ethers.Contract(erc20Address,abi, provider)
const contractSigner = contract.connect(wallet)
const main = async () => {

    for (i=0; i<etudiants.length;i++){
        console.log(etudiants[i])
    let balanceOfDest = await contract.balanceOf(etudiants[i])
    console.log(ethers.utils.formatEther(balanceOfDest))

    const mint = await contractSigner.mint(etudiants[i],ethers.utils.parseEther('1000'))

    balanceOfDest = await contract.balanceOf(etudiants[i])
    console.log(ethers.utils.formatEther(balanceOfDest))
}

}
main()