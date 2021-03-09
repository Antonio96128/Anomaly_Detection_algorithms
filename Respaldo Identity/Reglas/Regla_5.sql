



-- Regla 5



create view REGLA_5_ACCIONISTA AS
select distinct E_ACCIONISTA.P_BP
, E_ACCIONISTA.P_NOMBRE_COMPLETO
from
(
    select L_CONTRATO_01.TO_ITEM_TYPE_ID 
    , L_CONTRATO_01.TO_ITEM_ID
    , count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
    from L_CONTRATO_01
    where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
    group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
    having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3
) regla_5
join 
    E_ACCIONISTA
    on E_ACCIONISTA.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 11







create view REGLA_5_AUTORIZADO AS
select distinct E_AUTORIZADO.P_RFC
, E_AUTORIZADO.P_BP
, E_AUTORIZADO.P_NOMBRE_COMPLETO
from
(
    select L_CONTRATO_01.TO_ITEM_TYPE_ID 
    , L_CONTRATO_01.TO_ITEM_ID
    , count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
    from L_CONTRATO_01
    where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
    group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
    having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3
) regla_5
join 
    E_AUTORIZADO
    on E_AUTORIZADO.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 12







create view REGLA_5_BENEFICIARIO AS
select distinct E_BENEFICIARIO.P_BP
, E_BENEFICIARIO.P_NOMBRE_COMPLETO
from
(
    select L_CONTRATO_01.TO_ITEM_TYPE_ID 
    , L_CONTRATO_01.TO_ITEM_ID
    , count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
    from L_CONTRATO_01
    where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
    group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
    having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3
) regla_5
join 
    E_BENEFICIARIO
    on E_BENEFICIARIO.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 10

	
	

	

	
create view REGLA_5_CORREO_ELECTRONICO AS
select distinct E_CORREO_ELECTRONICO.P_CORREO
from
(
    select L_CONTRATO_01.TO_ITEM_TYPE_ID 
    , L_CONTRATO_01.TO_ITEM_ID
    , count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
    from L_CONTRATO_01
    where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
    group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
    having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3
) regla_5
join 
    E_CORREO_ELECTRONICO
    on E_CORREO_ELECTRONICO.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 5
	
	
	
	
	
	
create view REGLA_5_COTITULAR AS
select distinct E_COTITULAR.P_NOMBRE_COMPLETO
, E_COTITULAR.P_RFC
, E_COTITULAR.P_BP
from
(
    select L_CONTRATO_01.TO_ITEM_TYPE_ID 
    , L_CONTRATO_01.TO_ITEM_ID
    , count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
    from L_CONTRATO_01
    where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
    group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
    having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3
) regla_5
join 
    E_COTITULAR
    on E_COTITULAR.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 8
	
	
	
	
	
	
	
	
create view REGLA_5_DOMICILIO AS
select distinct E_DOMICILIO.P_CALLE
, E_DOMICILIO.P_NUMERO_EXT
, E_DOMICILIO.P_CIUDAD
, E_DOMICILIO.P_CP
, E_DOMICILIO.P_COLONIA
, E_DOMICILIO.P_ESTADO
from
(
    select L_CONTRATO_01.TO_ITEM_TYPE_ID 
    , L_CONTRATO_01.TO_ITEM_ID
    , count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
    from L_CONTRATO_01
    where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
    group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
    having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3
) regla_5
join 
    E_DOMICILIO
    on E_DOMICILIO.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 3
	
	
	
	
	
	
	


create view REGLA_5_PERSONA_MORAL AS
select distinct E_PERSONA_MORAL.P_RAZON_SOCIAL
, E_PERSONA_MORAL.P_RFC
, E_PERSONA_MORAL.P_BP
from
(
    select L_CONTRATO_01.TO_ITEM_TYPE_ID 
    , L_CONTRATO_01.TO_ITEM_ID
    , count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
    from L_CONTRATO_01
    where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
    group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
    having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3
) regla_5
join 
    E_PERSONA_MORAL
    on E_PERSONA_MORAL.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 
	
	
	
	
	
	
create view REGLA_5_REPRESENTANTE_LEGAL AS
select distinct E_REPRESENTANTE_LEGAL.P_NOMBRE_COMPLETO
, E_REPRESENTANTE_LEGAL.P_RFC
, E_REPRESENTANTE_LEGAL.P_BP
from
(
    select L_CONTRATO_01.TO_ITEM_TYPE_ID 
    , L_CONTRATO_01.TO_ITEM_ID
    , count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
    from L_CONTRATO_01
    where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
    group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
    having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3
) regla_5
join 
    E_REPRESENTANTE_LEGAL
    on E_REPRESENTANTE_LEGAL.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 9
	
	
	
	
	
	
	
	
	
	
create view REGLA_5_TELEFONO AS
select distinct E_TELEFONO.P_NUMERO_DE_TELEFONO
from
(
    select L_CONTRATO_01.TO_ITEM_TYPE_ID 
    , L_CONTRATO_01.TO_ITEM_ID
    , count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
    from L_CONTRATO_01
    where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
    group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
    having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3
) regla_5
join 
    E_TELEFONO
    on E_TELEFONO.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 4
	
	
	
	
	
create view REGLA_5_TITULAR AS
select distinct E_TITULAR.P_NOMBRE_COMPLETO
, E_TITULAR.P_RFC
, E_TITULAR.P_BP
from
(
    select L_CONTRATO_01.TO_ITEM_TYPE_ID 
    , L_CONTRATO_01.TO_ITEM_ID
    , count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
    from L_CONTRATO_01
    where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
    group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
    having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3
) regla_5
join 
    E_TITULAR
    on E_TITULAR.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 6
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


#######################################################################################################################

create view prueba_regla5 as 
select E_ACCIONISTA.P_RFC as accionista_rfc
, E_AUTORIZADO.P_RFC as autorizado_rfc
, E_BENEFICIARIO.P_RFC as beneficiario_rfc
, E_CORREO_ELECTRONICO.P_CORREO as correo_electronico
, E_COTITULAR.P_RFC as cotitular_rfc
, concat(E_DOMICILIO.p_calle, concat(' ', concat(E_DOMICILIO.p_numero_int, concat(' ', concat(E_DOMICILIO.p_ciudad, concat(' ', E_DOMICILIO.p_cp)))))) as domicilio       
, E_PERSONA_MORAL.P_RFC as persona_moral_rfc
, E_REPRESENTANTE_LEGAL.P_RFC as representante_legal_rfc
, E_TELEFONO.P_NUMERO_DE_TELEFONO as telefono
, E_TITULAR.P_RFC as titular_rfc
from
(
    select L_CONTRATO_01.TO_ITEM_TYPE_ID 
    , L_CONTRATO_01.TO_ITEM_ID
    , count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
    from L_CONTRATO_01
    where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
    group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
    having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3
) regla_5
join 
    E_ACCIONISTA
    on E_ACCIONISTA.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 11
join 
    E_AUTORIZADO
    on E_AUTORIZADO.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 12
join 
    E_BENEFICIARIO
    on E_BENEFICIARIO.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 10
join 
    E_CORREO_ELECTRONICO
    on E_CORREO_ELECTRONICO.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 5
join 
    E_COTITULAR
    on E_COTITULAR.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 8
join 
    E_DOMICILIO
    on E_DOMICILIO.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 3
join 
    E_PERSONA_MORAL
    on E_PERSONA_MORAL.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 7
join 
    E_REPRESENTANTE_LEGAL
    on E_REPRESENTANTE_LEGAL.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 9
join 
    E_TELEFONO
    on E_TELEFONO.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 4
join 
    E_TITULAR
    on E_TITULAR.ITEM_ID = regla_5.TO_ITEM_ID and regla_5.TO_ITEM_TYPE_ID = 6










create view prueba_regla5_ids_II as
select concat(distinct(accionista_rfc), '_accionista') as ID_II
from prueba_regla5
where accionista_rfc is not null
union
select concat(distinct(autorizado_rfc), '_autorizado') as ID_II
from prueba_regla5
where autorizado_rfc is not null
union
select concat(distinct(beneficiario_rfc), '_beneficiario') as ID_II
from prueba_regla5
where beneficiario_rfc is not null
union
select concat(distinct(correo_electronico), '_correo') as ID_II
from prueba_regla5
where correo_electronico is not null
union
select concat(distinct(cotitular_rfc), '_cotitular') as ID_II
from prueba_regla5
where cotitular_rfc is not null
union
select concat(distinct(domicilio), '_domicilio') as ID_II
from prueba_regla5
where domicilio is not null
union 
select concat(distinct(persona_moral_rfc), '_persona_moral') as ID_II
from prueba_regla5
where persona_moral_rfc is not null
union
select concat(distinct(representante_legal_rfc), '_representante_legal') as ID_II
from prueba_regla5
where representante_legal_rfc is not null
union
select concat(distinct(telefono), '_telefono') as ID_II
from prueba_regla5
where telefono is not null
union
select concat(distinct(titular_rfc), '_titular') as ID_II
from prueba_regla5
where titular_rfc is not null
















-- FINAL



select L_CONTRATO_01.TO_ITEM_TYPE_ID 
, L_CONTRATO_01.TO_ITEM_ID
, count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
from L_CONTRATO_01
where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11,12,10,5,8,3,7,9,4,6)
group by L_CONTRATO_01.TO_ITEM_TYPE_ID, L_CONTRATO_01.TO_ITEM_ID
having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3








-- TEMPORAL


select L_CONTRATO_01.TO_ITEM_ID
, count(distinct(L_CONTRATO_01.FROM_ITEM_ID))
from L_CONTRATO_01
where L_CONTRATO_01.TO_ITEM_TYPE_ID in (11) --(11,12,10,5,8,3,7,9,4,6)
group by L_CONTRATO_01.TO_ITEM_ID
having count(distinct(L_CONTRATO_01.FROM_ITEM_ID)) > 3



