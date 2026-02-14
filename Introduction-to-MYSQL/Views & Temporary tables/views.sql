-- 1. Create the view
drop view if exists rest;
create view rest as 
(select name, rating, rating_count, cost, cost* rating_count as "revenue" from restaurants);
select * from rest;

-- 2. Create a view of sweet dishes

drop view if exists sweets;
create view sweets as 
(select name, rating, rating_count, cost, cost* rating_count as "revenue" , cuisine from restaurants
where cuisine = "sweets");
select * from sweets;

-- 3. Create a view of top 100 restaurants

drop view if exists top_100;
create view top_100 as 
(select name, rating, rating_count, cost, cost* rating_count as "revenue" , cuisine from restaurants
order by revenue desc limit 100);
select * from top_100;

-- 4. Create a view of restaurant atleast 100 people visited

drop view if exists visit;
create view visit as 
(select name, rating, rating_count, cost, cost* rating_count as "revenue" , cuisine from restaurants
where rating_count >= 100);
select * from visit;

-- 5. Create a view of top 1000 most expensive restaurants

drop view if exists exp;
create view exp as 
(select name, rating, rating_count, cost, cost* rating_count as "revenue" , cuisine from restaurants
order by cost desc limit 1000);
select * from exp;

-- 6. Create a view for top-rated restaurants in each city

drop view if exists top_rated;
create view top_rated as 
(select * from (select name, city, rating*rating_count, row_number() over(partition by city order by rating * rating_count desc ) as "rated" from restaurants) t
where t.rated = 1) ;
select * from top_rated;






