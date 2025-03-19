select sales_person, sum(amount) from sales_data
group by sales_person
order by sum(amount) desc;

select country, round(SUM(rank * count) / SUM(count),2) AS avg_rank
from(select country, rank, count(*) count
from(select product, country, round(sum(amount)/sum(boxes_shipped),2) priceperbox,
dense_rank() OVER (partition by product order by sum(amount)/sum(boxes_shipped) desc) rank
from sales_data
group by product, country
order by 1,3 desc)
group by country, rank
order by rank, count(*) desc)
group by country
order by SUM(rank * count) / SUM(count);

select country, sum(amount) from sales_data
group by country
order by sum(amount) desc;

select country, round(sum(amount)/sum(boxes_shipped),2)
from sales_data
group by country
order by sum(amount)/sum(boxes_shipped) desc;

select * from(select product, country, sum(amount) amountsold, round(sum(amount)/sum(boxes_shipped),2) priceperbox,
dense_rank() OVER (partition by product order by sum(amount)/sum(boxes_shipped) desc) pricerank,
dense_rank() OVER (partition by product order by sum(amount) desc) amountsoldrank
from sales_data
group by product, country
order by 1,4 desc)
where country = 'Canada';

select * from(select product, country, sum(amount) amountsold, round(sum(amount)/sum(boxes_shipped),2) priceperbox,
dense_rank() OVER (partition by product order by sum(amount)/sum(boxes_shipped) desc) pricerank,
dense_rank() OVER (partition by product order by sum(amount) desc) amountsoldrank
from sales_data
group by product, country
order by 1,4 desc)
where country = 'Canada'
and amountsoldrank > 4;

select * from(select product, country, sum(amount) amountsold, round(sum(amount)/sum(boxes_shipped),2) priceperbox,
dense_rank() OVER (partition by product order by sum(amount)/sum(boxes_shipped) desc) pricerank,
dense_rank() OVER (partition by product order by sum(amount) desc) amountsoldrank
from sales_data
group by product, country
order by 1,4 desc)
where country = 'Canada'
and amountsoldrank > 4
and pricerank < 3;

select product, round(avg(priceperbox),2) from(select product, country, sum(amount) amountsold, round(sum(amount)/sum(boxes_shipped),2) priceperbox,
dense_rank() OVER (partition by product order by sum(amount)/sum(boxes_shipped) desc) pricerank,
dense_rank() OVER (partition by product order by sum(amount) desc) amountsoldrank
from sales_data
group by product, country
order by 1,6)
where product in ('50% Dark Bites',
'85% Dark Bars',
'Almond Choco',
'White Choc')
and amountsoldrank < 4
group by product;

select * from(select s.product, country, sum(amount) amountsold, round(sum(amount)/sum(boxes_shipped),2) priceperbox,
dense_rank() OVER (partition by s.product order by sum(amount)/sum(boxes_shipped) desc) pricerank,
dense_rank() OVER (partition by s.product order by sum(amount) desc) amountsoldrank
from sales_data s
group by product, country
order by 1,4 desc)
where country = 'Canada'
and amountsoldrank > 4
and pricerank > 4;

select product_name,
round(calories/nullif(serving_size_g,0)*100,2) caloriesper100g,
round(sugars_g/nullif(serving_size_g,0)*100,2) sugarper100g,
priceperbox,
pricerank,
amountsoldrank,
amountsold
from chocolate_nutrition n
join (select * from(select product, country, sum(amount) amountsold, round(sum(amount)/sum(boxes_shipped),2) priceperbox,
dense_rank() OVER (partition by product order by sum(amount)/sum(boxes_shipped) desc) pricerank,
dense_rank() OVER (partition by product order by sum(amount) desc) amountsoldrank
from sales_data
group by product, country
order by 1,4 desc)
where country = 'Canada') s
on n.product_name = s.product
order by 2 desc;

select * from chocolate_nutrition
order by 1;

select max(date) from sales_data;

select round(summ/5,2) from(select extract(month from date) as monthh, sum(amount) as summ
from sales_data
where country != 'Canada'
group by extract(month from date)
order by extract(month from date));

select country, sum(amount) 
from sales_data
where extract(month from date) = 6
group by country
order by 2 desc;