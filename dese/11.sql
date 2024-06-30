SELECT "schools"."name", "per_pupil_expenditure", "graduated" FROM "districts"
INNER JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
INNER JOIN "schools" ON "schools"."district_id" = "districts"."id"
INNER JOIN "graduation_rates" ON "graduation_rates"."school_id" = "schools"."id"
ORDER BY "per_pupil_expenditure" DESC , "schools"."name" ;

