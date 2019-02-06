use sakila;
select first_name
	, last_name
    from actor;
select concat(first_name,' ',last_name) as Actor_Name
from actor;
select actor_id
	,first_name
    ,last_name
    from actor
    where first_name = "Joe";
select last_name
	from actor
    where last_name like '%GEN%';
select last_name
	from actor
    where last_name like '%LI%'
    group by last_name,first_name;
select country_id
	,country
    from country
    where country in ("Afghanistan","Bangladesh","China");
Alter table actor
add column description blob(30) not null;
Alter table actor
Drop column description;

Select last_name
	,count(*) as number_of_lastnames
    from actor
    group by last_name;

select last_name
	,count(*) as number_of_lastnames
    from actor
    group by last_name
    having number_of_lastnames > 1;
select first_name
	,last_name
    ,actor_id
    from actor
    where first_name = "GROUCHO" and last_name = "WILLIAMS";
update actor
	set first_name = "HARPO"
	where actor_id = 172;
update actor
	set first_name = "GROUCHO"
    where actor_id = 172;
Show create table address;
select staff.first_name
	,staff.last_name
    ,staff.address_id
    ,address.address
    from staff
	join address on address.address_id = staff.address_id;
select staff.first_name
	,staff.last_name
    ,staff.staff_id
    ,payment.amount
    ,count(*) as total_amount
    from staff
    join payment on payment.staff_id = staff.staff_id;
select film.title
    ,film_actor.actor_id
    ,count(film_actor.actor_id) as actors
    from film
    join film_actor on film_actor.film_id = film.film_id
    group by film.title;
select film.film_id
	,film.title
    ,inventory.inventory_id
    ,count(*) as number_of_copies
    from film
    join inventory on inventory.film_id = film.film_id
    where film.title = "Hunchback Impossible"
    group by film.title;
select customer.first_name
	,customer.last_name
    ,sum(payment.amount) as total_amount_paid
    from customer
    join payment on payment.customer_id = customer.customer_id
    group by customer.last_name;
select title
	from film
    where title like 'k%' or title like 'q%'
    and title in 
    ( select title
		from film
        where language_id=1
        );
select first_name
    ,last_name
    from actor
    where actor_id in
    (select actor_id
		from film_actor
        where film_id in
        (select film_id
			from film
            where title = "Alone Trip"
            ));
select customer.address_id
	,customer.first_name
    ,customer.last_name
    ,customer.email
    from customer
    join address on address.address_id = customer.address_id
    join city on city.city_id = address.city_id
    join country on country.country_id = city.country_id
    where country.country = "canada";
-- select * from category;
select film.film_id
	,film.title
    from film
    join film_category on film_category.film_id = film.film_id
    join category on category.category_id = film_category.category_id
    where category.name = "Family";
select f.title
	,count(rental_id) as 'Times Rented'
    from rental r
    join inventory i
    on (r.inventory_id = i.inventory_id)
    join film f
    on (i.film_id = f.film_id)
    group by f.title
    order by 'Times Rented' desc;
select s.store_id
	,sum(amount) as 'Rev'
    from payment p
    join rental r on p.rental_id = r.rental_id
    join inventory i on i.inventory_id = r.inventory_id
    join store s on s.store_id = i.store_id
    group by s.store_id;
select store.address_id
	, city.city
    , country.country
	from store
    join address on address.address_id = store.address_id
    join city on city.city_id = address.city_id
    join country on country.country_id = city.country_id;
create view genre_rev as
select c.name as 'Genre'
	,sum(p.amount) AS 'Gross'
    from category c
    join film_category fc on c.category_id=fc.category_id
    join inventory i on fc.film_id = i.film_id
    join rental r on i.inventory_id = r.inventory_id
    join payment p on r.rental_id = p.rental_id
    group by c.name
    order by gross limit 5;
select * from genre_rev;
drop view genre_rev;




    