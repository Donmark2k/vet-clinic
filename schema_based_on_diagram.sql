-- Create the patient table
CREATE TABLE patients ( id INT GENERATED ALWAYS AS IDENTITY  NOT NULL PRIMARY KEY,
name VARCHAR(100) NOT NULL, date_of_birth date );

-- Create the medical_histories table

CREATE TABLE medical_histories ( id INT GENERATED ALWAYS as IDENTITY PRIMARY KEY,
admitted_at timestamp NOT NULL, patient_id INT REFERENCES patients(id), status varchar(30));

-- Create the invoices table
CREATE TABLE invoices ( id int generated always as identity primary key, total_amount decimal not null,
generated_at timestamp not null, medical_history_id int references medical_histories (id));

-- Create the treatments table
CREATE TABLE treatments (
id int generated always as identity primary key,
	type varchar(30) not null,
name varchar(100) not null
)