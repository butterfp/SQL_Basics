WITH RECURSIVE tsp AS (
    SELECT
        point1,
        point2,
        cost,
        ARRAY[point1, point2]::VARCHAR[] AS tour,
        cost AS total_cost
    FROM nodes
    WHERE point1 = 'a'
    UNION ALL
    SELECT
        t.point1,
        n.point2,
        t.cost,
        t.tour || ARRAY[n.point2],
        t.total_cost + n.cost
    FROM tsp t
    JOIN nodes n
        ON t.point2 = n.point1
    WHERE NOT n.point2 = ANY(t.tour)
),
complete_tours AS (
    SELECT
        total_cost + n.cost AS total_cost,
        tour || ARRAY['a'] AS tour
    FROM tsp
    JOIN nodes n
        ON tsp.point2 = n.point1
    WHERE
        array_length(tour, 1) = 4
        AND n.point2 = 'a'
)
SELECT
    total_cost,
    tour::TEXT AS tour
FROM complete_tours
WHERE total_cost IN (
    SELECT MIN(total_cost) FROM complete_tours
    UNION
    SELECT MAX(total_cost) FROM complete_tours
)
ORDER BY total_cost, tour;
