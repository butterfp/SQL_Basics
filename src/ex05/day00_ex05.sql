SELECT 
    (SELECT name FROM person WHERE id = po.person_id) AS name
FROM 
    person_order po
WHERE 
    po.menu_id IN (13, 14, 18)
    AND po.order_date = '2022-01-07';