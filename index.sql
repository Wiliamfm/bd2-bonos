--select * from purchasing.shipmethod;

-- query without index.

select *
from purchasing.purchaseorderheader poh
join purchasing.shipmethod sm
	on sm.shipmethodid = poh.shipmethodid
where sm.name = 'XRQ - TRUCK GROUND';

/*
times (seconds):
1. 0.069
2. 0.125
3. 0.102
4. 0.164
5. 0.098
6. 0.082
7. 0.093
8. 0.087
9. 0.162
10. 0.075
Average: 0.1057
*/

--Create index

--create index shipmethod_index on purchasing.shipmethod using hash (name);

/*
times with index (seconds):
1. 0.110
2. 0.143
3. 0.081
4. 0.088
5. 0.083
6. 0.080
7. 0.080
8. 0.090
9. 0.084
10. 0.082
Average: 0.0921
*/