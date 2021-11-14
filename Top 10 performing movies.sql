SELECT 
   title
  ,SUM (amount) AS total_revenue

FROM payment A

INNER JOIN rental B ON A.rental_id = B.rental_id
INNER JOIN inventory C ON B.inventory_id= C.inventory_id
INNER JOIN film D ON C.film_id= D.film_id

GROUP BY title
ORDER BY total_revenue DESC
LIMIT 10;

