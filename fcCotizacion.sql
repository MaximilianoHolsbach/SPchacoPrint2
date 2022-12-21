CREATE DEFINER=`root`@`localhost` FUNCTION `cotizacion`(codigo_interno int) RETURNS float(11,2)
    READS SQL DATA
BEGIN
    declare resultado float;
    declare dolarhoy float;
    declare impuesto float;
    declare costo varchar(100);
    set dolarhoy = 175.50;
    set costo = (select precio from stock where cod_interno = codigo_interno);
    set resultado = (costo * dolarhoy) * 1.21;
    return resultado;
END

-- Calculo de cotizacion de cualquier producto del stock