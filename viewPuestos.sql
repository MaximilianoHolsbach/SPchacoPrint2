-- Sirve para ver los nombres de los empleados y su puestos

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `chaco_print_2`.`puestos` AS
    SELECT 
        `p`.`puesto` AS `puesto`, `e`.`nombre` AS `nombre`
    FROM
        (`chaco_print_2`.`puesto` `p`
        JOIN `chaco_print_2`.`empleado` `e` ON ((`p`.`id_puesto` = `e`.`puesto`)))