WITH "most_popular_user" AS (
    SELECT "to_user_id" , COUNT("to_user_id") AS "total_messages" FROM "messages"
    GROUP BY "to_user_id"
    ORDER BY "total_messages" DESC
    LIMIT 1
)
SELECT "username" FROM "users"
INNER JOIN "most_popular_user" ON "most_popular_user"."to_user_id" = "users"."id";

