SELECT
    action_date,
    (SELECT name FROM person WHERE id = common_dates.person_id) AS person_name
FROM (
    SELECT order_date AS action_date, person_id
    FROM person_order
    INTERSECT
    SELECT visit_date AS action_date, person_id
    FROM person_visits
) AS common_dates
ORDER BY 
    action_date ASC,
    person_name DESC;