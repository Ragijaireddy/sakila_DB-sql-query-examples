### **--Easy Questions ,these quetions provide by chatgpt and i practice it on mysql workshop**
-- 1. List all the films in the Sakila database.

use sakila;

select *from film;

-- 2. Find the total number of films in the database.
select count(film_id) as tot_number from film;
-- . 3 Retrieve the film title and description for films with a rating of 'G'.
select *from film;
select f.title,f.description from film f where f.rating='G';
-- 4. Get the list of actors who played in the film 'ACADEMY DINOSAUR'.
select *from film;
select *from  film_actor;
select *from  actor;
select n.title, concat(a.first_name, ' ', a.last_name) from film_actor f join actor a on a.actor_id = f.actor_id join film n on f.film_id = n.film_id where n.title = 'academy dinosaur';


-- 5. Find the number of actors in the film 'ACADEMY DINOSAUR'.
select *from film;
select *from  film_actor;
select *from  actor;
select n.title, count(concat(a.first_name, ' ', a.last_name)) from film_actor f join actor a on a.actor_id = f.actor_id join film n on f.film_id = n.film_id where n.title = 'academy dinosaur';


-- 6. Retrieve the film title, description, and rating for films with a length greater than 60 minutes.

select title ,description,rating from film where length>60;
-- 7. List all the film categories.
select*from film_category;
-- 8. Find the number of films in each category.
select c.name ,count(f.film_id) from category c join film_category f on c.category_id=f.category_id group by c.name; 
SELECT c.name AS category_name, COUNT(f.film_id) AS total_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- 9. Get the list of films released in the year 2006.
select *from film where release_year=2006;
-- 10. Retrieve the film title and rental duration for films with a rental rate of 0.99.

select f.title,f.rental_duration from film f where rental_rate=0.99;