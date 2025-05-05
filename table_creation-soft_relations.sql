CREATE TABLE if not exists CLIENTS (
	client_id integer unsigned primary key auto_increment,
	name varchar(100) not null,
	email varchar(60) not null unique,
	phone_number varchar(15),
	created_at timestamp not null default CURRENT_TIMESTAMP,
	updated_at timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

CREATE TABLE if not exists PRODUCTS (
	product_id integer unsigned primary key auto_increment,
	name varchar(100) not null,
	slug varchar(200) not null unique,
	description text,
	created_at timestamp not null default CURRENT_TIMESTAMP,
	updated_at timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS BILLS (
	bill_id integer unsigned primary key auto_increment,
	client_id integer unsigned not null,
	total float,
	status enum('open', 'paid', 'lost') not null default 'open',
	created_at timestamp not null default CURRENT_TIMESTAMP,
	updated_at timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS BILL_PRODUCTS (
	bill_product_id integer unsigned primary key auto_increment,
	bill_id integer unsigned not null,
	product_id integer unsigned not null,
	quantity integer not null default 1,
	created_at timestamp not null default CURRENT_TIMESTAMP,
	updated_at timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

-- Soft relation refers to when the responsibility to establish and obey the relations
-- is in the logic (Backend), not in the db.

-- This is useful when you want to ensure flexibility.
-- Any change to tables will be easily implemented