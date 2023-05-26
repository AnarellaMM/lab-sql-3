use sakila;

-- 1. How many distinct (different) actors' last names are there?
select count(distinct last_name)
from actor;


-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id)
from film;

select distinct language_id
from film;


-- 3 How many movies were released with "PG-13" rating?
select count(rating) as 'PG-13'
from film
where rating = 'PG-13';


-- or

select sum(rating) as 'PG-13'
from film
where rating = 'PG-13';

-- 4. Get 10 the longest movies from 2006.
Select title from film
where release_year = '2006'
limit 10;


-- 5. How many days has been the company operating (check DATEDIFF() function)?

 SELECT DATEDIFF(year,
        (SELECT MIN(rental_date) FROM rental),
        (SELECT MAX(rental_date) FROM rental));
                        -- I got this but the result is not coming, i get an error code 1582
 SELECT DATEDIFF(
        (SELECT MAX(rental_date) FROM rental),
        (SELECT Min(rental_date) FROM rental));
                        -- and the answer here is 266 days

-- 6. Show rental info with additional columns month and weekday. Get 20.
select *, 
month(rental_date) as Month,
weekday(rental_date) as weekday
from rental
limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, 
month(rental_date) as Month,
weekday(rental_date) as weekday,
 CASE 
       WHEN weekday(rental_date) = 6 
            OR weekday(rental_date) = 7
       THEN 'weekend'
       ELSE 'weekday'
    END AS Day_type
from rental
limit 20;


-- 8. How many rentals were in the last month of activity?
select count(case 
when month(rental_date) = max(month(rental_date))
then 1 
else null
end) as last_month
from rental;

select count(rental_date) as 'last_month'
from rental
where month(rental_date) = max(month(rental_date));

  -- not finding the right function



-- SELECT id, COUNT(IF status=42 THEN 1 ENDIF) AS cnt
-- FROM table
-- GROUP BY table