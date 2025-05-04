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

CREATE TABLE IF NOT EXISTS BILL (
	bill_id integer unsigned primary key auto_increment,
	client_id integer not null,
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