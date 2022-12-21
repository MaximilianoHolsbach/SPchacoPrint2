DROP DATABASE IF EXISTS chaco_print_2;
CREATE DATABASE IF NOT EXISTS chaco_print_2;

USE chaco_print_2;

/* PERTENECE AL SEGMENTO IDENTIFICACION DE CLIENTE */

create table if not exists cliente(
    id_cliente int primary key not null auto_increment,
    nombre varchar(100),
    cuit varchar(11) default 'sin dato',
    fecha datetime default current_timestamp 
);

create table if not exists email_cliente(
    id_cliente int,
    email varchar(100),
    foreign key(id_cliente) references cliente(id_cliente) on delete cascade
);

create table if not exists telefono_cliente(
    id_cliente int,
    telefono varchar(50),
    foreign key(id_cliente) references cliente(id_cliente) on delete cascade
);

create table if not exists direccion_cliente(
    id_cliente int,
    direccion varchar(30),
    localidad varchar(60),
    provincia varchar(60),
    foreign key(id_cliente) references cliente(id_cliente) on delete cascade
);

/* PERTENECE AL SEGMENTO IDENTIFICACION DE RRHH */

create table if not exists puesto(
    id_puesto int primary key not null auto_increment,
    puesto varchar(30)
);

create table if not exists empleado(
    id_empleado int primary key not null auto_increment,
    nombre varchar(100),
    cuil varchar(11) default 'sin dato',
    puesto int,
    fecha datetime default current_timestamp 
);

create table if not exists email_empleado(
    id_empleado int,
    email varchar(100),
    foreign key(id_empleado) references empleado(id_empleado) on delete cascade
);

create table if not exists telefono_empleado(
    id_empleado int,
    telefono varchar(50),
    foreign key(id_empleado) references empleado(id_empleado) on delete cascade
);

create table if not exists direccion_empleado(
    id_empleado int,
    direccion varchar(100),
    foreign key(id_empleado) references empleado(id_empleado) on delete cascade
);

/* PERTENECE AL SEGMENTO IDENTIFICACION DE PROVEEDORES */

create table if not exists proveedor(
    id_proveedor int primary key not null auto_increment,
    nombre varchar(100),
    cuit varchar(11) default 'sin dato',
    fecha datetime default current_timestamp 
);

create table if not exists email_proveedor(
    id_proveedor int,
    email varchar(100),
    foreign key(id_proveedor) references proveedor(id_proveedor) on delete cascade
);

create table if not exists telefono_proveedor(
    id_proveedor int,
    telefono varchar(10),
    foreign key(id_proveedor) references proveedor(id_proveedor) on delete cascade
);

create table if not exists direccion_proveedor(
    id_proveedor int,
    direccion varchar(100),
    foreign key(id_proveedor) references proveedor(id_proveedor) on delete cascade
);

/* PERTENECE AL SEGMENTO DE STOCK */

create table if not exists stock(
    cod_interno int primary key not null auto_increment,
    id_producto varchar(100),
    nombre varchar(100),
    precio int,
    cantidad int,
    cantidad_minima int,
    proveedor int
);

/* SE UNE EL CLIENTE CON EL PRODUCTO */

create table if not exists venta(
    id_venta int primary key not null auto_increment,
    id_producto varchar(100),
    id_cliente int,
    nombre varchar(100),
    precio int,
    cantidad int,
    cantidad_minima int,
    fecha datetime default current_timestamp,
    foreign key(id_cliente) references cliente(id_cliente) on delete cascade
);