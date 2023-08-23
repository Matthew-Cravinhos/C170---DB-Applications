-- creating tables with no foreign keys first otherwise there will be errors

CREATE TABLE COFFEE_SHOP (
    shop_id INT,
    shop_name VARCHAR(50),
    city VARCHAR(50),
    state CHAR(2),
    PRIMARY KEY (shop_id)
);

CREATE TABLE SUPPLIER (
    supplier_id INT,
    company_name VARCHAR(50),
    country VARCHAR(30),
    sales_contact_name VARCHAR(60),
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (supplier_id)
);

CREATE TABLE EMPLOYEE (
    employee_id INT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hire_date DATE,
    job_title VARCHAR(30),
    shop_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (shop_id) REFERENCES COFFEE_SHOP (shop_id)
);

CREATE TABLE COFFEE (
    coffee_id INT,
    shop_id INT,
    supplier_id INT,
    coffee_name VARCHAR(30),
    price_per_pound NUMERIC(5,2)
    PRIMARY KEY (coffee_id),
    FOREIGN KEY (shop_id) REFERENCES COFFEE_SHOP (shop_id),
    FOREIGN KEY (supplier_id) REFERENCES SUPPLIER (supplier_id)
);