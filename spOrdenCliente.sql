-- Ordena la tabla cliente segun el parametro de ingreso. 

CREATE DEFINER=`root`@`localhost` PROCEDURE `orden_cliente`(in orden varchar(20))
begin
    if orden <> '' then
        set @cliente_orden = concat('order by',' ',orden);
	else 
        set @cliente_orden = '';
	end if;
    set @consulta = concat('select * from cliente',' ',@cliente_orden);
    prepare mi_consulta from @consulta;
    execute mi_consulta;
    deallocate prepare mi_consulta;
end