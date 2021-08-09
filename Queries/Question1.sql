/*Question 1:
We want to understand more about the movies that families are watching. The following categories are considered family 
movies: Animation, Children, Classics, Comedy, Family and Music.*/

WITH films as (
	SELECT f.title AS film_name, 
		   c.name AS category,
		   r.rental_ID AS rental
	  FROM film AS f
      JOIN film_category as fc
	 USING (film_id)
	  JOIN category AS c
	 USING (category_id)
	  JOIN inventory AS i
		ON f.film_id = i.inventory_id
	  JOIN rental AS r
		ON i.inventory_id = r.inventory_id
	 WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
)
SELECT film_name, category,
 COUNT (*) as rental_count
  FROM films
GROUP BY 1,2
ORDER BY 2;