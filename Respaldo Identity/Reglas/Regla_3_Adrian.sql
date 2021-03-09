





create view REGLA_3 as
select distinct salida_dinero_efectivo.p_numero_de_contrato as p_numero_de_contrato
from 
(
        select e_contrato.ITEM_ID as ITEM_ID_contrato
        , e_contrato.p_numero_de_contrato
        , e_contrato.p_posicion_actual
        , sum(L_OPERACION_INTERNA_01.p_Monto) as salida_efectivo
        from
        e_contrato
        right join 
        (
                select * 
                from l_contrato_01
                where l_contrato_01.TO_ITEM_TYPE_ID = 14    
        ) l_contrato_01
        on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
        left join
        E_operacion_interna
        on l_contrato_01.TO_ITEM_ID = E_operacion_interna.ITEM_ID
        right join
        (
                select * 
                from
                L_OPERACION_INTERNA_01
                where L_OPERACION_INTERNA_01.p_Tipo_de_operacion in ('Efectivos en ventanilla','Ordenes de pago','Cheque cobrado en Actinver','Retiro Cajero ATM')
                         and l_operacion_interna_01.direction = 'w'
        ) L_OPERACION_INTERNA_01
        on E_operacion_interna.ITEM_ID = L_OPERACION_INTERNA_01.FROM_ITEM_ID 
        where current date - 1 month <= L_OPERACION_INTERNA_01.p_Fecha and L_OPERACION_INTERNA_01.p_Fecha <= current date 
        group by e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, e_contrato.p_posicion_actual
) salida_dinero_efectivo
join
(
        select e_contrato.ITEM_ID as ITEM_ID_contrato
        , e_contrato.p_numero_de_contrato
        , e_contrato.p_posicion_actual
        , sum(L_OPERACION_INTERNA_01.p_Monto) as salida_dinero
        from
        e_contrato
        right join 
        (
                select * 
                from l_contrato_01
                where l_contrato_01.TO_ITEM_TYPE_ID = 14    
        ) l_contrato_01
        on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
        left join
        E_operacion_interna
        on l_contrato_01.TO_ITEM_ID = E_operacion_interna.ITEM_ID
        right join
        (
                select * 
                from
                L_OPERACION_INTERNA_01
                where l_operacion_interna_01.direction = 'W'
        ) L_OPERACION_INTERNA_01
        on E_operacion_interna.ITEM_ID = L_OPERACION_INTERNA_01.FROM_ITEM_ID 
        where current date - 1 month <= L_OPERACION_INTERNA_01.p_Fecha and L_OPERACION_INTERNA_01.p_Fecha <= current date
        group by e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, e_contrato.p_posicion_actual
) salida_dinero_total_interna
on salida_dinero_efectivo.ITEM_ID_contrato = salida_dinero_total_interna.ITEM_ID_contrato
join
(
    select e_contrato.ITEM_ID as ITEM_ID_contrato
        , e_contrato.p_numero_de_contrato
        , e_contrato.p_posicion_actual
        , sum(L_CUENTA_EXTERNA_01.p_Monto) as salida_dinero
        from
        e_contrato
        right join 
        (
                select * 
                from
                L_CUENTA_EXTERNA_01
                where L_CUENTA_EXTERNA_01.direction = 'W' and L_CUENTA_EXTERNA_01.FROM_ITEM_TYPE_ID = 1
        ) L_CUENTA_EXTERNA_01
        on e_contrato.item_id = L_CUENTA_EXTERNA_01.FROM_ITEM_ID 
        where current date - 1 month <= L_CUENTA_EXTERNA_01.p_Fecha and L_CUENTA_EXTERNA_01.p_fecha <= current date 
        group by e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, e_contrato.p_posicion_actual
) salida_externa
on salida_dinero_efectivo.ITEM_ID_contrato = salida_externa.ITEM_ID_contrato
where 0.5*(salida_dinero_efectivo.p_posicion_actual + (salida_dinero_total_interna.salida_dinero + salida_externa.salida_dinero)) <= salida_dinero_efectivo.salida_efectivo
and salida_dinero_efectivo.salida_efectivo > 100000


























#########################################################################################################













-- Regla 3 con explicacion de Adrian






select salida_dinero_efectivo.ITEM_ID_contrato as ITEM_ID_contrato
, salida_dinero_efectivo.p_numero_de_contrato as p_numero_de_contrato
, salida_dinero_efectivo.p_posicion_actual as p_posicion_actual
, salida_dinero_efectivo.salida_efectivo as salida_efectivo
, salida_dinero_total_interna.salida_dinero as salida_interna_total
, salida_externa.salida_dinero as salida_dinero_externa
from 
(
        select e_contrato.ITEM_ID as ITEM_ID_contrato
        , e_contrato.p_numero_de_contrato
        , e_contrato.p_posicion_actual
        , sum(L_OPERACION_INTERNA_01.p_Monto) as salida_efectivo
        from
        e_contrato
        right join 
        (
                select * 
                from l_contrato_01
                where l_contrato_01.TO_ITEM_TYPE_ID = 14    
        ) l_contrato_01
        on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
        left join
        E_operacion_interna
        on l_contrato_01.TO_ITEM_ID = E_operacion_interna.ITEM_ID
        right join
        (
                select * 
                from
                L_OPERACION_INTERNA_01
                where L_OPERACION_INTERNA_01.p_Tipo_de_operacion in ('Efectivos en ventanilla','Ordenes de pago','Cheque cobrado en Actinver','Retiro Cajero ATM')
                         and l_operacion_interna_01.direction = 'w'
        ) L_OPERACION_INTERNA_01
        on E_operacion_interna.ITEM_ID = L_OPERACION_INTERNA_01.FROM_ITEM_ID 
        where current date - 1 month <= L_OPERACION_INTERNA_01.p_Fecha and L_OPERACION_INTERNA_01.p_Fecha <= current date 
        group by e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, e_contrato.p_posicion_actual
) salida_dinero_efectivo
join
(
        select e_contrato.ITEM_ID as ITEM_ID_contrato
        , e_contrato.p_numero_de_contrato
        , e_contrato.p_posicion_actual
        , sum(L_OPERACION_INTERNA_01.p_Monto) as salida_dinero
        from
        e_contrato
        right join 
        (
                select * 
                from l_contrato_01
                where l_contrato_01.TO_ITEM_TYPE_ID = 14    
        ) l_contrato_01
        on e_contrato.ITEM_ID = l_contrato_01.FROM_ITEM_ID
        left join
        E_operacion_interna
        on l_contrato_01.TO_ITEM_ID = E_operacion_interna.ITEM_ID
        right join
        (
                select * 
                from
                L_OPERACION_INTERNA_01
                where l_operacion_interna_01.direction = 'W'
        ) L_OPERACION_INTERNA_01
        on E_operacion_interna.ITEM_ID = L_OPERACION_INTERNA_01.FROM_ITEM_ID 
        where current date - 1 month <= L_OPERACION_INTERNA_01.p_Fecha and L_OPERACION_INTERNA_01.p_Fecha <= current date
        group by e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, e_contrato.p_posicion_actual
) salida_dinero_total_interna
on salida_dinero_efectivo.ITEM_ID_contrato = salida_dinero_total_interna.ITEM_ID_contrato
join
(
    select e_contrato.ITEM_ID as ITEM_ID_contrato
        , e_contrato.p_numero_de_contrato
        , e_contrato.p_posicion_actual
        , sum(L_CUENTA_EXTERNA_01.p_Monto) as salida_dinero
        from
        e_contrato
        right join 
        (
                select * 
                from
                L_CUENTA_EXTERNA_01
                where L_CUENTA_EXTERNA_01.direction = 'W' and L_CUENTA_EXTERNA_01.FROM_ITEM_TYPE_ID = 1
        ) L_CUENTA_EXTERNA_01
        on e_contrato.item_id = L_CUENTA_EXTERNA_01.FROM_ITEM_ID 
        where current date - 1 month <= L_CUENTA_EXTERNA_01.p_Fecha and L_CUENTA_EXTERNA_01.p_fecha <= current date 
        group by e_contrato.ITEM_ID, e_contrato.p_numero_de_contrato, e_contrato.p_posicion_actual
) salida_externa
on salida_dinero_efectivo.ITEM_ID_contrato = salida_externa.ITEM_ID_contrato
where 0.5*(salida_dinero_efectivo.p_posicion_actual + (salida_dinero_total_interna.salida_dinero + salida_externa.salida_dinero)) <= salida_dinero_efectivo.salida_efectivo
and salida_dinero_efectivo.salida_efectivo > 100000









































