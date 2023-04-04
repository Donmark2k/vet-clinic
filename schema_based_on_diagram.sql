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

-- Create the joined table
CREATE TABLE joined (   medical_history_id INTEGER REFERENCES medical_histories(id),
    treatment_id INTEGER REFERENCES treatments(id),    PRIMARY KEY (treatment_id, medical_history_id) );

    CREATE INDEX index_patient_id ON medical_histoeries (patient_id);
CREATE INDEX index_treatment_id ON invoice_items (treatment_id);
CREATE INDEX index_invoice_id ON invoice_items (invoice_id);
CREATE INDEX index_medical_history_id ON invoices (medical_history__id);
CREATE INDEX index_medical_histories_id ON joined (medical_history_id);
CREATE INDEX index_treatments_id ON joined (treatments_id);