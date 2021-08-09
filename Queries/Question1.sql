SELECT f.title, i.inventory_id, r.inventory_id, COUNT (f.title)
  FROM film f
  LEFT JOIN inventory i
    ON f.film_id = i.inventory_id
  LEFT JOIN rental r
    ON i.inventory_id = r.inventory_id
GROUP BY 1,2,3
ORDER BY f.title;
