create table cd_salesperson_data_tf (
  sp_id SERIAL primary key,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

select * from cd_salesperson_data_tf 

create table cd_vehicle_info_tf (
  vehicle_id SERIAL primary key,
  vin NUMERIC(17),
  make VARCHAR(50),
  model VARCHAR(50),
  year VARCHAR(4),
  type VARCHAR(10),
  color VARCHAR(50),
  is_inventory BOOLEAN
);

select * from cd_vehicle_info_tf

create table cd_customer_info_tf (
  customer_id SERIAL primary key,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_number NUMERIC(11),
  address VARCHAR(150),
  city VARCHAR(50),
  state VARCHAR(2),
  zip_code NUMERIC(5),
  vehicle_id INTEGER not null,
  foreign key(vehicle_id) references cd_vehicle_info_tf(vehicle_id)
);

select * from cd_customer_info_tf

create table cd_sale_invoices_tf (
  sale_invoice_id SERIAL primary key,
  sp_id INTEGER not null,
  customer_id INTEGER not null,
  vehicle_id INTEGER not null,
  total NUMERIC(6,2),
  foreign key(sp_id) references cd_salesperson_data_tf(sp_id),
  foreign key(customer_id) references cd_customer_info_tf(customer_id),
  foreign key(vehicle_id) references cd_vehicle_info_tf(vehicle_id)
);

select * from cd_sale_invoices_tf

create table cd_parts_inventory_tf (
  part_id SERIAL primary key,
  part_number VARCHAR(50),
  description VARCHAR(150),
  cost DECIMAL(5,2),
  retail DECIMAL(5,2)
 );

select * from cd_parts_inventory_tf

create table cd_parts_invoices_tf (
  part_request_id SERIAL primary key,
  part_id INTEGER not null,
  qty_requested NUMERIC(2),
  foreign key(part_id) references cd_parts_inventory_tf(part_id)
 );

select * from cd_parts_invoices_tf

create table cd_technicians_tf (
  technician_id SERIAL primary key,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
 );

select * from cd_technicians_tf

create table cd_services_tf (
  service_id SERIAL primary key,
  service_desc VARCHAR(200),
  hourly_rate DECIMAL(5,2)
 );

select * from cd_services_tf

create table cd_service_records_tf (
  service_record_id SERIAL primary key,
  service_id INTEGER not null,
  part_request_id INTEGER not null,
  technician_id INTEGER not null,
  foreign key(service_id) references cd_services_tf(service_id),
  foreign key(part_request_id) references cd_parts_invoices_tf(part_request_id),
  foreign key(technician_id) references cd_technicians_tf(technician_id)
);

select * from cd_service_records_tf

create table cd_service_invoices_tf (
  service_invoice_id SERIAL primary key,
  customer_id INTEGER not null,
  vehicle_id INTEGER not null,
  service_record_id INTEGER not null,
  total_estimated_cost NUMERIC(6,2),
  date_submitted DATE,
  date_completed DATE,
  foreign key(customer_id) references cd_customer_info_tf(customer_id),
  foreign key(vehicle_id) references cd_vehicle_info_tf(vehicle_id),
  foreign key(service_record_id) references cd_service_records_tf(service_record_id)
);

select * from cd_service_invoices_tf
