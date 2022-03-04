select sod.*
from sales.salesorderdetail sod
join production.product p
	on p.productid = sod.productid
join production.productsubcategory psc
	on psc.productsubcategoryid = p.productsubcategoryid
where psc.productsubcategoryid between 4 and 17;

/*
Time (seconds) without index:
1. 0.185
2. 0.146
3. 0.166
4. 0.173
5. 0.185
6. 0.168
7. 0.178
8. 0.181
9. 0.165
10. 0.172
AVERAGE: 0.1719
*/

create or replace index index_productsubcategoryid on production.productsubcategory using btree (productsubcategoryid);

/*
Time (seconds) with index:
1. 0.156
2. 0.159
3. 0.181
4. 0.179
5. 0.180
6. 0.153
7. 0.196
8. 0.160
9. 0.154
10. 0.161
AVERAGE: 0.1679
*/