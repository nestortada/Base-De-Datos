CREATE TABLE "users"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);


CREATE TABLE "schools_and_universities"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "founded" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "companies"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL
);


CREATE TABLE "connections_people"(
    "user_id_1" INTEGER,
    "user_id_2" INTEGER,
    FOREIGN KEY ("user_id_1") REFERENCES "users"("id"),
    FOREIGN KEY ("user_id_2") REFERENCES "users"("id")
);


CREATE TABLE "connections_schools"(
    "user_id" INTEGER,
    "schools_id" INTEGER,
    "start_date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC,
    "type" NUMERIC NOT NULL,
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("schools_id") REFERENCES "schools_and_universities"("id")
);


CREATE TABLE "connections_companies"(
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC,
    "type" TEXT NOT NULL,
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")
);
