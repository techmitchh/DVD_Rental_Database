/* Question 4, We would like to know who were our top 10 paying customers, how many payments they made on a monthly basis during 2007, and what was the amount of the monthly payments. 
Can you write a query to capture the customer name, month and year of payment, and total payment amount for each month by these top 10 paying customers? */

WITH customer_info AS (
	SELECT 	DATE_PART('year', rental_date) AS year,
			rental_date,
			CONCAT(c.first_name,' ',c.last_name)AS fullname,
			p.amount AS pay
	  FROM 	rental AS r
	  JOIN	customer AS c
	 USING	(customer_id)
	  JOIN	payment AS p
	 USING	(rental_id)
	GROUP BY 1,2,3,4
)

SELECT 	DATE_TRUNC('month', rental_date) AS pay_month,
		fullname,
		COUNT(pay) AS pay_count,
		SUM(pay) AS pay_amount
  FROM 	customer_info
GROUP BY 1,2
ORDER BY 4 DESC
LIMIT 10;