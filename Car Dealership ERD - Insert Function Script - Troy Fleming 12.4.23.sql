-- Insert salesperson data
create or replace function add_sp(
	_sp_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR
)
returns void
as $MAIN$
begin
	insert INTO cd_salesperson_data_tf(sp_id, first_name, last_name)
	VALUES(_sp_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

-- Insert vehicle data
create or replace function add_vehicleid(
	_vehicle_id INTEGER,
 	_vin VARCHAR,
 	_make VARCHAR,
 	_model VARCHAR,
 	_year NUMERIC,
 	_type VARCHAR,
 	_color VARCHAR,
 	_is_inventory BOOLEAN
)
returns void
as $MAIN$
begin
	insert INTO cd_vehicle_info_tf(vehicle_id, vin, make, model, year, type, color, is_inventory)
	VALUES(_vehicle_id, _vin, _make, _model, _year, _type, _color, _is_inventory);
end;
$MAIN$
language plpgsql;

-- select add_vehicleid(5, '3JUIS98GKIOEL346J', 'HONDA', 'CIVIC', 2023, '4DOOR', 'ORANGE', '1')


-- Insert customer information
create or replace function add_customer(
	_customer_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR,
	_phone_number VARCHAR,
	_address VARCHAR,
	_city VARCHAR,
	_state VARCHAR,
	_zip_code VARCHAR,
	_vehicle_id INTEGER
)
returns void
as $MAIN$
begin
	insert into cd_customer_info_tf(customer_id, first_name, last_name, phone_number, address, city, state, zip_code, vehicle_id)
	VALUES(_customer_id, _first_name, _last_name, _phone_number, _address, _city, _state, _zip_code, _vehicle_id); 
end;
$MAIN$
language plpgsql;

-- select add_customer(1, 'Jose', 'Muldoon', '17895678902', '5421 APOLLO CRT', 'TUSCON', 'AZ', '80532', 4)
-- select add_customer(2, 'Nina', 'Nillano', '18395679809', '410 GALAXY COAST RD', 'DENVER', 'CO', '32567', 2)
-- select add_customer(3, 'Tom', 'Toretto', '17339586782', '230 MILE ST', 'LONG BEACH', 'CA', '14643', 5)
-- select add_customer(4, 'Ilsa', 'Iverson', '18739286970', '2225 REDRUM RD', 'MANHATTAN', 'NY', '05335', 3)
-- select add_customer(5, 'Marcus', 'Matthews', '18356098320', '8503 UPHILL DR', 'SAN FRANCISCO', 'CA', '67532', 1)

-- Insert sales invoice data
create or replace function add_saleinvoice(
 	_sale_invoice_id INTEGER,
 	_sp_id INTEGER,
 	_customer_id INTEGER,
 	_vehicle_id INTEGER,
 	_total NUMERIC
)
returns void
as $MAIN$
begin
	insert into cd_sale_invoices_tf(sale_invoice_id, sp_id, customer_id, vehicle_id, total)
	VALUES(_sale_invoice_id, _sp_id, _customer_id, _vehicle_id, _total); 
end;
$MAIN$
language plpgsql;

-- select add_saleinvoice(1, 5, 2, 5, 9999.99)
-- select add_saleinvoice(2, 2, 1, 1, 7999.99)
-- select add_saleinvoice(3, 2, 1, 2, 5999.99)

-- Insert technician data
create or replace function add_technician(
 	_technician_id INTEGER,
 	_first_name VARCHAR,
 	_last_name VARCHAR
)
returns void
as $MAIN$
begin
	insert into cd_technicians_tf(technician_id, first_name, last_name)
	VALUES(_technician_id, _first_name, _last_name); 
end;
$MAIN$
language plpgsql;

-- select add_technician(1, 'Victor', 'VonVroom')
-- select add_technician(2, 'Samual', 'Speedsfast')

-- Insert services data
create or replace function add_services(
 	_service_id INTEGER,
 	_service_desc VARCHAR,
 	_hourly_rate DECIMAL
)
returns void
as $MAIN$
begin
	insert into cd_services_tf(service_id, service_desc, hourly_rate)
	VALUES(_service_id, _service_desc, _hourly_rate); 
end;
$MAIN$
language plpgsql;

-- select add_services(1, 'Oil Change', 5.99)
-- select add_services(2, 'Tire Rotation', 12.99)
-- select add_services(3, 'Windshield Replacement', 34.99)
-- select add_services(4, 'A/C Recharge', 33.99)
-- select add_services(5, 'Engine Replacement', 305.99)

-- Insert parts data
create or replace function add_partinfo(
 	_part_id INTEGER,
 	_part_number VARCHAR,
 	_description VARCHAR,
 	_cost DECIMAL,
 	_retail DECIMAL
)
returns void
as $MAIN$
begin
	insert into cd_parts_inventory_tf(part_id, part_number, description, cost, retail)
	VALUES(_part_id, _part_number, _description, _cost, _retail); 
end;
$MAIN$
language plpgsql;

-- select add_partinfo(1, 'WNDSHLD-500', 'GORILLA GLASS WINDHSIELD', 143.99, 259.99)
-- select add_partinfo(2, 'SAE5/30-5QT', '5QT CASTROL SAE5/30 OIL', 6.75, 14.99)
-- select add_partinfo(3, 'HANCOOK350S-4', 'HANCOOK WINTER RATED TIRES (4PK)', 423.99, 899.99)

-- Insert part invoices data
create or replace function add_partinvoice(
 	_part_request_id INTEGER,
 	_part_id INTEGER,
 	_qty_requested INTEGER
)
returns void
as $MAIN$
begin
	insert into cd_parts_invoices_tf(part_request_id, part_id, qty_requested)
	VALUES(_part_request_id, _part_id, _qty_requested); 
end;
$MAIN$
language plpgsql;

-- select add_partinvoice(1, 2, 2)
-- select add_partinvoice(2, 3, 1)

-- Insert service record data
create or replace function add_servicerecord(
 _service_record_id INTEGER,
 _service_id INTEGER,
 _part_request_id INTEGER,
 _technician_id INTEGER
)
returns void
as $MAIN$
begin
	insert into cd_service_records_tf(service_record_id, service_id, part_request_id, technician_id)
	VALUES(_service_record_id, _service_id, _part_request_id, _technician_id); 
end;
$MAIN$
language plpgsql;

-- select add_servicerecord(1, 1, 1, 2)
-- select add_servicerecord(2, 2, 2, 1)

-- Insert service record data
create or replace function add_serviceinvoice(
 	_service_invoice_id INTEGER,
 	_customer_id INTEGER,
 	_vehicle_id INTEGER,
 	_service_record_id INTEGER,
 	_total_estimated_cost NUMERIC,
 	_date_submitted DATE,
 	_date_completed DATE
)
returns void
as $MAIN$
begin
	insert into cd_service_invoices_tf(service_invoice_id, customer_id, vehicle_id, service_record_id, total_estimated_cost, date_submitted, date_completed)
	VALUES(_service_invoice_id, _customer_id, _vehicle_id, _service_record_id, _total_estimated_cost, _date_submitted, _date_completed); 
end;
$MAIN$
language plpgsql;

-- select add_serviceinvoice(1, 3, 2, 1, 24.99, '11/2/2023', '11/6/2023')
-- select add_serviceinvoice(2, 5, 1, 2, 999.99, '11/1/2023', '11/24/2023')
