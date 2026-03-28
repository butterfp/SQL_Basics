WITH visits_in_period AS (
    SELECT 
        person_id,
        pizzeria_id,
        visit_date
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
),
people_without_visits AS (
    SELECT person.id
    FROM person
    WHERE person.id NOT IN (
        SELECT person_id FROM visits_in_period
    )
),
pizzerias_without_visits AS (
    SELECT pizzeria.id
    FROM pizzeria
    WHERE pizzeria.id NOT IN (
        SELECT pizzeria_id FROM visits_in_period
    )
)
SELECT 
    COALESCE(person.name, '-') as person_name,
    visits_in_period.visit_date,
    COALESCE(pizzeria.name, '-') as pizzeria_name
FROM visits_in_period
FULL JOIN person ON visits_in_period.person_id = person.id
FULL JOIN pizzeria ON visits_in_period.pizzeria_id = pizzeria.id
WHERE 
    visits_in_period.visit_date IS NOT NULL
    OR person.id IN (SELECT id FROM people_without_visits)
    OR pizzeria.id IN (SELECT id FROM pizzerias_without_visits)
ORDER BY 
    COALESCE(person.name, '-'),
    visits_in_period.visit_date,
    COALESCE(pizzeria.name, '-');