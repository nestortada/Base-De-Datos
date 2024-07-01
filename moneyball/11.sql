SELECT  DISTINCT "first_name" ,   "last_name"  , MIN(("salary"/"H")) AS "dollar per hit" FROM "players"
INNER JOIN "salaries" ON "salaries"."player_id" = "players"."id"
INNER JOIN "performances" ON "performances"."player_id" = "players"."id"
WHERE "H" >  0 AND "salaries"."year" = 2001
GROUP BY "salaries"."player_id"
ORDER BY "dollar per hit" , "first_name" , "last_name"
LIMIT 10;

