-- *** The Lost Letter ***

-- I am looking for the type and address of the location where a package was dropped off.
--The package originated from the address “900 Somerville Avenue”.
--My first select the id of the address “900 Somerville Avenue” from the addresses table.
--Then, I use this id to select the id of the package from the packages table.
-- Finally, you use this package id to select the address_id from the scans table where the action is “Drop”.
-- This address_id is used to select the type and address from the addresses table.

SELECT "type" , "address" FROM "addresses" WHERE "id" = (
        SELECT "address_id" FROM "scans" WHERE "action" = "Drop" AND "package_id" IN (
                SELECT "id" FROM "packages" WHERE "from_address_id" = (
                        SELECT "id" FROM "addresses" WHERE "address" = "900 Somerville Avenue"
                ) AND "to_address_id" = (
                        SELECT "id" FROM "addresses" WHERE "address" = "2 Finnigan Street"
                )
        )
);

-- *** The Devious Delivery ***
-- This query is finding the type of address and the contents of a package that doesn't have a from_address_id,
--meaning it wasn't sent from any known address.
--Get the address_id from the scans table where the action was a 'Drop' and the package_id is in the list
--of packages that don't have a from_address_id
-- Get the id of the package that doesn't have a from_address_id

SELECT "type", "contents" FROM "addresses"
INNER JOIN "packages" ON "packages"."from_address_id" IS NULL
WHERE "addresses"."id" = (
        SELECT "address_id"FROM "scans" WHERE "action" = 'Drop' AND "package_id" = (
                SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
    )
);


-- *** The Forgotten Gift ***

--This query is finding the contents of a package and the name of the driver who picked it up from the address
--"728 Maple Place"
 -- Get the id of the address '728 Maple Place'

SELECT "contents" , "name"
FROM (( "scans" INNER JOIN "packages" ON "packages"."id" = "scans"."package_id")
INNER JOIN "drivers" ON "drivers"."id" = "scans"."driver_id" )
WHERE "action" = "Pick" AND "address_id" IN (
        SELECT "id" FROM "addresses" WHERE "address" = "109 Tileston Street"
);
