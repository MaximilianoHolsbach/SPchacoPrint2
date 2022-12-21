-- sirve para ver quienes estan en cantidades minimas y el proveedor al que hay que llamar

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `chaco_print_2`.`control_stock` AS
    SELECT 
        `chaco_print_2`.`stock`.`id_producto` AS `id_producto`,
        `chaco_print_2`.`stock`.`nombre` AS `nombre`,
        `chaco_print_2`.`stock`.`cantidad` AS `cantidad`,
        `chaco_print_2`.`stock`.`proveedor` AS `proveedor`
    FROM
        `chaco_print_2`.`stock`
    WHERE
        (`chaco_print_2`.`stock`.`cantidad` <= `chaco_print_2`.`stock`.`cantidad_minima`)