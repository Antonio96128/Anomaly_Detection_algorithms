

# NOTA: Se pide omitir fondo de ahorro y caja de ahorro de regla 4.3 pero no aparecen ese tipo de operaciones
# NOTA: Contratos Actinver significa algo diferente a contratos?

create view REGLA_4_1 AS
select distinct p_clabe
from e_cuenta_externa
join
(
SELECT L_CUENTA_EXTERNA_01.FROM_ITEM_ID
FROM L_CUENTA_EXTERNA_01
where L_CUENTA_EXTERNA_01.FROM_ITEM_TYPE_ID = 13 and direction='w'
GROUP BY L_CUENTA_EXTERNA_01.FROM_ITEM_ID
HAVING COUNT(DISTINCT(L_CUENTA_EXTERNA_01.TO_ITEM_ID)) > 3
) regla_4_1
on e_cuenta_externa.item_id = regla_4_1.from_item_id




create view REGLA_4_2 AS
select distinct p_clabe
from e_cuenta_externa
join
(
SELECT L_CUENTA_EXTERNA_01.TO_ITEM_ID
FROM L_CUENTA_EXTERNA_01
where L_CUENTA_EXTERNA_01.FROM_ITEM_TYPE_ID = 1 and direction='w'
GROUP BY L_CUENTA_EXTERNA_01.TO_ITEM_ID
HAVING COUNT(DISTINCT(L_CUENTA_EXTERNA_01.FROM_ITEM_ID)) > 3
) regla_4_2
on e_cuenta_externa.item_id = regla_4_2.to_item_id






create view REGLA_4_3 AS
SELECT e_operacion_interna_des.p_numero_de_contrato
FROM L_OPERACION_INTERNA_01 
JOIN
E_OPERACION_INTERNA
ON L_OPERACION_INTERNA_01.FROM_ITEM_ID = E_OPERACION_INTERNA.ITEM_ID
JOIN
E_OPERACION_INTERNA_DES
ON L_OPERACION_INTERNA_01.TO_ITEM_ID = E_OPERACION_INTERNA_DES.ITEM_ID
WHERE L_OPERACION_INTERNA_01.DIRECTION = 'W'
group by e_operacion_interna_des.p_numero_de_contrato
having count(distinct(e_operacion_interna.p_numero_de_contrato)) > 3




-------------------------------                        ---------------------------------                        -----------------------------------

## Si Contrato Actinver significa algo como contratos que tienen promotor Personal Actinver, entonces se 
## debe filtrar en las queries de arriba




create view REGLA_4_1 AS
select distinct p_clabe
from e_cuenta_externa
join
(
SELECT L_CUENTA_EXTERNA_01.FROM_ITEM_ID
FROM L_CUENTA_EXTERNA_01
where L_CUENTA_EXTERNA_01.FROM_ITEM_TYPE_ID = 13 and direction='w'
and L_CUENTA_EXTERNA_01.TO_ITEM_ID in (
select item_id
from e_contrato
where p_promotor like '%Personal Actinver%' 
)
GROUP BY L_CUENTA_EXTERNA_01.FROM_ITEM_ID
HAVING COUNT(DISTINCT(L_CUENTA_EXTERNA_01.TO_ITEM_ID)) > 3
) regla_4_1
on e_cuenta_externa.item_id = regla_4_1.from_item_id





# Revisar esta query con cuidado solo para estar seguros



create view REGLA_4_2 AS
select distinct p_clabe
from e_cuenta_externa
join
(
SELECT L_CUENTA_EXTERNA_01.TO_ITEM_ID
FROM L_CUENTA_EXTERNA_01
where L_CUENTA_EXTERNA_01.FROM_ITEM_TYPE_ID = 1 and direction='w'
and L_CUENTA_EXTERNA_01.FROM_ITEM_ID in (
select item_id
from e_contrato
where p_promotor like '%Personal Actinver%' 
)
GROUP BY L_CUENTA_EXTERNA_01.TO_ITEM_ID
HAVING COUNT(DISTINCT(L_CUENTA_EXTERNA_01.FROM_ITEM_ID)) > 3
) regla_4_2
on e_cuenta_externa.item_id = regla_4_2.to_item_id










create view REGLA_4_3 AS
SELECT e_operacion_interna_des.p_numero_de_contrato
FROM L_OPERACION_INTERNA_01 
JOIN
E_OPERACION_INTERNA
ON L_OPERACION_INTERNA_01.FROM_ITEM_ID = E_OPERACION_INTERNA.ITEM_ID
JOIN
E_OPERACION_INTERNA_DES
ON L_OPERACION_INTERNA_01.TO_ITEM_ID = E_OPERACION_INTERNA_DES.ITEM_ID
WHERE L_OPERACION_INTERNA_01.DIRECTION = 'W'
and e_operacion_interna.p_numero_de_contrato in (
select p_numero_de_contrato
from e_contrato
where P_PROMOTOR like '%Personal Actinver%'
)
and e_operacion_interna_Des.p_numero_de_contrato in (
select p_numero_de_contrato
from e_contrato
where P_PROMOTOR like '%Personal Actinver%'
)
group by e_operacion_interna_des.p_numero_de_contrato
having count(distinct(e_operacion_interna.p_numero_de_contrato)) > 3









################################################################################################





-- Regla 4 / Pedir a Javier que las revise

-- FINAL


SELECT L_CUENTA_EXTERNA_01.TO_ITEM_ID
, e_contrato.p_numero_de_contrato
, COUNT(DISTINCT(L_CUENTA_EXTERNA_01.FROM_ITEM_ID)) 
FROM L_CUENTA_EXTERNA_01
join
e_contrato
on l_cuenta_externa_01.from_item_id = e_contrato.item_id
where L_CUENTA_EXTERNA_01.TO_ITEM_TYPE_ID = 13 and direction='w'
GROUP BY L_CUENTA_EXTERNA_01.TO_ITEM_ID, e_contrato.p_numero_de_contrato
HAVING COUNT(DISTINCT(L_CUENTA_EXTERNA_01.FROM_ITEM_ID)) > 3


SELECT DISTINCT(L_CUENTA_EXTERNA_01.FROM_ITEM_ID)
, E_CONTRATO.P_NUMERO_DE_CONTRATO 
FROM
L_CUENTA_EXTERNA_01
JOIN
E_CONTRATO
ON E_CONTRATO.ITEM_ID = L_CUENTA_EXTERNA_01.FROM_ITEM_ID
WHERE L_CUENTA_EXTERNA_01.TO_ITEM_ID IN
(
        SELECT L_CUENTA_EXTERNA_01.TO_ITEM_ID
        FROM L_CUENTA_EXTERNA_01
        where L_CUENTA_EXTERNA_01.TO_ITEM_TYPE_ID = 13 and direction='w'
        GROUP BY L_CUENTA_EXTERNA_01.TO_ITEM_ID
        HAVING COUNT(DISTINCT(L_CUENTA_EXTERNA_01.FROM_ITEM_ID)) > 3
)

SELECT DISTINCT(L_CUENTA_EXTERNA_01.FROM_ITEM_ID)
, E_CONTRATO.P_NUMERO_DE_CONTRATO 
FROM
L_CUENTA_EXTERNA_01
JOIN
E_CONTRATO
ON E_CONTRATO.ITEM_ID = L_CUENTA_EXTERNA_01.TO_ITEM_ID
WHERE L_CUENTA_EXTERNA_01.TO_ITEM_ID IN
(
        SELECT L_CUENTA_EXTERNA_01.TO_ITEM_ID
        FROM L_CUENTA_EXTERNA_01
        where L_CUENTA_EXTERNA_01.TO_ITEM_TYPE_ID = 1 and direction='w'
        GROUP BY L_CUENTA_EXTERNA_01.TO_ITEM_ID
        HAVING COUNT(DISTINCT(L_CUENTA_EXTERNA_01.FROM_ITEM_ID)) > 3
)



SELECT  e_operacion_interna.p_numero_de_contrato
, count(distinct(e_operacion_interna_des.p_numero_de_contrato))
FROM L_OPERACION_INTERNA_01 
JOIN
E_OPERACION_INTERNA
ON L_OPERACION_INTERNA_01.FROM_ITEM_ID = E_OPERACION_INTERNA.ITEM_ID
JOIN
E_OPERACION_INTERNA_DES
ON L_OPERACION_INTERNA_01.TO_ITEM_ID = E_OPERACION_INTERNA_DES.ITEM_ID
WHERE L_OPERACION_INTERNA_01.DIRECTION = 'W'
group by e_operacion_interna.p_numero_de_contrato
having count(distinct(e_operacion_interna_des.p_numero_de_contrato)) > 3





SELECT  e_operacion_interna_des.p_numero_de_contrato
, count(distinct(e_operacion_interna.p_numero_de_contrato))
FROM L_OPERACION_INTERNA_01 
JOIN
E_OPERACION_INTERNA
ON L_OPERACION_INTERNA_01.FROM_ITEM_ID = E_OPERACION_INTERNA.ITEM_ID
JOIN
E_OPERACION_INTERNA_DES
ON L_OPERACION_INTERNA_01.TO_ITEM_ID = E_OPERACION_INTERNA_DES.ITEM_ID
WHERE L_OPERACION_INTERNA_01.DIRECTION = 'W'
group by e_operacion_interna_des.p_numero_de_contrato
having count(distinct(e_operacion_interna.p_numero_de_contrato)) > 3














-- TEMPORAL


--4 CONTRATOS A 1 CUENTA EXTERNA
FROM = CONTRATO
TO = CUENTA_EXTERNA

--4 CONTRATOS RECIBEN O MANDAN DINERO DE UNA CUENTA EXTERNA
--CHECAR SE VAN A FILTRAR LAS DIRECCIONES
SELECT L_CUENTA_EXTERNA_01.TO_ITEM_ID, COUNT(DISTINCT(L_CUENTA_EXTERNA_01.FROM_ITEM_ID)) 
FROM L_CUENTA_EXTERNA_01
GROUP BY L_CUENTA_EXTERNA_01.TO_ITEM_ID
HAVING COUNT(DISTINCT(L_CUENTA_EXTERNA_01.FROM_ITEM_ID)) > 3

--4 CONTRATOS MANDAN A UNA CONTRATO
SELECT L_OPERACION_INTERNA_01.TO_ITEM_ID, COUNT(DISTINCT(L_OPERACION_INTERNA_01.FROM_ITEM_ID)) 
FROM L_OPERACION_INTERNA_01
GROUP BY L_OPERACION_INTERNA_01.TO_ITEM_ID
HAVING COUNT(DISTINCT(L_OPERACION_INTERNA_01.FROM_ITEM_ID)) > 3



