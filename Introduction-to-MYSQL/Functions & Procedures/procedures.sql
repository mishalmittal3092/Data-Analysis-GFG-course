use swiggy;
select * from messy_indian_dataset;

-- 1. Creating my first procedure

drop procedure if exists proc;
delimiter //
create procedure proc(in userid int)
begin
select * from messy_indian_dataset where id = userid;
end //
delimiter ;
call proc(1);


-- 2. Procedure to Update Purchase Amount by Percentage

drop procedure if exists amount_update
delimiter //
create procedure amount_update (rate decimal(10,2))
begin
update messy_indian_dataset 
set purchase_amount = (purchase_Amount + (purchase_amount * (rate/100)));
end //
delimiter ; 

call amount_update(10);
select * from messy_indian_dataset;


-- 3. Deleting Low-Rated Restaurants and Logging
drop table if exists log_data;
create table log_data 
(id int, name char(50), rating decimal(10,2));



select * from messy_indian_dataset;
select * from log_data;

drop procedure if exists logging_data;
delimiter //
create procedure logging_data (min_rating decimal(10,2))
begin
insert into swiggy.log_data (id ,name ,rating)
((select id,name,rating from messy_indian_dataset 
where rating < min_rating));

delete from messy_indian_dataset
where rating < min_rating;
end //
delimiter ;


call logging_data (3);
select * from log_data;
select * from messy_indian_dataset;












