SELECT "name" FROM "graduation_rates"
INNER JOIN "schools" ON "schools"."id" = "graduation_rates"."school_id"
WHERE "graduated" = 100;
