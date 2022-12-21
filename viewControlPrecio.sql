-- Sirve para ver que precios estan por encima del promedio, y controlar su valor

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `chaco_print_2`.`control_precio` AS
    SELECT 
        `chaco_print_2`.`stock`.`id_producto` AS `id_producto`,
        `chaco_print_2`.`stock`.`nombre` AS `nombre`,
        `chaco_print_2`.`stock`.`precio` AS `precio`
    FROM
        `chaco_print_2`.`stock`
    WHERE
        (`chaco_print_2`.`stock`.`precio` >= (SELECT 
                AVG(`chaco_print_2`.`stock`.`precio`)
            FROM
                `chaco_print_2`.`stock`))