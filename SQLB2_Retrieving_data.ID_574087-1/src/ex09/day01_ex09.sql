SELECT name
FROM pizzeria
WHERE id NOT IN (
    SELECT DISTINCT pizzeria_id 
    FROM person_visits
    WHERE pizzeria_id IS NOT NULL
)
ORDER BY name;

SELECT p.name
FROM pizzeria p
WHERE NOT EXISTS (
    SELECT 1
    FROM person_visits pv
    WHERE pv.pizzeria_id = p.id
)
ORDER BY p.name;