





create view REGLA_1 as
select distinct p_numero_de_contrato
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

























################################################################################################

-- Regla 1



select no_personal_actinver.item_id
, no_personal_actinver.p_numero_de_contrato
--, no_personal_actinver.nombre_completo 
--, no_personal_actinver.rfc
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


















