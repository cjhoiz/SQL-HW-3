--1. List all customers who live in Texas (use
--JOINs)
-- 5 customers live in Texas

select first_name, last_name, district
from customer 
full join address
on customer.address_id = address.address_id
where district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full
--Name
-- 6 people returned from this query

select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
);

--3. Show all customers names who have made payments over $175(use
--subqueries)
-- 2 customers returned

select first_name, last_name
from customer
where customer_id IN(
	select customer_id
	from payment
	group by customer_id
	having SUM(amount) > 175
);

--4. List all customers that live in Nepal (use the city
--table)
-- Kevin Schuler lives in Nepal

select customer.first_name, customer.last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal';

--5. Which staff member had the most
--transactions?
-- Staff ID # 1 had the most transactions

select payment.staff_id, max(amount)
from payment
full join staff
on payment.staff_id = staff.staff_id
group by payment.staff_id;

--6. How many movies of each rating are
--there?
-- 209 NC-17, 178 G, 223 PG-13, 194 PG, and 196 R

select rating, count(rating)
from film
group by rating;

--7. Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
-- 6 customers paid over 6.99 in a single payment

select first_name, last_name
from customer
where customer_id IN(
	select customer_id
	from payment
	where amount > 6.99
);

--8. How many free rentals did our stores give away?
-- No rentals were given away.

select count(rental_id)
from payment
where amount = 0;


