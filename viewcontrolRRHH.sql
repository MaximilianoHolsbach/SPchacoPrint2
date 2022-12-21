-- En este caso sirve para ver a cual empleado le falta el mail

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `chaco_print_2`.`control_datos_rrhh` AS
    SELECT 
        `e`.`id_empleado` AS `id_empleado`,
        `e`.`nombre` AS `nombre`,
        `ee`.`email` AS `email`
    FROM
        (`chaco_print_2`.`empleado` `e`
        LEFT JOIN `chaco_print_2`.`email_empleado` `ee` ON ((`e`.`id_empleado` = `ee`.`id_empleado`)))