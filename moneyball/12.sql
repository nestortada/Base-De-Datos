WITH PlayerCostPerHit AS (
    SELECT
        p.id,
        p.first_name,
        p.last_name,
        s.salary / pf.H AS cost_per_hit
    FROM
        players p
    JOIN
        performances pf ON p.id = pf.player_id
    JOIN
        salaries s ON p.id = s.player_id
    WHERE
        pf.year = 2001 AND s.year = 2001 AND pf.H > 0
    ORDER BY
        cost_per_hit ASC
    LIMIT 10
),
PlayerCostPerRBI AS (
    SELECT
        p.id,
        p.first_name,
        p.last_name,
        s.salary / pf.RBI AS cost_per_rbi
    FROM
        players p
    JOIN
        performances pf ON p.id = pf.player_id
    JOIN
        salaries s ON p.id = s.player_id
    WHERE
        pf.year = 2001 AND s.year = 2001 AND pf.RBI > 0
    ORDER BY
        cost_per_rbi ASC
    LIMIT 10
)

SELECT
    DISTINCT p.first_name,
    p.last_name
FROM
    PlayerCostPerHit p
JOIN
    PlayerCostPerRBI r ON p.id = r.id
ORDER BY
    p.last_name;
