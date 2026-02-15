use swiggy;
select * from messy_indian_dataset;

-- 1. Function to Calculate Age
drop function if exists calculate_age;
delimiter //
create function calculate_age(birthdate date) returns int
deterministic
begin
     declare age int;
     set age = year(curdate()) - year(birthdate);
     return age;
       end//
             delimiter ;
     
select calculate_age("2005-03-29") as age;


-- 2. Function to Calculate Tax

drop function if exists calculate_tax;
delimiter //
create function calculate_tax(amount decimal(10,2), tax_rate decimal(10,2), period int) returns decimal
deterministic
begin
     declare tax int;
     set tax = (amount * (tax_rate/100)) * period;
     return tax;
       end//
             delimiter ;
     
select calculate_tax(2000000, 10, 10) as tax;


-- 3. Function to Categorize Age
drop function if exists age_category;
delimiter //
create function age_category(age int) returns varchar(50)
deterministic
begin
     declare categ varchar(50);
     if age < 18 then  set categ = "child";
     elseif age >= 18 and age < 65 then set categ = "senior";
     else set categ = "super_senior";
     end if;
     return categ ;
end//

delimiter ;
     
select age_category(21) as category;
select age_category(4) as category;
select age_category(80) as category;