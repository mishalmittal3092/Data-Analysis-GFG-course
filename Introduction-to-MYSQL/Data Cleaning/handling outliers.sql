select * from messy_indian_dataset;

-- Finding outliers based on Z-Score

select *, abs(purchase_amount - avg(purchase_amount) over()) / stddev(purchase_amount) over() as "z_score"  from messy_indian_dataset;

-- Remove outliers based on specific Z-Score
select  * from (select *, abs(purchase_amount - avg(purchase_amount) over()) / stddev(purchase_amount) over() as "z_score"  from messy_indian_dataset) t

where t.z_score < 2
