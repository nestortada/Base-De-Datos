SELECT "first_name" , "last_name", "birth_city"
FROM "players"
WHERE ("bats" = "L" AND "throws" = "L")
ORDER BY "birth_day" DESC , "debut" LIMIT 100;
