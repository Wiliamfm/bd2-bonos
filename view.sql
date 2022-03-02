create or replace view territories_with_sales as
	select
		distinct(t.name),
		t.group,
		t.countryregioncode
	from sales.salesterritory t
	join sales.salesorderheader soh
		on soh.territoryid = t.territoryid	
	join purchasing.shipmethod sh
		on sh.shipmethodid = soh.shipmethodid
	join purchasing.purchaseorderheader poh
		on poh.shipmethodid = sh.shipmethodid
	join purchasing.purchaseorderdetail pod
		on pod.purchaseorderid = poh.purchaseorderid
	join production.product p
		on p.productid = pod.productid
	where p.productid is not null;
		
select *  from territories_with_sales;