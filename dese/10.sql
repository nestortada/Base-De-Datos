SELECT "districts"."name", SUM("per_pupil_expenditure")
FROM "districts"
INNER JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE "type" = 'Public School District'
GROUP BY "districts"."id"
ORDER BY SUM("per_pupil_expenditure") DESC
LIMIT 10;

