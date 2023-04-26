const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("SimpleToken", function () {
  let SimpleToken;
  let simpleToken;
  let owner;
  let minter1;
  let minter2;
  let addrs;
    //definition des addresse
  beforeEach(async function () { // reinitialise le contrat avant chaque test pour s'assurer que tous les tests sont joués dans les memes conditions. en gros avant chaque it le contrat repart de 0 
    [owner, minter1, minter2, ...addrs] = await ethers.getSigners();
    //owner = owner, minter 1 & 2 seront autorisés toutes les autres adresses seront dispo dans addrs 

    SimpleToken = await ethers.getContractFactory("SimpleToken");
    simpleToken = await SimpleToken.connect(owner).deploy(
      "token",
      "tkn",
      ethers.utils.parseEther("200")
    );

    await simpleToken.deployed();
  });

  describe("Mint", function () { // describe regroupe tous les tests en un grand ensemble. 
    it("should allow minters to mint tokens", async function () { //it permet de décrire le resultat attendu en francais 'ca doit faire cela' dans nostre cas : ca doit allouer aux minters de minter les tokens 
        
      await simpleToken.connect(owner).allowMinter(minter1.address); 
      //owner ajoute minter1 a la liste des minters. 
      await simpleToken.connect(minter1).mint(addrs[0].address, ethers.utils.parseEther("1"));
      //mint de 1 tkn a l'utilisateur ayant adresse 0 dans le tableau addrs initialisé avec getSigners  
      const balance = await simpleToken.balanceOf(addrs[0].address);
      //Mise en place de la balance.
      expect(balance).to.equal(ethers.utils.parseEther("1"));
      //expect est ce qui est souhaité ici balance est egale a un 1 eth 
    });

    it("should not allow minters to mint tokens exceeding the total supply", async function () { // ca ne doit pas minter plus que la total supply 
      await simpleToken.connect(owner).allowMinter(minter1.address);
      await expect(
        simpleToken.connect(minter1).mint(addrs[0].address, ethers.utils.parseEther("201")) // tentative de mint de 201ether 
      ).to.be.revertedWith("no more token available"); // on attend que la transaction soit revert parce que le nombre de token a dépassé la supply. Donc erreur, l'erreur sera ce qu'on attend :)
    });

    it("should not allow non-minters to mint tokens", async function () {
      await expect(
        simpleToken.connect(addrs[0]).mint(addrs[1].address, ethers.utils.parseEther("1"))
      ).to.be.revertedWith("not allowed to mint"); // on souhaite qu'une des adresses non déclaré comme minter ne puisse pas minter de token et donc de revert la transaction. 
    });
  });
});
