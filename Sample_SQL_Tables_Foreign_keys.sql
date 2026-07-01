CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

-- Use the following command to check details on its respective table
SELECT *
  FROM employee

-- mispelled a column in the employee table
-- use the following command to drop and add the old/new column
ALTER TABLE employee DROP brand_id;
ALTER TABLE employee ADD branch_id;


CREATE TABLE branch (
  branch_ID INT PRIMARY KEY,
  branch_name VARCHAR (40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY (mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

SELECT *
  FROM branch

-- could not add the foreign key for the employee table untill the branch table was created
-- The following commands are to alter the employee table and add its foreign keys
ALTER TABLE employee
ADD FOREIGN KEY (brand_id)
REFERENCES branch (branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY (super_id)
REFERENCES employee (emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY key,
  client_name VARCHAR (40),
  branch_id INT,
  FOREIGN KEY (branch_id) REFERENCES branch (branch_id) ON DELETE SET NULL
  
);


CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY (emp_id, client_id),
  FOREIGN KEY (emp_id) REFERENCES employee (emp_id) ON DELETE CASCADE,
  FOREIGN KEY (client_id) REFERENCES client (client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT ,
  supplier_name VARCHAR (40),
 supplier_type VARCHAR (40),
  PRIMARY KEY (branch_id, supplier_name),
  FOREIGN KEY (branch_id) REFERENCES branch (branch_id) ON DELETE CASCADE
);

--Corporate Branch to employee table
INSERT INTO employee VALUES (100, 'David', 'Wallace', '1967-11-17','M','250,000',NULL, NULL);
INSERT INTO branch VALUES (1,'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100
-- could not add the branch_id for emp_id 100 since the branch
--value for that employee's foreign key was not in the system yet
  
INSERT INTO employee VALUES (101, 'Jan', 'Levinson', '1961-05-11','F','110,000',100, 1);

--Scranton Branch to employee table
INSERT INTO employee VALUES (102, 'Michael', 'Scott', '1964-03-15','M','75,000',100, 2);
INSERT INTO branch VALUES (2,'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id=2
WHERE emp_id=102;

INSERT INTO employee VALUES (103, 'Angela', 'Martin', '1971-06-25','F','63,000',102, 2);
INSERT INTO employee VALUES (104, 'Kelly', 'Kapoor', '1980_02_05','F','55,000',102, 2);
INSERT INTO employee VALUES (105, 'Stanley', 'Hudson', '1958-02-19','M','69,000',102, 2);

--Stampford Branch
INSERT INTO employee VALUES (106,'Josh','Portor', '1969_09_05','M','78,000', 100, 3);
INSERT INTO branch VALUES (3,'Stampford', 106, '1998-02-13');

INSERT INTO employee VALUES (107,'Andy','Bernard', '1973-07-22','M','65,000', 106, 3);
INSERT INTO employee VALUES (108,'Jim','HAlpert', '1978-10-01','M','71,000', 106, 3);

--Branch Supplier
INSERT INTO branch_supplier VALUES (2,'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES (2,'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES (3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES (2, 'J.T Forms & Lables', 'Custom Forms');
INSERT INTO branch_supplier VALUES (3, 'Uni-ball', 'Writing Untensils');
INSERT INTO branch_supplier VALUES (3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES (3, 'Stamford Lables', 'Custom Forms');

-- Client
INSERT INTO client VALUES (400,'Dunmore Highschool',2);
INSERT INTO client VALUES (401,'Lackawana County',2);
INSERT INTO client VALUES (402, 'FedEx',3);
INSERT INTO client VALUES (403, 'John Daly Law, LLC',3);
INSERT INTO client VALUES (404, 'Scanton WhitePages',2);
INSERT INTO client VALUES (405, 'Times Newspaper',3);
INSERT INTO client VALUES (406, 'FedEx', 2);

--Works_with
INSERT INTO works_with VALUES (105, 400,'55,000');
INSERT INTO works_with VALUES (102,401,'267,000');
INSERT INTO works_with VALUES (108,402,'22,500');
INSERT INTO works_with VALUES (107,403, '5,000');
INSERT INTO works_with VALUES (108, 403, '12,000');
INSERT INTO works_with VALUES (105, 404, '33,000');
INSERT INTO works_with VALUES (107, 405, '26,000');
INSERT INTO works_with VALUES (102, 406, '15,000');
INSERT INTO works_with VALUES (105, 406, '130,000');