CREATE TABLE salespeople(SNUM INT(5) PRIMARY KEY,SNAME VARCHAR(10),CITY VARCHAR(20),COMM INT(3));

INSERT INTO salespeople VALUES(1001,"PEEL","LONDON",12);
INSERT INTO salespeople VALUES(1002,"SERRES","SANJOSE",14);
INSERT INTO salespeople VALUES(1003,"AXCELROD","NEW YORK",10);
INSERT INTO salespeople VALUES(1004,"MOTIKA","LONDON",11);
INSERT INTO salespeople VALUES(1005,"FRAN","LONDON",26);
INSERT INTO salespeople VALUES(1007,"RIKKLIN","BARCELONA",21);

COMMIT;

CREATE TABLE customer(CNUM INT(5) PRIMARY KEY,CNAME VARCHAR(10),CITY VARCHAR(20),SNUM INT(5),RATING INT(3),FOREIGN KEY(SNUM) REFERENCES salespeople(SNUM));

INSERT INTO customer VALUES(2001,"KELVIN","SANJOSE",1007,200);
INSERT INTO customer VALUES(2002,"GIOVANNI","ROME",1003,200);
INSERT INTO customer VALUES(2003,"LIU","SANJOSE",1002,200);
INSERT INTO customer VALUES(2004,"GRASS","BARLIN",1002,300);
INSERT INTO customer VALUES(2006,"CLEMENS","LONDON",1001,100);
INSERT INTO customer VALUES(2007,"PEREIRA","ROME",1004,100);
INSERT INTO customer VALUES(2008,"CISNEROS","SANJOSE",1007,300);

COMMIT;


CREATE TABLE orders(ONUM INT(5),AMT DECIMAL(8,2),SNUM INT(5),CNUM INT(5),ODATE DATE,FOREIGN KEY(SNUM) REFERENCES salespeople(SNUM),FOREIGN KEY(CNUM) REFERENCES customer(CNUM));

INSERT INTO orders VALUES(3001,18.69,1007,2008,'1996-03-10');
INSERT INTO orders VALUES(3003,890,1001,2001,'1996-03-10');
INSERT INTO orders VALUES(3002,1900.1,1004,2007,'1996-03-10');
INSERT INTO orders VALUES(3005,5160.45,1002,2003,'1996-03-10');
INSERT INTO orders VALUES(3006,1098.16,1007,2008,'1996-03-10');
INSERT INTO orders VALUES(3009,1713.23,1003,2002,'1996-04-10');
INSERT INTO orders VALUES(3007,75.75,1003,2002,'1996-04-10');
INSERT INTO orders VALUES(3008,4723,1001,2006,'1996-05-10');
INSERT INTO orders VALUES(3010,1309.95,1002,2004,'1996-06-10');
INSERT INTO orders VALUES(3011,9891.8,1001,2006,'1996-06-10');

COMMIT;


3#Create table resource
CREATE TABLE resource1(resourcehrs_ID INT PRIMARY KEY,resourceid BIGINT(20),hours INT,week_endDate DATE,FOREIGN KEY(resourceid) REFERENCES resource(id));
INSERT INTO resource1 VALUES(1,1,8,'2014-12-26');
INSERT INTO resource1 VALUES(2,2,9,'2014-12-26');
INSERT INTO resource1 VALUES(3,3,2,'2014-12-26');
INSERT INTO resource1 VALUES(4,4,3,'2014-12-26');
INSERT INTO resource1 VALUES(5,5,5,'2015-06-26');
INSERT INTO resource1 VALUES(6,2,8,'2015-06-26');
INSERT INTO resource1 VALUES(7,1,7,'2015-06-26');

4#Create table project
CREATE TABLE project(projectid INT,projectname VARCHAR(500),location_id INT,CONSTRAINT PK_Projectid PRIMARY KEY(projectid),CONSTRAINT FK_Locationid FOREIGN KEY(location_id) REFERENCES location(location_id));
INSERT INTO project VALUES(1,'project1',1);
INSERT INTO project VALUES(2,'project2',1);
INSERT INTO project VALUES(3,'project3',3);
INSERT INTO project VALUES(4,'project4',4);



1#Modify table resource as per data below:
ALTER TABLE resource ADD Years_Of_Exp INT;				
ALTER TABLE resource DROP COLUMN location;
ALTER TABLE resource ADD location_id INT;
ALTER TABLE resource ADD FOREIGN KEY(location_id) REFERENCES location(location_id);

UPDATE resource SET Years_Of_Exp=1,location_id=1 WHERE Yash_EmpID=1002899;
UPDATE resource SET Years_Of_Exp=8,location_id=2 WHERE Yash_EmpID=1000193;
UPDATE resource SET Years_Of_Exp=8,location_id=1 WHERE Yash_EmpID=1001553;
UPDATE resource SET Years_Of_Exp=3,location_id=1 WHERE Yash_EmpID=1003813;
UPDATE resource SET Years_Of_Exp=4,location_id=2 WHERE Yash_EmpID=1003549;
UPDATE resource SET Years_Of_Exp=8,location_id=1 WHERE Yash_EmpID=1003054;
UPDATE resource SET Years_Of_Exp=6,location_id=2 WHERE Yash_EmpID=1003177;
UPDATE resource SET Years_Of_Exp=6,location_id=2 WHERE Yash_EmpID=1003177;
INSERT INTO resource VALUES(9,'Vishal Khandu Kumkar','2012-05-25',1001285,7,1);
UPDATE resource SET Years_Of_Exp=2,location_id=3 WHERE Yash_EmpID=1003927;
UPDATE resource SET Years_Of_Exp=5,location_id=2 WHERE Yash_EmpID=1003999;

2#Create table location
CREATE TABLE location (location_id INT PRIMARY KEY,location_name VARCHAR(200));
INSERT INTO location VALUES(1,'Indore');
INSERT INTO location VALUES(2,'Pune');
INSERT INTO location VALUES(3,'Banglore');
INSERT INTO location VALUES(4,'Mumbai');


3#Create table resource
CREATE TABLE resource1(resourcehrs_ID INT PRIMARY KEY,resourceid BIGINT(20),hours INT,week_endDate DATE,FOREIGN KEY(resourceid) REFERENCES resource(id));
INSERT INTO resource1 VALUES(1,1,8,'2014-12-26');
INSERT INTO resource1 VALUES(2,2,9,'2014-12-26');
INSERT INTO resource1 VALUES(3,3,2,'2014-12-26');
INSERT INTO resource1 VALUES(4,4,3,'2014-12-26');
INSERT INTO resource1 VALUES(5,5,5,'2015-06-26');
INSERT INTO resource1 VALUES(6,2,8,'2015-06-26');
INSERT INTO resource1 VALUES(7,1,7,'2015-06-26');


4#Create table project
CREATE TABLE project(projectid INT,projectname VARCHAR(500),location_id INT,CONSTRAINT PK_Projectid PRIMARY KEY(projectid),CONSTRAINT FK_Locationid FOREIGN KEY(location_id) REFERENCES location(location_id));
INSERT INTO project VALUES(1,'project1',1);
INSERT INTO project VALUES(2,'project2',1);
INSERT INTO project VALUES(3,'project3',3);
INSERT INTO project VALUES(4,'project4',4);

1#List out resource name ,date_of_joining,location  od resource whose years_of_exp is more than 2 years						
SELECT NAME,Date_Of_Joining,location_id FROM resource WHERE years_Of_Exp>2;

2#Find the employee which maximum experience						
SELECT * FROM resource WHERE Years_Of_Exp = (SELECT MAX(Years_Of_Exp) FROM resource);

3#Find the resource with Indore location 					
SELECT resource.name FROM resource INNER JOIN location ON resource.location_id=location.location_id AND location.location_name='Indore';


4#Find the resource name,hours ,location ,week_end_date						
SELECT r.name,r1.hours,r1.week_endDate,l.location_name
FROM resource r
LEFT OUTER JOIN
resource1 r1 ON r.ID=r1.resourceid
LEFT OUTER JOIN
location l
 ON r.ID=l.location_id GROUP BY (r.name);
 
5#Delete record from location table with location name as Mumbai						
DELETE FROM location WHERE location_name='Mumbai';

6#Make listing of all the records from all the tables using inner join 						
SELECT resource.name,location.location_name,project.projectname FROM resource INNER JOIN location ON resource.location_id=location.location_id INNER JOIN resource1 ON resource1.resourceid=resource.ID INNER JOIN project ON project.location_id=resource.location_id; 

7#Drop primary key  and foreign key constraint from project table (Drop constraint not the columns)						
ALTER TABLE project DROP PRIMARY KEY; 
ALTER TABLE project DROP FOREIGN KEY FK_Locationid;

