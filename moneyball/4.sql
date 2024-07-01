SELECT "first_name" , "last_name" , "salary" FROM "players"
INNER JOIN "salaries" ON "salaries"."player_id" = "players"."id"
WHERE "year" = 2001
ORDER BY "salary" , "first_name" , "last_name" , "players"."id"
LIMIT 50;
