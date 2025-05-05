create table test (
    test_id integer unsigned primary key auto_increment,
    name varchar(100) not null,
    qty integer,
    created_at timestamp not null default CURRENT_TIMESTAMP
);

alter table test add column price float; -- puede especificarse la posicion con (after column_name)
alter table test drop column price;

alter table test add column price float;
alter table test modify column price decimal(10,3) not null;

alter table test rename column price to prices;

alter table test rename to tests;

alter table tests modify column prices decimal(10,3) not null default 10; 
-- Para cambiar algo pequeño de un valor puedes modificar por el mismo elemento con el detalle cambiado

