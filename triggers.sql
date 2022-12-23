use chaco_print_2;

-- Pertenece a la creacion y actualizacion del cliente

drop table auditoria_cliente;
create table if not exists auditoria_cliente
(
    id_cliente int,
    nombre varchar(100),
    cuit varchar(11),
    fecha date
);

create trigger `log_crear_cliente`
after insert on `cliente`
for each row
insert into `auditoria_cliente`(id_cliente,nombre,cuit,fecha)
value (new.id_cliente,new.nombre,new.cuit,new.fecha);

create trigger `log_update_cliente`
before update on `cliente`
for each row
insert into `auditoria_cliente`(id_cliente,nombre,cuit,fecha)
value (old.id_cliente,old.nombre,old.cuit,curdate());