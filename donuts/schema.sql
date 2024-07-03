CREATE TABLE "ingredients"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" INTEGER NOT NULL,
    "gluten" INTEGER NOT NULL CHECK("gluten" IN (0,1)),
    "price" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);


CREATE TABLE "donut_ingredients" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);


CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);



CREATE TABLE "orders"(
    "id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);


CREATE TABLE "order_details" (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    FOREIGN KEY ("order_id") REFERENCES "orders"("id")
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);
