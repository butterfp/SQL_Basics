WITH date_series AS (
    SELECT generate_series(
        '2022-01-01'::date,
        '2022-01-10'::date,
        '1 day'
    ) AS visit_date
),
visits_for_1_2 AS (
    SELECT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
)
SELECT 
    date_series.visit_date::date AS missing_date
FROM date_series
LEFT JOIN visits_for_1_2 
    ON date_series.visit_date = visits_for_1_2.visit_date
WHERE visits_for_1_2.visit_date IS NULL
ORDER BY missing_date;