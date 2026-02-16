select * from messy_indian_dataset;

-- Finding only unique rows

select distinct* from messy_indian_dataset;

-- Finding unique values based on ID

select distinct id from messy_indian_dataset;

-- Finding unique values based on name

select distinct name from messy_indian_dataset;

-- Finding unique values based on id using rank
select * from (
select id, name, city, state, phone_number, row_number() over(partition by id order by id) as "ranking" from messy_indian_dataset) t
where t.ranking < 2  ;


-- Finding unique values based on multiple columns | Rajesh Patel & Patil

select * from (
select id, name, city, state, phone_number, row_number() over(partition by id, name order by id) as "ranking" from messy_indian_dataset) t
where t.ranking < 2  ;