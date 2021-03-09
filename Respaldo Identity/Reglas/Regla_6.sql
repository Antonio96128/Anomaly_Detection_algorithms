



-- Regla 6 



create view regla_6 as 
(select e_cuenta_externa.p_clabe 
, count(distinct(e_cuenta_externa.p_titular)) as num_diferentes_por_clabe
from e_cuenta_externa
group by e_cuenta_externa.p_clabe
having count(distinct(e_cuenta_externa.p_titular)) > 1)








select e_cuenta_externa.ITEM_ID, e_cuenta_externa.p_clabe 
, count(distinct(e_cuenta_externa.p_titular)) as num_diferentes_por_clabe
from e_cuenta_externa
group by e_cuenta_externa.p_clabe
having count(distinct(e_cuenta_externa.p_titular)) > 1;






select e_cuenta_externa.ITEM_ID, e_cuenta_externa.p_clabe 
, count(distinct(e_cuenta_externa.p_titular)) as num_diferentes_por_clabe
from e_cuenta_externa
group by e_cuenta_externa.p_clabe
having count(distinct(e_cuenta_externa.p_titular)) > 1;




