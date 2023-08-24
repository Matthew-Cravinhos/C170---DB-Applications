-- step B1

-- creating tables with no foreign keys first otherwise there will be errors
-- make sure to use DESCRIBE to show tables work in SQLFiddle for screenshots

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


-- step B2


-- using multi-line value inserts, not sure if UPDATE is needed in some form

INSERT INTO COFFEE_SHOP(shop_id,shop_name,city,state)
VALUES
    (1,"Houndstooth Coffee","Austin","TX"),
    (2,"Laughing Man","New York City","NY"),
    (3,"The Wormhole Coffee","Chicago","IL");

INSERT INTO SUPPLIER(supplier_id,company_name,country,sales_contact_name,email)
VALUES
    (4,"Big Bean LLC","Mexico","Juan","juan@bigbean.com"),
    (5,"Firewood Roasters","United States","Derek","derek@firewoodroasters.com"),
    (6,"Coffee Bean Exporters Brazil","Brazil","Marcelo","marcelo@exportcoffee.com");

INSERT INTO EMPLOYEE(employee_id,first_name,last_name,hire_date,job_title,shop_id)
VALUES
    (7,"Bruce","Wayne",2008-11-11,"Night Roaster", 17),
    (8,"Tony","Stark",2010-07-15,"Iron Barista", 18),
    (9,"Peter","Parker",2014-04-18,"Spider Manager", 19);

INSERT INTO COFFEE(coffee_id,shop_id,supplier_id,coffee_name,price_per_pound)
VALUES
    (10,20,30,"Big Bean Dark",13.49),
    (11,21,31,"Firewood Medium",11.99),
    (12,20,30,"Brazil Light",8.99);


-- step b3


-- create view