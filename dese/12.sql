SELECT "name",
AVG("per_pupil_expenditure") AS "AVG_per_pupil_expenditure",
AVG("exemplary") AS "AVG_exemplary"
FROM "districts"
INNER JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
INNER JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
WHERE "type" = "Public School District"
GROUP BY "districts"."id"
HAVING AVG("per_pupil_expenditure") > (
    SELECT AVG("per_pupil_expenditure") FROM "expenditures"
)
AND AVG("exemplary") > (
    SELECT AVG("exemplary") FROM "staff_evaluations"
)
ORDER BY AVG("exemplary") DESC, AVG("per_pupil_expenditure") DESC;

