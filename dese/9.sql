SELECT "name" FROM "districts"
INNER JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE "pupils" = (
    SELECT MIN("pupils") FROM "expenditures"
);
