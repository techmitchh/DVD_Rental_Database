/* Question 4, We would like to know who were our top 10 paying customers, how many payments they made on a monthly basis during 2007, and what was the amount of the monthly payments. 
Can you write a query to capture the customer name, month and year of payment, and total payment amount for each month by these top 10 paying customers? */


WITH t10 AS (SELECT 	COUNT (*) AS pay_countpermon,
	  		SUM(amount) AS pay_amount,
	  		--DATE_TRUNC('month', rental_date) AS pay_month,
			--DATE_PART('year', rental_date) AS pay_year,
			CONCAT(first_name,' ',last_name) AS fullname
	  FROM 	rental AS r
	  JOIN	customer AS c
	 USING	(customer_id)
	  JOIN	payment AS p
	 USING	(rental_id)
	 WHERE DATE_PART('year', rental_date) = '2005' 
	GROUP BY 3
	ORDER BY 2 DESC
	 LIMIT 10
	 ),
pm AS (
	SELECT 	COUNT (*) AS pay_countpermon,
	  		SUM(amount) AS pay_amount,
	  		DATE_TRUNC('month', rental_date) AS pay_month,
			DATE_PART('year', rental_date) AS pay_year,
			CONCAT(first_name,' ',last_name) AS fullname
	  FROM 	rental AS r
	  JOIN	customer AS c
	 USING	(customer_id)
	  JOIN	payment AS p
	 USING	(rental_id)
	 WHERE DATE_PART('year', rental_date) = '2005' 
	GROUP BY 3,4,5
	ORDER BY 2 DESC
)
	 
SELECT t10.fullname, SUM(pm.pay_countpermon) AS sum_count, AVG(pm.pay_amount) AS avg_pay
  FROM t10
  JOIN pm
    ON t10.fullname = pm.fullname
GROUP BY 1
ORDER BY 3 DESC;