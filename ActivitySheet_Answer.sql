1#Create table resource 
CREATE TABLE resource(ID INT,NAME VARCHAR(500),Date_Of_Joining DATE,Years_Of_Exp INT,Yash_EmpID VARCHAR(500));

2#Insert data into it
INSERT INTO resource VALUES(1,'Amol Nilkanth Bagal','2014-01-20',1,1002899);
INSERT INTO resource VALUES(2,'Manohar Singh','2012-09-10',10,1001553);
INSERT INTO resource VALUES(3,'Nitish Aggarwal','2008-03-28',2,1000193);
INSERT INTO resource VALUES(4,'Sonali Uttam Mane','2015-03-09',3,1003719);
INSERT INTO resource VALUES(5,'Ruchi Soni','2015-03-26',4,1003813);
INSERT INTO resource VALUES(6,'Kartik Dharmendra Jalgaonkar','2014-12-01',8,1003549);
INSERT INTO resource VALUES(7,'Charu Dubey','2014-03-13',6,1003054);
INSERT INTO resource VALUES(8,'Nikhil Bhagwantrao Raut','2014-05-19',7,1003177);
INSERT INTO resource VALUES(9,'Vishal Khandu Kumkar','2012-05-25',5,1001285);
INSERT INTO resource VALUES(10,'Isha Tiwari','2015-04-27',2,1003927);
INSERT INTO resource VALUES(11,'Dharmendra Biswal','2015-04-30',5,1003999);


3#Update Years of exp Kartik  to 8 from 10		
UPDATE resource SET Years_Of_Exp=10 WHERE Yash_EmpID=1003549;

4#Delete record of Vishal	
DELETE FROM resource WHERE Yash_EmpID=1001285;

5#Alter  table to add location column 	
ALTER TABLE resource ADD location VARCHAR(20);

6#Make id as primary key		
ALTER TABLE resource ADD PRIMARY KEY(ID);

7#Alter  table to drop column years_of_exp 			
ALTER TABLE resource DROP COLUMN Years_Of_Exp;

8#Alter table to change the datatype of primary key column to Bigint				
ALTER TABLE resource MODIFY COLUMN ID BIGINT;

9#Write a select statement to view all the from the table created			
SELECT * FROM resource;

10#Write a select statement to view data in the increasing and decreasing order of date_of_joining
SELECT * FROM resource ORDER BY Date_Of_Joining DESC;
SELECT * FROM resource ORDER BY Date_Of_Joining ASC;

