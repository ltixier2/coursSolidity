const { ethers } = require("ethers");
require('dotenv').config();

const provider = new ethers.providers.JsonRpcProvider(process.env.tixierorg)

wallet = new ethers.Wallet(process.env.prvtKeyWalletTest, provider)

const destination = '0x9f433C885b4acCf39B632cF19Bf557C68afeA5FD'
const source = '0x3fD652C93dFA333979ad762Cf581Df89BaBa6795'


const main = async () => {

    let balanceSource = await provider.getBalance(source)
    console.log(`La balance du wallet source est de ${ethers.utils.formatEther(balanceSource)} ethers` )
    
    let balanceDest = await provider.getBalance(destination)
    console.log(`La balance du wallet de destination est de ${ethers.utils.formatEther(balanceDest)} ethers`)
    const tx = await wallet.sendTransaction({
        to:destination,
        value: ethers.utils.parseEther('0.5')
    })

    await tx.wait()
    let balanceSourceAfter = await provider.getBalance(source)
    console.log(`La balance du wallet source est de ${ethers.utils.formatEther(balanceSourceAfter)} ethers` )
    let balanceDestAfter = await provider.getBalance(destination)
    console.log(`La balance du wallet de destination est de ${ethers.utils.formatEther(balanceDestAfter)} ethers`)

    }
main()