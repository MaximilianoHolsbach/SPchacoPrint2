use chaco_print_2;

select s.id_producto,s.nombre,reposicion(s.cod_interno) from stock s where s.cod_interno = 1;

-- Con esta consulta traigo todos los datos pertinentes del producto a reponer. 