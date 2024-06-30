SELECT "name" , "pupils" FROM "districts"
INNER JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id";

