drop database test_db;

create database test_db;

use database test_db;

create schema test_schema;

use schema test_schema;

create table test_table(product_id int,product_name varchar,product_category varchar);

insert into test_table values(100,'toys','entertainment'),(101,'icecream','food'),(102,'shirt','fashion');

select * from test_table;

create dynamic table test_dynamic_table 
target_lag='2 minutes'
warehouse=compute_wh
as 
    select * from test_table;

select * from test_dynamic_table;

insert into test_table values(103,'ring','fashion'),(104,'water','food');

select * from test_dynamic_table;

update test_table set product_name='dhokla' where product_name='water';

select * from test_dynamic_table;

alter dynamic table test_dynamic_table suspend;
