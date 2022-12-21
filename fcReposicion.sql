CREATE DEFINER=`root`@`localhost` FUNCTION `reposicion`(codigo_interno int) RETURNS varchar(15) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    declare resultado int;
    declare cantidad1 int;
    declare cantidad2 int;
    declare respuesta varchar(15);
    select cantidad into cantidad1 from stock where cod_interno = codigo_interno;
    select cantidad_minima into cantidad2 from stock where cod_interno = codigo_interno;
    set resultado = cantidad1 - cantidad2;
    if resultado < 0 then
        set respuesta = 'comprar';
        return respuesta;
	else
        set respuesta = 'no comprar';
        return respuesta;
    end if;
END

-- Función con condicional para saber cuales productos estan por debajo de la cantidad minima del stock