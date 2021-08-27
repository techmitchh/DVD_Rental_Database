/* Question 2, Now we need to know how the length of rental duration of these family-friendly movies compares to the duration that all movies are rented for. 
Can you provide a table with the movie titles and divide them into 4 levels (first_quarter, second_quarter, third_quarter, and final_quarter) based on the quartiles 
(25%, 50%, 75%) of the rental duration for movies across all categories? Make sure to also indicate the category that these family-friendly movies fall into. */

SELECT 	f.title,
		c.name,
		f.rental_duration,
		NTILE(4) OVER (ORDER BY rental_duration) AS standard_quartile
  FROM	film AS f
  JOIN	film_category AS fc
  USING	(film_id)
  JOIN 	category AS c
  USING	(category_id)
  WHERE  c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
ORDER BY 4;
		