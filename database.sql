-- step B1

-- creating tables with no foreign keys first otherwise there will be errors
-- make sure to use DESCRIBE to show tables work in SQLFiddle for screenshots

CREATE TABLE Coffee_Shop (
    shop_id INT,
    shop_name VARCHAR(50),
    city VARCHAR(50),
    state CHAR(2),
    PRIMARY KEY (shop_id)
);

CREATE TABLE Supplier (
    supplier_id INT,
    company_name VARCHAR(50),
    country VARCHAR(30),
    sales_contact_name VARCHAR(60),
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (supplier_id)
);

CREATE TABLE Employee (
    employee_id INT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hire_date DATE,
    job_title VARCHAR(30),
    shop_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (shop_id) REFERENCES Coffee_Shop (shop_id)
);

CREATE TABLE Coffee (
    coffee_id INT,
    shop_id INT,
    supplier_id INT,
    coffee_name VARCHAR(30),
    price_per_pound NUMERIC(5,2),
    PRIMARY KEY (coffee_id),
    FOREIGN KEY (shop_id) REFERENCES Coffee_Shop (shop_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier (supplier_id)
);


-- step B2


INSERT INTO Coffee_Shop(shop_id,shop_name,city,state)
VALUES
    (1,"Houndstooth Coffee","Austin","TX"),
    (2,"Laughing Man","New York City","NY"),
    (3,"The Wormhole Coffee","Chicago","IL");

INSERT INTO Supplier(supplier_id,company_name,country,sales_contact_name,email)
VALUES
    (4,"Big Bean LLC","Mexico","Juan","juan@bigbean.com"),
    (5,"Firewood Roasters","United States","Derek","derek@firewoodroasters.com"),
    (6,"Coffee Bean Exporters Brazil","Brazil","Marcelo","marcelo@exportcoffee.com");

INSERT INTO Employee(employee_id,first_name,last_name,hire_date,job_title,shop_id)
VALUES
    (7,"Bruce","Wayne",2008-11-11,"Night Roaster", 17),
    (8,"Tony","Stark",2010-07-15,"Iron Barista", 18),
    (9,"Peter","Parker",2014-04-18,"Spider Manager", 19);

INSERT INTO Coffee(coffee_id,shop_id,supplier_id,coffee_name,price_per_pound)
VALUES
    (10,20,30,"Big Bean Dark",13.49),
    (11,21,31,"Firewood Medium",11.99),
    (12,20,30,"Brazil Light",8.99);


-- step b3


CREATE VIEW full_name AS
    SELECT
        employee_id,
        first_name,
        last_name,
        hire_date,
        job_title,
        shop_id,
        CONCAT(first_name,' ',last_name) AS employee_full_name
    FROM
        Employee;


-- step b4


CREATE INDEX coffee_names on Coffee(coffee_name)

-- for the screenshot, refer to the documentation in templates guide for EXPLAIN command


-- step b5


SELECT
    first_name,
    last_name
FROM
    Employee
WHERE
    first_name = 'Peter' AND
    last_name = 'Parker';


-- step b6

SELECT 
    Coffee_Shop.shop_name,
    Coffee_Shop.city,
    Coffee_Shop.state,
    Employee.first_name,
    Employee.last_name,
    Employee.job_title,
    Coffee.coffee_name,
    Coffee.price_per_pound
FROM 
    Coffee_Shop
INNER JOIN 
    Employee ON Coffee_Shop.shop_id = Employee.shop_id
INNER JOIN 
    Coffee ON Coffee_Shop.shop_id = Coffee.shop_id;
