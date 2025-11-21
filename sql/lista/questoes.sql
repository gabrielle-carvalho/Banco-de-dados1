--     1) Liste o nome do produto, a quantidade do produto (‘quantidade’), 
--     o valor de venda do produto e a quantidade x valor de venda.
select nome, quantidade, valor_venda, (quantidade*valor_venda) as total_item
from produto
order by nome asc;


--     2) Liste o nome da classificação do produto e a soma da quantidade 
--     de produtos por classificação.
select c.nome as classificacao, sum(p.quantidade) as soma_qtd
from classificacao c join produto p on p.idclassificacao = c.idclassificacao
group by c.nome;


--     3) Liste o nome do produto e a soma da quantidade de produtos 
--     comprados no período de 01/01/2010 até 30/06/2010.
select p.nome, sum(phn.quantidade) as qtd_comprada from produto p
join produto_has_nfe phn on phn.idproduto = p.idproduto
join nfe n on n.idnfe = phn.idnfe
where n.data between '2010-01-01' and '2010-06-30'
group by nome;


--     4) Liste a quantidade de compras e o tíquete médio (média do ‘valor_total’
--     da nf de entrada), no período de 01/01/2010 até 30/06/2010.
select count(*) as qtd_compras, avg(valor_total) as ticket_medio
from nfe where data between '2010-01-01' and '2010-06-30';


--     5) Liste o nome dos produtos e a soma da quantidade vendida, por produto 
--     cujos produtos tenham a soma da quantidade vendida abaixo de 100.
select p.nome, sum(phs.quantidade) as qtd_vendida
from produto p  join produto_has_nfs phs on phs.idproduto = p.idproduto
group by p.nome having sum(phs.quantidade) < 100;


--     6) Liste o nome dos produtos e a soma da quantidade vendida, por produto 
--     cujos produtos tenham a soma da quantidade vendida abaixo de 100 e as 
--     vendas tenho sido efetivadas no período de 01/01/2010 até 30/06/2010.
select p.nome, sum(phs.quantidade) as qtd_vendida from produto p
join produto_has_nfs phs on phs.idproduto = p.idproduto
join nfs n on n.idnfs = phs.idnfs
where n.data between '2010-01-01' and '2010-06-30'
group by p.nome having sum(phs.quantidade) < 100;

