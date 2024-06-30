SELECT "name", AVG("exemplary") , AVG("evaluated")
FROM "districts"
INNER JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
GROUP BY "districts"."id"
HAVING AVG("exemplary") > (
    SELECT AVG("exemplary") FROM "staff_evaluations"
)
AND AVG("evaluated") > (
    SELECT AVG("evaluated") FROM "staff_evaluations"
)
ORDER BY AVG("evaluated") DESC, AVG("exemplary") DESC;
