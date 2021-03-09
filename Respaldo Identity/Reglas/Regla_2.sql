





create view REGLA_2 as 
select distinct REGLA_1.p_numero_de_contrato
    from REGLA_1
    right join 
    (
            select L_cuenta_externa_01.from_item_id, l_cuenta_externa_01.to_item_id from
            L_CUENTA_EXTERNA_01
            where L_CUENTA_EXTERNA_01.FROM_ITEM_TYPE_ID = 13 and direction='w'
    ) L_CUENTA_EXTERNA_01
    on REGLA_1.item_id = L_CUENTA_EXTERNA_01.TO_ITEM_ID
    left join
    (
        select e_cuenta_externa.item_id, e_cuenta_externa.p_clabe
        from e_cuenta_externa
    ) e_cuenta_externa
    on e_cuenta_externa.item_id = L_CUENTA_EXTERNA_01.FROM_item_id
    where e_cuenta_externa.p_clabe not in (
        select e_cuenta_externa.p_clabe
        from REGLA_1
        right join 
        L_CUENTA_EXTERNA_01
        on REGLA_1.item_id = L_CUENTA_EXTERNA_01.TO_ITEM_ID
        left join
        e_cuenta_externa
        on e_cuenta_externa.item_id = L_CUENTA_EXTERNA_01.from_item_id
        where REGLA_1.nombre_completo = e_cuenta_externa.p_titular
    )
union
SELECT e_operacion_interna_des.p_numero_de_contrato
FROM L_OPERACION_INTERNA_01 
JOIN
E_OPERACION_INTERNA
ON L_OPERACION_INTERNA_01.FROM_ITEM_ID = E_OPERACION_INTERNA.ITEM_ID
JOIN
E_OPERACION_INTERNA_DES
ON L_OPERACION_INTERNA_01.TO_ITEM_ID = E_OPERACION_INTERNA_DES.ITEM_ID
WHERE L_OPERACION_INTERNA_01.DIRECTION = 'W'
and e_operacion_interna_des.p_numero_de_contrato not in (
select REGLA_1.p_numero_de_contrato
from REGLA_1
)
and e_operacion_interna.p_numero_de_contrato in (
select REGLA_1.p_numero_de_contrato
from REGLA_1
)





































######################################################################################

-- Regla 2


select REGLA_1.p_numero_de_contrato
    from REGLA_1
    right join 
    (
            select L_cuenta_externa_01.from_item_id, l_cuenta_externa_01.to_item_id from
            L_CUENTA_EXTERNA_01
    ) L_CUENTA_EXTERNA_01
    on REGLA_1.item_id = L_CUENTA_EXTERNA_01.FROM_ITEM_ID
    left join
    (
        select e_cuenta_externa.item_id, e_cuenta_externa.p_clabe
        from e_cuenta_externa
    ) e_cuenta_externa
    on e_cuenta_externa.item_id = L_CUENTA_EXTERNA_01.to_item_id
    where e_cuenta_externa.p_clabe not in (
        select e_cuenta_externa.p_clabe
        from REGLA_1
        right join 
        L_CUENTA_EXTERNA_01
        on REGLA_1.item_id = L_CUENTA_EXTERNA_01.FROM_ITEM_ID
        left join
        e_cuenta_externa
        on e_cuenta_externa.item_id = L_CUENTA_EXTERNA_01.to_item_id
        where REGLA_1.nombre_completo = e_cuenta_externa.p_titular
    )
    group by REGLA_1.p_numero_de_contrato --, personal_actinver_1.item_id, personal_actinver_1.nombre_completo

union
select personal_actinver_1.p_numero_de_contrato
from personal_actinver_1
    right join 
    E_operacion_interna
    on personal_actinver_1.p_numero_de_contrato = e_operacion_interna.p_numero_de_contrato
    right join
    L_OPERACION_INTERNA_01
    on L_OPERACION_INTERNA_01.FROM_ITEM_ID = E_operacion_interna.ITEM_ID
    left join
    E_OPERACION_INTERNA_DES
    on L_OPERACION_INTERNA_01.TO_ITEM_ID = E_OPERACION_INTERNA_DES.ITEM_ID
    left join
    e_contrato
    on e_contrato.p_numero_de_contrato = E_OPERACION_INTERNA_DES.p_numero_de_contrato
    join
    l_contrato_01
    on e_contrato.item_id = l_contrato_01.from_item_id
    join
    e_titular
    on
    e_titular.item_id = l_contrato_01.to_item_id
    where l_contrato_01.to_item_type_id = '6'
    and e_titular.p_nombre_completo not in (
        select personal_actinver_1.nombre_completo
        from personal_actinver_1
        )





-- VIEW DE PERSONAL ACTINVER QUE SE UTILIZA
-- ES LA GENERADA POR LA REGLA 1 !!!



create view REGLA_1 as
select distinct p_numero_de_contrato
, item_id
, nombre_completo
from 
(
select no_personal_actinver.item_id
, no_personal_actinver.p_numero_de_contrato
, no_personal_actinver.nombre_completo 
, no_personal_actinver.rfc
from
(
        select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_TITULAR.nombre_completo, e_titular.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '6'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_TITULAR
		) e_titular
		on l_contrato_01.TO_ITEM_ID = E_TITULAR.ITEM_ID
                where e_contrato.p_promotor like '%PERSONAL ACTINVER%'
) personal_actinver
inner join
(
select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_TITULAR.nombre_completo, e_titular.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '6'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_TITULAR
		) e_titular
		on l_contrato_01.TO_ITEM_ID = E_TITULAR.ITEM_ID
                where e_contrato.p_promotor not like '%PERSONAL ACTINVER%'
) no_personal_actinver
on personal_actinver.nombre_completo = no_personal_actinver.nombre_completo
and personal_actinver.rfc = no_personal_actinver.rfc
union
select no_personal_actinver.item_id, no_personal_actinver.p_numero_de_contrato
, no_personal_actinver.nombre_completo , no_personal_actinver.rfc
from
(
        select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_COTITULAR.nombre_completo, E_COTITULAR.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '8'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_COTITULAR
		) E_COTITULAR
		on l_contrato_01.TO_ITEM_ID = E_COTITULAR.ITEM_ID
                where e_contrato.p_promotor like '%PERSONAL ACTINVER%'
) personal_actinver
inner join
(
select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_COTITULAR.nombre_completo, E_COTITULAR.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '8'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_COTITULAR
		) E_COTITULAR
		on l_contrato_01.TO_ITEM_ID = E_COTITULAR.ITEM_ID
                where e_contrato.p_promotor not like '%PERSONAL ACTINVER%'
) no_personal_actinver
on personal_actinver.nombre_completo = no_personal_actinver.nombre_completo
and personal_actinver.rfc = no_personal_actinver.rfc
union 
select no_personal_actinver.item_id, no_personal_actinver.p_numero_de_contrato
, no_personal_actinver.nombre_completo , no_personal_actinver.rfc
from
(
        select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_AUTORIZADO.nombre_completo, E_AUTORIZADO.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '12'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_AUTORIZADO
		) E_AUTORIZADO
		on l_contrato_01.TO_ITEM_ID = E_AUTORIZADO.ITEM_ID
                where e_contrato.p_promotor like '%PERSONAL ACTINVER%'
) personal_actinver
inner join
(
select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_AUTORIZADO.nombre_completo, E_AUTORIZADO.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '12'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_AUTORIZADO
		) E_AUTORIZADO
		on l_contrato_01.TO_ITEM_ID = E_AUTORIZADO.ITEM_ID
                where e_contrato.p_promotor not like '%PERSONAL ACTINVER%'
) no_personal_actinver
on personal_actinver.nombre_completo = no_personal_actinver.nombre_completo
and personal_actinver.rfc = no_personal_actinver.rfc
union 
select no_personal_actinver.item_id, no_personal_actinver.p_numero_de_contrato
, no_personal_actinver.nombre_completo , no_personal_actinver.rfc
from
(
        select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_BENEFICIARIO.nombre_completo, E_BENEFICIARIO.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '10'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_BENEFICIARIO
		) E_BENEFICIARIO
		on l_contrato_01.TO_ITEM_ID = E_BENEFICIARIO.ITEM_ID
                where e_contrato.p_promotor like '%PERSONAL ACTINVER%'
) personal_actinver
inner join
(
select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_BENEFICIARIO.nombre_completo, E_BENEFICIARIO.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '10'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_BENEFICIARIO
		) E_BENEFICIARIO
		on l_contrato_01.TO_ITEM_ID = E_BENEFICIARIO.ITEM_ID
                where e_contrato.p_promotor not like '%PERSONAL ACTINVER%'
) no_personal_actinver
on personal_actinver.nombre_completo = no_personal_actinver.nombre_completo
and personal_actinver.rfc = no_personal_actinver.rfc
union 
select no_personal_actinver.item_id, no_personal_actinver.p_numero_de_contrato
, no_personal_actinver.nombre_completo , no_personal_actinver.rfc
from
(
        select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_REPRESENTANTE_LEGAL.nombre_completo, E_REPRESENTANTE_LEGAL.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '9'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_REPRESENTANTE_LEGAL
		) E_REPRESENTANTE_LEGAL
		on l_contrato_01.TO_ITEM_ID = E_REPRESENTANTE_LEGAL.ITEM_ID
                where e_contrato.p_promotor like '%PERSONAL ACTINVER%'
) personal_actinver
inner join
(
select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_REPRESENTANTE_LEGAL.nombre_completo, E_REPRESENTANTE_LEGAL.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '9'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_REPRESENTANTE_LEGAL
		) E_REPRESENTANTE_LEGAL
		on l_contrato_01.TO_ITEM_ID = E_REPRESENTANTE_LEGAL.ITEM_ID
                where e_contrato.p_promotor not like '%PERSONAL ACTINVER%'
) no_personal_actinver
on personal_actinver.nombre_completo = no_personal_actinver.nombre_completo
and personal_actinver.rfc = no_personal_actinver.rfc
union
select no_personal_actinver.item_id, no_personal_actinver.p_numero_de_contrato
, no_personal_actinver.nombre_completo , no_personal_actinver.rfc
from
(
        select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_ACCIONISTA.nombre_completo, E_ACCIONISTA.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '11'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_ACCIONISTA
		) E_ACCIONISTA
		on l_contrato_01.TO_ITEM_ID = E_ACCIONISTA.ITEM_ID
                where e_contrato.p_promotor like '%PERSONAL ACTINVER%'
) personal_actinver
inner join
(
select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_ACCIONISTA.nombre_completo, E_ACCIONISTA.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '11'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_ACCIONISTA
		) E_ACCIONISTA
		on l_contrato_01.TO_ITEM_ID = E_ACCIONISTA.ITEM_ID
                where e_contrato.p_promotor not like '%PERSONAL ACTINVER%'
) no_personal_actinver
on personal_actinver.nombre_completo = no_personal_actinver.nombre_completo
and personal_actinver.rfc = no_personal_actinver.rfc
) regla_1










 
 
 
 
 
 
 
 
 
 
 
 
 
 



########################################################################################



-- VIEW DE PERSONAL ACTINVER QUE SE UTILIZA
-- falta completar con los demas roles


create view personal_actinver_1 as 
select no_personal_actinver.item_id, no_personal_actinver.p_numero_de_contrato, no_personal_actinver.nombre_completo, no_personal_actinver.rfc
from
(select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_TITULAR.nombre_completo, e_titular.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID
			, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '6'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_TITULAR
		) e_titular
		on l_contrato_01.TO_ITEM_ID = E_TITULAR.ITEM_ID
                where e_contrato.p_promotor like '%PERSONAL ACTINVER%'
) personal_actinver
inner join
(
select e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, E_TITULAR.nombre_completo, e_titular.rfc
		from e_contrato
		right join
		(
			select l_contrato_01.FROM_ITEM_ID
			, l_contrato_01.TO_ITEM_ID
			from l_contrato_01
			where l_contrato_01.TO_ITEM_TYPE_ID = '6'
		) l_contrato_01
		on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
		left join
		(
			select ITEM_ID, p_rfc as rfc, p_nombre_completo as nombre_completo
			from E_TITULAR
		) e_titular
		on l_contrato_01.TO_ITEM_ID = E_TITULAR.ITEM_ID
                where e_contrato.p_promotor not like '%PERSONAL ACTINVER%'
) no_personal_actinver
on personal_actinver.nombre_completo = no_personal_actinver.nombre_completo
and personal_actinver.rfc = no_personal_actinver.rfc
group by no_personal_actinver.p_numero_de_contrato, no_personal_actinver.nombre_completo, no_personal_actinver.rfc, no_personal_actinver.item_id






















