SELECT 
   name AS category_name
  ,SUM (amount) as total_revenue

FROM payment A

INNER JOIN rental B ON A.rental_id = B.rental_id
INNER JOIN inventory C ON B.inventory_id= C.inventory_id
INNER JOIN film_category D ON C.film_id= D.film_id
INNER JOIN category E ON D.category_id= E.category_id

GROUP BY category_name
ORDER BY total_revenue DESC;
