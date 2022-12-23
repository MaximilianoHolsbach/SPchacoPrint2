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

-- ########## Pertenece a la creaciòn actualización, y por ultimo eliminación de elemento en el stock colocando en tres tablas distintas########

create table if not exists crear_auditoria_stock
(
    cod_interno int,
    id_producto varchar(100),
    nombre varchar(100),
    precio int,
    proveedor int,
    fecha date
);

create trigger `log_crear_producto`
after insert on `stock`
for each row
insert into `crear_auditoria_stock`(cod_interno,id_producto,nombre,precio,proveedor,fecha)
value (new.cod_interno,new.id_producto,new.nombre,new.precio,new.proveedor,curdate());

create table if not exists actualiza_auditoria_stock
(
    cod_interno int,
    id_producto varchar(100),
    nombre varchar(100),
    precio int,
    proveedor int,
    fecha date
);

create trigger `log_update_producto`
before update on `stock`
for each row
insert into `actualiza_auditoria_stock`(cod_interno,id_producto,nombre,precio,proveedor,fecha)
value (old.cod_interno,old.id_producto,old.nombre,old.precio,old.proveedor,curdate());

create table if not exists elimina_auditoria_stock
(
    cod_interno int,
    id_producto varchar(100),
    nombre varchar(100),
	usuario varchar(100),
    fecha date
);

create trigger `log_elimina_producto`
before delete on `stock`
for each row
insert into `elimina_auditoria_stock`(cod_interno,id_producto,nombre,usuario,fecha)
value (old.cod_interno,old.id_producto,old.nombre,user(),curdate());