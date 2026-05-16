use cf_project;
create database CF_Project;
use cf_project;

CREATE TABLE project (
  id bigint DEFAULT NULL,
  state Varchar(30),
  name Varchar(500),
  country Varchar(30),
  creator_id bigint DEFAULT NULL,
  location_id bigint DEFAULT NULL,
  category_id bigint default NULL,
  created_at bigint DEFAULT NULL,
  deadline bigint DEFAULT NULL,
  updated_at bigint DEFAULT NULL,
  state_changed_at bigint DEFAULT NULL,
  successful_at bigint DEFAULT NULL,
  launched_at bigint DEFAULT NULL,
  goal bigint DEFAULT NULL,
  pledged Varchar(30) DEFAULT NULL,
  currency Varchar(30),
  currency_symbol Varchar(30),
  usd_pledged Varchar(30) DEFAULT NULL,
  static_usd_rate float DEFAULT NULL,
  backers_count int DEFAULT NULL,
  spotlight Varchar(30),
  staff_pick Varchar(300),
  blurb Varchar(500),
  currency_trailing_code Varchar(300),
  disable_communication Varchar(30)
) ;

SHOW VARIABLES LIKE 'secure_file_priv';

select * from project;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = on;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/uploads/pro.csv'
INTO TABLE Project
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select count(*) as total_project from project;
---------------------------------------------------------------------------------------------------------------------------------------------
create table category (ID varchar(100), name varchar(500), Parent_ID Varchar(100), Position varchar(100));

Select * from category;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CAT.csv'
INTO TABLE category
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select count(id) from category;
-----------------------------------------------------------------------------------------------------------------------------------
create table creator (id varchar(100), name	varchar(500), chosen_currency varchar(100));

Select * from creator;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cre.csv'
INTO TABLE creator
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
select count(ID)  from creator;
------------------------------------------------------------------------------------------------------------------------------------------------
create table Location (id varchar(100),	displayable_name varchar(500),	type varchar(50),	name varchar(500),
state varchar(100), short_name varchar(100),	is_root varchar(100),	country varchar(100),	localized_name varchar(500));

Select * from location;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Loc.csv'
INTO TABLE Location
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

Select count(id) from location;
----------------------------

use cf_project;
-- convert  date time epoch 
---------------------------------------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE project
ADD COLUMN created_date datetime ;
 UPDATE project
SET created_date = FROM_UNIXTIME(created_at);

ALTER TABLE project
ADD COLUMN deadline_date datetime ;
 UPDATE project
SET deadline_date = FROM_UNIXTIME(deadline);

ALTER TABLE project
ADD COLUMN update_date datetime ;
 UPDATE project
SET update_date = FROM_UNIXTIME(updated_at);

ALTER TABLE project
ADD COLUMN state_changed_date datetime ;
 UPDATE project
SET state_changed_date = FROM_UNIXTIME(state_changed_at);

ALTER TABLE project
ADD COLUMN successful_date datetime;
 UPDATE project
SET successful_date = FROM_UNIXTIME(successful_at);

ALTER TABLE project
ADD COLUMN launched_date datetime;
 UPDATE project
SET launched_date = FROM_UNIXTIME(launched_at);

select * from project;
----------------------------------------------------------------------
-- create calender table --

SELECT MIN(DATE(created_date)) AS min_date,
       MAX(DATE(created_date)) AS max_date
FROM project;

CREATE TABLE calendar_table (
    date_key DATE,
    Year SMALLINT,
    Monthno TINYINT,
    Monthfullname VARCHAR(10),
    Quarter CHAR(2),
    YearMonth CHAR(10),
    Weekdayno TINYINT,
    Weekdayname VARCHAR(10),
    FinancialMonth TINYINT,
    FinancialQuarter CHAR(4)
);

INSERT INTO calendar_table (
    date_key, Year, Monthno, Monthfullname, Quarter, YearMonth, Weekdayno, Weekdayname, FinancialMonth, FinancialQuarter)
    select
    date(created_date) as date_key,
    year(created_date) as year,
    MONTH(created_date) AS Monthno,
    MONTHNAME(created_date) AS Monthfullname,
    CONCAT('Q', QUARTER(created_date)) AS Quarter,
    DATE_FORMAT(created_date, '%Y-%b') AS YearMonth,
    DAYOFWEEK(created_date) AS Weekdayno,
    DAYNAME(created_date) AS Weekdayname,
    CASE WHEN MONTH(created_date) >= 4 THEN MONTH(created_date) - 3 ELSE MONTH(created_date) + 9 END AS FinancialMonth,
    CONCAT('FQ-', QUARTER(date_sub(created_date, INTERVAL 3 MONTH))) AS FinancialQuarter
FROM
    project
order by
date_key;

select * from calendar_table;

-------------------------------------------------------
set sql_safe_updates=0;
alter table project
add column goal_usd decimal(10, 0);
update project as p
set p.goal_usd = p.goal * 1;
select id, goal, static_usd_rate, goal_usd
from project
limit 20;

-------------------------------------------------------------------------
-- Total no.of Projects based on Outcome --
select state,
count(id) as total_projects
from project
group by state
order by total_projects
desc;

select * from project;
--------------------------------------------------------------------
-- Total no. of projects based on country --

select l.country , count(p.name) as total_no_of_projects from project 
as p join location as l on p.location_id = l.id
 group by country order by count(p.name) desc;
 ---------------------------------------------------------------------
 -- Total no.of projects based on category --
 
 select C.name category , count(p.name) as total_no_of_projects from project
as p join category as C on p.category_id = C.id
 group by C.name order by count(p.name) desc;
 
 
 ----------------------------------------------------------------
 -- Top successful projects based on no.of backers --
 
 select name, sum(backers_count) as backer_name, state 
 from project
 where state = "successful" 
 group by name order by sum(backers_count) desc ;
 ---------------------------------------------------------
 -- Top successful projects based on amount raised --
 
 select name, sum(goal_usd) as total_successful_project 
 from project
 where state = "successful" 
 group by name order by sum(goal_usd) desc limit 10 ;
 ------------------------------------------------------------------------
 -- Percentage of Successful Projects by Goal Range --

SELECT 
    CASE 
        WHEN (goal * static_usd_rate) < 5000 THEN 'less than 5000'
        WHEN (goal * static_usd_rate) BETWEEN 5000 AND 20000 THEN '5000 to 20000'
        WHEN (goal * static_usd_rate) BETWEEN 20000 AND 50000 THEN '20000 to 50000'
        WHEN (goal * static_usd_rate) BETWEEN 50000 AND 100000 THEN '50000 to 100000'
        ELSE 'greater than 100000'
    END AS goal_range,
    COUNT(ID) AS total_projects,
    COUNT(CASE WHEN state = 'successful' THEN 1 END) AS successful_projects,
    concat(round(COUNT(CASE WHEN state = 'successful' THEN 1 END) * 100.0 / COUNT(ID),2),"%") 
    AS success_percentage
FROM 
    project
GROUP BY 
    goal_range
ORDER BY 
    success_percentage DESC;
    -----------------------------------------------------------
    -- total backers by successful projects --
    select sum(backers_count) as total_backers_successful_projects 
    from project where 
    state = "successful";
    
    -----------------------------------------------------------
    --  total amount raised by successful projects --
    select sum(goal_usd)  Total_Amount from project where state = "successful";
    ------------------------------------------------------------
    -- Average no. of days for Successful projects --
  SELECT
    concat(round(AVG(DATEDIFF(deadline_date, created_date)),2),"%") AS avg_duration_days
FROM project
WHERE state = 'successful';
    ----------------------------------------------------------
    -- Percentage of Successful Projects by Category --
   select  C.name, concat(round(count(case when  state = "successful" then 1 end ) * 100.0 /
   count(*),2),"%") as "%_successful" from 
   project as p join 
   category as C on p.category_id = C.id 
   group by C.name order by concat(round(count(case when  state = "successful" then 1 end ) * 100.0 /
   count(*),2),"%") desc;

SELECT * from project;

SHOW CREATE TABLE project;
