/* Question 3, We want to find out how the two stores compare in their count of rental orders during every month for all the years we have data for. 
Write a query that returns the store ID for the store, the year and month and the number of rental orders each store has fulfilled for that month. 
Your table should include a column for each of the following: year, month, store ID and count of rental orders fulfilled during that month. */

SELECT 	DATE_PART('month', r.rental_date) AS Rental_month,
		DATE_PART('year', r.rental_date) AS Rental_year,
		s.store_id,
 COUNT	(*) AS rental_count
  FROM	rental AS r
  JOIN	payment AS p
 USING	(rental_id)
  JOIN	staff AS st
    ON	r.staff_id = st.staff_id
  JOIN 	store AS s
 USING	(store_id)
GROUP BY 1,2,3
ORDER BY 4 DESC;
  