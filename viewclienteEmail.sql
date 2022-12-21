-- Une id y nombre de los clientes con sus mails 

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `chaco_print_2`.`cliente_email` AS
    SELECT 
        `c`.`id_cliente` AS `id_cliente`,
        `c`.`nombre` AS `nombre`,
        `email`.`email` AS `email`
    FROM
        (`chaco_print_2`.`cliente` `c`
        JOIN `chaco_print_2`.`email_cliente` `email` ON ((`c`.`id_cliente` = `email`.`id_cliente`)))