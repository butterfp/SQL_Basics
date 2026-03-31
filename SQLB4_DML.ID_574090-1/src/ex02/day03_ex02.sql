SELECT 
    menu.pizza_name,
    menu.price,
    pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE menu.id NOT IN (
    SELECT DISTINCT menu_id
    FROM person_order
)
ORDER BY 
    menu.pizza_name,
    menu.price;