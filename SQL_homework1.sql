select * from actor;
--1. How many actors are there with the last name ‘Wahlberg’?
select first_name, last_name
from actor 
where last_name like 'Wahlberg';
--ANSWER: 2

select * from payment;
--2. How many payments were made between $3.99 and $5.99?
select sum(amount)
from payment
where amount between 3.99 and 5.99
--ANSWER: 0

select * from inventory;
--3. What film does the store have the most of? (search in inventory)
select film_id, SUM(film_id)
from inventory
group by film_id
order by sum DESC;
--ANSWER: film_id 1000 has 8000 films

select * from customer;
--4. How many customers have the last name ‘William’?
select count(last_name)
from customer
where last_name like 'William';
--ANSWER: 0

select * from payment;
--5. What store employee (get the id) sold the most rentals?
select count(rental_id), staff_id from payment group by staff_id order by count desc;
--ANSWER: employee 2 has sold the most

select * from address;
--6. How many different district names are there
select district 
from address 
group by district
--ANSWER: 378 districts

select * from film_actor;
--7. What film has the most actors in it? (use film_actor table and get film_id)
select count(actor_id), film_id 
from film_actor 
group by film_id 
order by count desc;
-- film_id has the most actors at 15


--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(last_name)
from customer 
where last_name like '%es';
--ANSWER: 21

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
select count(amount), amount 
from payment 
where customer_id > 380 and customer_id  < 430 
group by amount 
order by count desc;
--ANSWER: 3 payment amounts

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
select count(film_id), rating 
from film 
group by rating 
order by count desc;
--ANSWER: there are 5 rating categories and PG-13 has the most at 223