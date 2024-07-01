SELECT "name" , SUM("H") AS "total hits" FROM "teams"
INNER JOIN "performances" ON "performances"."team_id" = "teams"."id"
WHERE "performances"."year" =2001
GROUP BY "name"
ORDER BY SUM("H") DESC
LIMIT 5 ;

