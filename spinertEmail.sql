-- Insera valores en la tabla email empleado. si el valor de email ya existe arroja una leyenda. 

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_mail`(in id_empleado int, 
                                 in email varchar(100))
begin
    select count(ep.email) into @existe from email_empleado as ep where ep.email = email;
    if @existe = 0 then
        insert into email_empleado(id_empleado,email)
        value (id_empleado,email);
	else 
        select 'El mail ya existe';
	end if;
end