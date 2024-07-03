CREATE TABLE "passagers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER,
    PRIMARY KEY("id")
);


CREATE TABLE "airlines"(
    "id" INTEGER,
    "name" TEXT UNIQUE NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ("A","B","C","D","E","F","T")),
    PRIMARY KEY("id")
);


CREATE TABLE "flights"(
    "id" INTEGER,
    "flight_number"INTEGER CHECK ("flight_number" <= 1000),
    "airline_id" INTEGER,
    "depature_airport_code" TEXT NOT NULL,
    "arrival_airport_code" TEXT NOT NULL,
    "departure_date_time" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "arrival_date_time" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("airline_id") REFERENCES "airlines"("id")
);


CREATE TABLE "check_ins" (
    "passager_id" INTEGER,
    "date_time" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER,
    FOREIGN KEY("passager_id") REFERENCES "passagers"("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")

);
