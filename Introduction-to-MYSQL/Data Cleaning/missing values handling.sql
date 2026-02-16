select * from messy_indian_dataset;


-- Find rows with missing values in any column

select * from messy_indian_dataset 
where name is null or age is null or gender is null or email is null or phone_number is null or city is null or state is null or purchase_amount is null or purchase_date is null;

-- Find rows without missing values

select * from messy_indian_dataset 
where name is not null and age is not null and gender is not null and email is not null and phone_number is not null and city is not null and
 state is not null and purchase_amount is not null and purchase_date is not null;

-- Saving table without null values
create table clean_data as (
select * from messy_indian_dataset 
where name is not null and age is not null and gender is not null and email is not null and phone_number is not null and city is not null and
 state is not null and purchase_amount is not null and purchase_date is not null);
 select * from clean_data;

-- Filling missing age all with specific values

select * from messy_indian_dataset;
update messy_indian_dataset 
set age = coalesce(age, 0);
select * from messy_indian_dataset;

-- Filling null amount with average amount values

select * from messy_indian_dataset;
update messy_indian_dataset
set purchase_amount = (select avg_amount from (select avg(purchase_amount) as "avg_Amount"  from messy_indian_dataset) as subquery)
where purchase_amount is null;
select * from messy_indian_dataset;

-- Filling null city with most frequent city


select * from messy_indian_dataset;
update messy_indian_dataset
set city = (select frequent_city  from (select city as "frequent_city", count(city) from messy_indian_dataset
                                          where city is not null
                                          group by city 
                                          order by count(city) desc limit 1) as subquery)
where city is null;
select * from messy_indian_dataset;




