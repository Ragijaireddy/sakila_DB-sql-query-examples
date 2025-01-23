### --these question are hard provide by chatgpt and practice in mysql workshop
-- 1. Find the total amount paid by each customer for films rented in the year 2006.
selectfrom customer;
selectfrom rental;
select*from payment;

select c.customer_id, c.first_name, sum(p.amount) as "total_amount_paid" from customer c
join rental r on c.customer_id = r.customer_id join payment p on r.rental_id = p.rental_id where year(r.rental_date) = 2006 group by c.customer_id, c.first_name;

/*
-- 2. Retrieve the film title, description, and rating for films with a rental rate
greater than 2.99 and a length greater than 120 minutes.--*/
select *from film;
select title,description,rating from film where rental_rate>2.99 and length>120;

-- 3 . List all the films rented by customers from the 'SOUNTH AFRICA' country.
select *from film;
select *from country;
select *from rental;
select *from inventory;
select *from city;
select *from address;
select *from customer;
-- customer, address, city, country, rental, inventory, and film
select f.title from film f join inventory inv on f.film_id=inv.film_id
join rental r on r.inventory_id=inv.inventory_id
join customer c on c.customer_id=r.customer_id
join address a on a.address_id=c.address_id
join city ci on ci.city_id=a.city_id
join country con on con.country_id=ci.country_id where con.country="Chile";

-- 4. Find the number of films rented by each customer in the year 2006.
select *from customer;
select *from film;
select c.customer_id, c.first_name, c.last_name, count(r.rental_id) as "films_rented" from customer c
join rental r on c.customer_id = r.customer_id
where year(r.rental_date) = 2006 group by c.customer_id, c.first_name, c.last_name;

-- 6. Retrieve the film title and rental duration for films rented by customers from the 'Canada' country.
select *from film;
select *from country;
select *from rental;
select *from inventory;
select *from city;
select *from address;
select *from customer;
select f.title ,f.rental_duration from film f join inventory inv on f.film_id=inv.film_id
join rental r on r.inventory_id=inv.inventory_id
join customer c on c.customer_id=r.customer_id
join address a on a.address_id=c.address_id
join city ci on ci.city_id=a.city_id
join country con on con.country_id=ci.country_id where con.country="Canada";
-- 7. Find the total amount paid by each customer for films rented in the year 2005.
select *from customer;
select *from rental;
select *from payment;

select c.customer_id, c.first_name, c.last_name, sum(p.amount) as "total_amount_paid" from customer c
join rental r on c.customer_id = r.customer_id
join payment p on r.rental_id = p.rental_id where year(r.rental_date) = 2005
group by c.customer_id, c.first_name, c.last_name;

-- 8. List all the films released in the year 2005 or 2006 with a rental rate greater than 1.99.
select *from film;
select title,description,release_year,rating from film where release_year=2005 or release_year=2006 and rating>1.99;

-- 9. Retrieve the film title, description, and rating for films with a length between 60 and 120 minutes and a rental rate greater than 1.99.
select *from film;
select title,description,release_year,rating from film where length between 60 and 120 and rating>1.99;
-- 10. Find the number of films in each category with a rental rate greater than 1.99.
select *from film;
select *from film_category;
select *from category;
select c.name,count(f.title) from film f join film_category fc on f.film_id=fc.film_id
join category c on c.category_id=fc.category_id where rental_rate>1.99 group by c.name;
-- 11. Get the list of actors who played in films released in the year 2005 or 2006.
select *from film;
select *from actor;
select *from film_actor;
select concat(a.first_name,'',a.last_name) as name from actor a join film_actor fa on fa.actor_id=a.actor_id
join film f on f.film_id=fa.film_id where release_year=2005 or 2006 group by name;

-- 12. Retrieve the film title and rental duration for films rented by customers from the 'Australia' country.
select *from film;
select *from country;
select *from rental;
select *from inventory;
select *from city;
select *from address;
select *from customer;

select f.title, f.rental_duration from film f
join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id=i.inventory_id
join customer c on r.customer_id = c.customer_id
join address a on c.address_id = a.address_id
join city ci on a.city_id = ci.city_id
join country co on ci.country_id = co.country_id where co.country = 'australia';

-- 13. Find the total amount paid by each customer for films rented in the year 2006 with a rental rate greater than 2.99.
select *from film;
select *from payment;
select *from rental;
select *from customer;
select *from inventory;

select c.customer_id ,sum(p.amount) from film f
join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id=i.inventory_id
join customer c on r.customer_id = c.customer_id
join payment p on p.rental_id=r.rental_id
where year(r.rental_date)=2006 and f.rental_rate>2.99 group by c.customer_id;
-- 14. List all the films rented by customers from the 'UK' country with a rental rate greater than 1.99.
select *from film;
select *from country;
select *from rental;
select *from inventory;
select *from city;
select *from address;
select *from customer;

select f.title, f.rental_duration from film f
join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id=i.inventory_id
join customer c on r.customer_id = c.customer_id
join address a on c.address_id = a.address_id
join city ci on a.city_id = ci.city_id
join country co on ci.country_id = co.country_id where co.country = 'united %' and f.rental_rate>1.99;

-- 15. Find the number of films rented by each customer in the year 2005 with a rental rate greater than 1.99.
select *from film;
select *from customer;
select *from rental;
select *from inventory;
select c.customer_id from film f
join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id=i.inventory_id
join customer c on r.customer_id = c.customer_id
where f.release_year=2005 and rental_rate>1.99 ;
-- 16. Get the list of customers who rented more than 15 films in the year 2006 with a rental rate greater than 2.99.

select *from film;
select *from customer;
select *from rental;
select *from inventory;
select c.customer_id,count(f.film_id) from film f
join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id=i.inventory_id
join customer c on r.customer_id = c.customer_id
where f.release_year=2006 and rental_rate>2.99 group by c.customer_id having count(f.film_id);
-- 17. Retrieve the film title and rental duration for films rented by customers from the 'Germany' country with a rental rate greater than 1.99.

select *from film;
select *from country;
select *from rental;
select *from inventory;
select *from city;
select *from address;
select *from customer;

select f.title, f.rental_duration from film f
join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id=i.inventory_id
join customer c on r.customer_id = c.customer_id
join address a on c.address_id = a.address_id
join city ci on a.city_id = ci.city_id
join country co on ci.country_id = co.country_id where co.country = 'Germany' and f.rental_rate>1.99;

-- 18. Find the total amount paid by each customer for films rented in the year 2005 with a rental rate greater than 2.99.
select *from customer;
select *from rental;
select *from payment;
select *from inventory;
select *from film;
select c.customer_id,sum(p.amount) from customer c join rental r on r.customer_id=c.customer_id
join payment p on p.rental_id=r.rental_id
join inventory i on i.inventory_id=r.inventory_id
join film f on f.film_id=i.film_id
where year(rental_date)=2005 and f.rental_rate>2.99 group by c.customer_id;

-- 19. Find the number of films
select count(distinct title) from film;
select count(title) from film;