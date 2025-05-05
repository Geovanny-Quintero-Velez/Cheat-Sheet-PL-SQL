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
	updated_at timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    foreign key (client_id) references CLIENTS(client_id) 
        on delete cascade 
        on update cascade
);

-- Be careful with the cascade function. In some bussiness logics you want to keep the bill
-- information even when the client information is deleted. It will depend of the specific needs.

CREATE TABLE IF NOT EXISTS BILL_PRODUCTS (
	bill_product_id integer unsigned primary key auto_increment,
	bill_id integer unsigned not null,
	product_id integer unsigned not null,
	quantity integer not null default 1,
	created_at timestamp not null default CURRENT_TIMESTAMP,
	updated_at timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
	foreign key (bill_id) references BILLS(bill_id)
		on update cascade
		on delete cascade,
	foreign key (product_id) references PRODUCTS(product_id)
		on update cascade
		on delete cascade
);

-- Hard relation between tables refers to when tables use foreign key and reference constraint.
-- This is because the DB has the responsibility to make sure those relations are obeyed.