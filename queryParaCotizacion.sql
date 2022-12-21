use chaco_print_2;

select id_producto, nombre , cotizacion(cod_interno) as Precio_en_pesos from stock where cod_interno = 5;

-- Con esta consulta traigo todos los datos relacionados al producto a cotizar