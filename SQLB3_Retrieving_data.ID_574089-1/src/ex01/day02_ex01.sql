SELECT
    dates::date AS missing_date
FROM generate_series(
    '2022-01-01'::date,
    '2022-01-10'::date,
    '1 day'
) AS dates
LEFT JOIN person_visits
    ON dates = person_visits.visit_date
    AND person_visits.person_id IN (1, 2)
WHERE person_visits.id IS NULL
ORDER BY missing_date;