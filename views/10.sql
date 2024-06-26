SELECT "english_title" as "complexity of the artwork" , "artist","entropy"
FROM "views"
WHERE "print_number" >= 19
ORDER BY "entropy" DESC;
