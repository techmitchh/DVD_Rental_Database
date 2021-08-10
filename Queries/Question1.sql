/*Question 1:
What film categories are most popular with families? The following categories are considered family 
movies: Animation, Children, Classics, Comedy, Family and Music.*/

WITH films AS (
	SELECT f.title AS film_name, 
		   c.name AS category,
		   r.rental_ID AS rental
	  FROM film AS f
      JOIN film_category AS fc
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
 COUNT (*) AS rental_count
  FROM films
GROUP BY 1,2
ORDER BY 2;
