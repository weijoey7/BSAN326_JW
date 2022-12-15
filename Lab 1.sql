-- Drop this table if it exists 
DROP TABLE SUPPLIERS; 
 
-- Create table SUPPLIERS 
CREATE TABLE SUPPLIERS ( 
    SID      CHAR(4)       , 
    Sname    VARCHAR2(50), 
    Status   NUMBER(2), 
    Scity    VARCHAR2(20), 
    CONSTRAINT SUPPLIERS_PK PRIMARY KEY (SID) ); 
  
-- Drop this table if it exists     
DROP TABLE PARTS; 
-- Create table PARTS 
CREATE TABLE PARTS ( 
    PID      CHAR(4)       , 
    Pname    VARCHAR2(50), 
    Color    VARCHAR2(20), 
    Weight   NUMERIC, 
    Pcity    VARCHAR2(20), 
    CONSTRAINT PARTS_PK PRIMARY KEY (PID) ); 
 
-- Drop this table if it exists      
DROP TABLE SHIPMENTS;   
-- Create table SHIPMENTS 
CREATE TABLE SHIPMENTS ( 
    SPID     CHAR(6)  , 
    SID      CHAR(4)     , 
    PID     CHAR(4)     , 
    Quantity INTEGER, 
    CONSTRAINT SHIPMENTS_PK PRIMARY KEY (SPID, PID, SID), 
    CONSTRAINT SHIPMENTS_PID_FK FOREIGN KEY (PID) 
  REFERENCES PARTS,     
    CONSTRAINT SHIPMENTS_SID_FK FOREIGN KEY (SID)  
        REFERENCES SUPPLIERS (SID)  ); 
 
-- Check the structure these tables - Number of variables and their datatypes 
DESCRIBE SUPPLIERS; 
DESCRIBE PARTS; 
DESCRIBE SHIPMENTS; 
 
-- Check the values in each of these tables 
Select * from SUPPLIERS; 
Select * from PARTS; 
Select * from SHIPMENTS; 
 
-- At this stage, you can import the data using the batch import function, or input values individually 
using the INSERT command 
  
-- Alter table. Add a Saddress column 
ALTER TABLE SUPPLIERS  
ADD (Saddress VARCHAR2(300) 
); 
 
-- Change SID from char(4) to varchar2(4). This command should throw us an error as SID of 
SUPPLIERS table is referenced by SHIPMENTS table 
-- FK referential integrity will prevent us from changing the variable in the parent table, which is 
SUPPLIERS  
ALTER TABLE SUPPLIERS  
MODIFY (SID VARCHAR2(4) 
); 
 
-- We add NOT NULL constraint to Sname variable 
ALTER TABLE SUPPLIERS  
MODIFY (Sname VARCHAR2(50) NOT NULL 
); 
 
-- Insert values, row by row 
INSERT INTO SUPPLIERS VALUES ('S7','Brandon',30,'Lawrence','100 Clinton Pkwy Apt 200'); 
INSERT INTO SUPPLIERS VALUES ('S8','Michael',40,'Lawrence','100 Wakarusa St Apt 400'); 
 
-- Update values of scity in row with SID = 'S7'. 
UPDATE SUPPLIERS  SET scity='Chicago' where sid='S7'; 
 
-- Update values of saddress in row with SID = 'S5' to '1000 Fremont Ave 220'. 
UPDATE SUPPLIERS  SET saddress='1000 Fremont Ave 220' where sid='S5'; 
 
-- Command to DROP table SHIPMENTS 
DROP TABLE SHIPMENTS; 
 
-- We will get an error as SHIPMENTS Table has been dropped  
Select * from SHIPMENTS; 
 
-- To get back table SHIPMENTS that was dropped. Note that rollback will not work here. 
FLASHBACK TABLE SHIPMENTS to before drop; 
 
-- SHIPMENTS is again present in database 
 
Select * from SHIPMENTS; 
 
-- Save your work using commit;  
-- You can undo your work using rollback (except DDL commands) commit;