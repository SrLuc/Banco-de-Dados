
-- insert tables

insert into Produto(nome, preco, categoria, quantidadeEstoque)
values('Bola de praia', 5, 'Recreaveis' , 1);
update produto set quantidadeEstoque = 2 where idProduto = 3;
delete from Produto where idProduto = 3;
select * from Produto;


insert into Fornecedor(CNPJ, nome, telefone)
values('XXXXXXXX0001-XX', 'fornecedor', '55-99999-9999');
update Fornecedor set nome = 'Plasticos' where nome = 'fornecedor';
delete from Fornecedor where nome =  'Rcn';
select * from fornecedor;


insert into Compra(dataCompra, valorDesconto, valorTotal, formaPagamento, Fornecedor_CNPJ)	
values('2022-09-08 12:30:50', 0, 5, 'Dinheiro', 'XXXXXXXX0001-XX');
update Compra set formaPagamento = 'Pix' where idCompra = 1;
delete from Compra where idCompra = 2;
select * from Compra;


insert into Funcionario
values('aaa-fff-eee-dd', 'Paulo');
update Funcionario set nome = 'Jose' where nome = 'Paulo';
delete from Funcionario where nome = 'Paulo';
select * from Funcionario;


insert into Endereco(CEP, numero, rua, bairro, cidade, UF, Fornecedor_CNPJ)
values('00000-000', '100', 'Rua da praia', 'sirinhahém', 'barra de sirinhahém', 'PE', 'XXXXXXXX0001-XX');
update Endereco set numero = '50' where rua = 'Rua da praia';
delete from Endereco where rua = 'Rua da praia';
select * from Endereco;


insert into Venda(dataVenda, valorDesconto, valorTotal, formaPagamento, Funcionario_CPF)
values('2022-08-09 02:30:09', 0, 3, 'Cartão de Credito', 'aaa-bbb-ccc-dd');
update Venda set valorTotal = 6 where idVenda = 2;
delete from Venda where idVenda = 2;
select * from Venda;


insert into ItemdeCompra(Compra_idCompra, quantidade)
values(1,1);
update ItemdeCompra set quantidade = 3 where Compra_idCompra = 1;
select * from itemdecompra;


insert into Fornecedor_has_Produto(Fornecedor_CNPJ, Produto_idProduto)
values('XXXXXXXX0001-XX', 1);
update Fornecedor_has_Produto set Fornecedor_CNPJ = 'yyyyyyy0001-yy';
delete from Fornecedor_has_Produto where Fornecedor_CNPJ = 'yyyyyyy0001-yy';
select * from Fornecedor_has_Produto;


insert into ItemdeVenda(Venda_idVenda, Produto_idProduto, quantidade)
values(1,1,1);
update itemdevenda set quantidade = 5 where Venda_idVenda = 1;
delete from itemdevenda where quantidade = 5;
select * from itemdevenda;





