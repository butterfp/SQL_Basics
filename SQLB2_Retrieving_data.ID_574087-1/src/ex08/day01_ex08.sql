SELECT
    order_date,
    name || ' (age:' || age || ')' AS person_information
FROM (
    SELECT 
        order_date,
        person_id AS id
    FROM person_order
)
NATURAL JOIN person
ORDER BY 
    order_date,
    person_information;