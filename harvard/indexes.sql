CREATE INDEX "enrollments_id" ON "enrollments" ("course_id", "student_id");
CREATE INDEX "courses_index" ON "courses" ("department", "number","semester", "title");
CREATE INDEX "satisfies_index" ON "satisfies" ("course_id", "requimerent_id");


