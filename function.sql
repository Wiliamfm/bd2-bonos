create or replace function get_most_sell_product_by_territory (territory varchar)
	returns varchar
	language plpgsql
	as
$$
declare
	product varchar;
begin

	select count(p.name)
	into product
	from sales.salesterritory t
	join sales.salesorderheader soh
		on soh.territoryid = t.territoryid
	join sales.salesorderdetail sod
		on sod.salesorderid = soh.salesorderid
	join production.product p
		on p.productid = sod.productid
	where t.name = territory;
	
	return product;
end;
$$

--select * from sales.salesterritory;
--select * from production.product;

select get_most_sell_product_by_territory('Northwest');