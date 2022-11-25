create database Zomato;

use Zomato;

select * from restaurant_info;




-- area wise distribution of restaurant

--- Based on total no number of restaurant in bangaulore mention in zomato 

select location , count_of_restaurant from distribution_of_restaurant_ order by count_of_restaurant desc;

select sum(count_of_restaurant) from distribution_of_restaurant_;

select count(name) from restaurant_info;

-- Which location have maximum  number of restaurant  top two.

select top 2 location , count_of_restaurant from distribution_of_restaurant_ order by count_of_restaurant desc ;

-- Which location have minimum number of restaurant. last two.

select top 2 location , count_of_restaurant from distribution_of_restaurant_ order by count_of_restaurant asc ;

-----now out of all the restaurant we took the data 7593 restaurant randomly from every locations-----


---Which location have maximum number of restaurant where the delivery_review_number is greater than 1000.

select top 14 location,count(Name) as restaurant_count from [dbo].[restaurant_info] where delivery_review_number>1000
group by location order by restaurant_count desc;

create view  table_1 as
select location,count(name) as number_of_restaurant,max(delivery_review_number) as max_delivery_review_number 
from [dbo].[restaurant_info] 
group by location ;



create view  table_2 as
select location,max(delivery_review_number) as max_delivery_review_number , name , cusines
from [dbo].[restaurant_info] 
group by location , name , cusines;


select top 10 a.location , a.number_of_restaurant , b.max_delivery_review_number , b.name , b.cusines
from table_1 as a right join table_2 as b on a.location = b.location 
order by max_delivery_review_number desc




--- Which location maximum number of less rated restaurant.

--took locations where restaurant is more than 20 in number.

select 10 location , count(name) as no_of_restaurants  , avg(Rating) average_rating 
from [dbo].[restaurant_info] group by location 
having count(name) > 19
order by avg(Rating);


-- Which location maximum number of high rated restaurant.
select  location , count(name) as no_of_restaurants  , avg(Rating) average_rating 
from [dbo].[restaurant_info] group by location 
having count(name) > 19
order by avg(Rating) desc ;

--- Area wise cheap and expensive restaurant and their average price

--avg_price cheap reastuarant


select  location  , avg(dish_price) as avg_price , count(restaurant_name) count_of_restaurant
from [dbo].[restaurant_details] 
group by location
having count(restaurant_name) > 450
order by avg(dish_price)
 ;

select top 5 location  , avg(dish_price) as avg_price , count(restaurant_name) count_of_restaurant
from [dbo].[restaurant_details] 
group by location
having count(restaurant_name) > 450
order by avg(dish_price) desc;

 

--expensive reastuarant


select  top 5 dish_name , dish_price , restaurant_name 
from [dbo].[restaurant_details] 
order by dish_price desc ;


--Number of restaurant for each type of cuisine. 

select  count(Name) as No_restaurant,cusines from [dbo].[restaurant_info] group by cusines
order by count(Name) desc


select count(name) as North_indian from [dbo].[restaurant_info] WHERE Cusines LIKE 'North indian%';
select count(name) as south_indian from [dbo].[restaurant_info] WHERE Cusines LIKE 'South Indian%';
select count(cusines) as biryani from [dbo].[restaurant_info] WHERE Cusines LIKE 'Biryani%';

select count(name) as North_indian from [dbo].[restaurant_info] WHERE Cusines LIKE '%North indian%';
select count(name) as south_indian from [dbo].[restaurant_info] WHERE Cusines LIKE '%South Indian%';
select count(cusines) as biryani from [dbo].[restaurant_info] WHERE Cusines LIKE '%Biryani%';


--cheapest cusine
select *,DENSE_RANK() over (partition by Restaurant_Name order by Dish_Price) as price_Rank from  [dbo].[restaurant_details]; 

select top 2 a.Restaurant_Name,a.Dish_Name,a.Dish_Price from
(select *,DENSE_RANK() over (partition by Restaurant_Name order by Dish_Price)
as price_Rank from  [dbo].[restaurant_details]) as a
where price_Rank=1


----location to open kitchen

use zomato

select*from [dbo].[restaurant_info] 

------- Most number of outlets of particular restaurants.

select top 10 name , count(name) as number_of_franchise , cusines from [dbo].[restaurant_info]
group by  name , cusines 
order by count(name)  desc; 

------- avg rating between 3.5 and 4 and delivery_review_number>2000

select*from [dbo].[restaurant_info] 

select  location,count(Name) as restaurant_count , avg(rating) as avg_rating
from [dbo].[restaurant_info] 
where delivery_review_number>2000
group by location 
having avg(rating) > 3.2 and avg(rating) < 3.3
order by restaurant_count desc;

------- avg rating between 3.5 and 4 and delivery_review_number>1000

select  location,count(Name) as restaurant_count , avg(rating) as avg_rating
from [dbo].[restaurant_info] 
where delivery_review_number>1000
group by location 
having avg(rating) > 3.4 and avg(rating) < 3.8
order by restaurant_count desc;





select location  ,avg(delivery_review_number) as avg_review , count(name) as Restaurant_count , avg(Rating) as Rating_avg
from [dbo].[restaurant_info]
group by location
having count(name) > 50
order by avg(delivery_review_number) desc;

select location , count (name) restaurant_count ,avg(Rating) , avg (delivery_review_number)
from [dbo].[restaurant_info]
where location = 'Hennur, Bangalore' or location = 'Nagawara, Bangalore'
group by location
order by count (name) desc;



select * from [dbo].[distribution_of_restaurant_]
where location = 'Hennur' 


select name , location , delivery_review_number , Rating, cusines from [dbo].[restaurant_info] 
where location like '%Nagawara, Bangalore%'

select * from [dbo].[restaurant_details] 
where location like '%Hennur%'




