SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(6,2) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `quantidadeEstoque` INT NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `CNPJ` VARCHAR(18) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`CNPJ`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `idCompra` INT NOT NULL AUTO_INCREMENT,
  `dataCompra` DATETIME NOT NULL,
  `valorDesconto` DECIMAL(6,2) NOT NULL,
  `valorTotal` DECIMAL(6,2) NOT NULL,
  `formaPagamento` VARCHAR(45) NOT NULL,
  `Fornecedor_CNPJ` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`idCompra`),
  CONSTRAINT `fk_Compra_Fornecedor`
    FOREIGN KEY (`Fornecedor_CNPJ`)
    REFERENCES `mydb`.`Fornecedor` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `CPF` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `CEP` VARCHAR(9) NOT NULL,
  `numero` VARCHAR(5) NOT NULL,
  `rua` VARCHAR(60) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `cidade` VARCHAR(60) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `Fornecedor_CNPJ` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`idEndereco`),
  CONSTRAINT `fk_Endereco_Fornecedor1`
    FOREIGN KEY (`Fornecedor_CNPJ`)
    REFERENCES `mydb`.`Fornecedor` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `dataVenda` DATETIME NOT NULL,
  `valorDesconto` DECIMAL(6,2) NOT NULL,
  `valorTotal` DECIMAL(6,2) NOT NULL,
  `formaPagamento` VARCHAR(45) NOT NULL,
  `Funcionario_CPF` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idVenda`),
  CONSTRAINT `fk_Venda_Funcionario1`
    FOREIGN KEY (`Funcionario_CPF`)
    REFERENCES `mydb`.`Funcionario` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ItemdeCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItemdeCompra` (
  `Compra_idCompra` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`Compra_idCompra`),
  CONSTRAINT `fk_Compra_has_Compra_Compra1`
    FOREIGN KEY (`Compra_idCompra`)
    REFERENCES `mydb`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor_has_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor_has_Produto` (
  `Fornecedor_CNPJ` VARCHAR(18) NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Fornecedor_CNPJ`, `Produto_idProduto`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor1`
    FOREIGN KEY (`Fornecedor_CNPJ`)
    REFERENCES `mydb`.`Fornecedor` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ItemdeVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItemdeVenda` (
  `Venda_idVenda` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`Venda_idVenda`, `Produto_idProduto`),
  CONSTRAINT `fk_Venda_has_Produto_Venda1`
    FOREIGN KEY (`Venda_idVenda`)
    REFERENCES `mydb`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;