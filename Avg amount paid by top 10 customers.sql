SELECT 

AVG(total_amount_paid_by_customer) AS average_amount_paid_by_customer
,customer_id
,first_name
,last_name
,city
,country

FROM
(SELECT
A.customer_ID,
B.first_name,
B.last_name,
D.city,
E.country,
SUM (amount) AS total_amount_paid_by_customer

FROM payment A

INNER JOIN customer B ON A.customer_id = B.customer_id
INNER JOIN address C ON B.address_id = C.address_id
INNER JOIN city D ON C.city_id = D.city_id
INNER JOIN country E ON D.country_id = E.country_id

WHERE E.country IN
('India','China','United States','Japan','Mexico','Brazil','Russian
Federation','Philippines','Turkey','Indonesia')

AND D.city in
('Aurora','Atlixco','Xintai','Adoni','Dhule (Dhulia)','Kurashiki','Pingxiang','Sivas','Celaya','So
Leopoldo')

GROUP BY
A.customer_ID,
B.first_name,
B.last_name,
D.city,
E.country
ORDER BY total_amount_paid_by_customer DESC
LIMIT 5) AS total_amount_paid_by_customer

GROUP BY total_amount_paid_by_customer,customer_id,first_name,last_name,city,country
;