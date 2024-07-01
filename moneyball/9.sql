SELECT "name" , AVG("salary") AS "average salary" FROM "teams"
INNER JOIN "salaries" ON "salaries"."team_id" = "teams"."id"
WHERE "salaries"."year" = 2001
GROUP BY "team_id"
ORDER BY AVG("salary")
LIMIT 5;
