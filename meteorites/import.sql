CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" INTEGER,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" INTEGER,
    "long" INTEGER
);

.import --csv --skip 1 meteorites.csv meteorites_temp


UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = "";

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = "";

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = "";

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = "";

UPDATE "meteorites_temp"
SET  "mass" = ROUND("mass" , 2);

UPDATE "meteorites_temp"
SET "lat" =  ROUND("lat" , 2);

UPDATE "meteorites_temp"
SET "long" =  ROUND("long" , 2);

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" INTEGER,
    "discovery" TEXT NOT NULL,
    "year" NUMERIC,
    "lat" INTEGER,
    "long" INTEGER,
    PRIMARY KEY ("id")
);

INSERT INTO "meteorites" ("name" , "class" , "mass" , "discovery" , "year" , "lat", "long")
SELECT "name" , "class" ,  "mass" , "discovery" , "year" , "lat" , "long" FROM "meteorites_temp"
WHERE "nametype" <> "Relict"
ORDER BY "year" , "name";

DROP TABLE "meteorites_temp";

