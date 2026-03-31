(SELECT pizzeria.name AS pizzeria_name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person.gender = 'female'
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person.gender = 'male')
UNION
(SELECT pizzeria.name AS pizzeria_name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person.gender = 'male'
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person.gender = 'female')
ORDER BY pizzeria_name;