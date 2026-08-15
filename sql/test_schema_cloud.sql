CREATE DATABASE test_schema;
USE test_schema;

CREATE TABLE test_table (
test_id INT AUTO_INCREMENT,
FirstName varchar(255),
City VARCHAR(255),
PRIMARY KEY (test_id)
);

INSERT INTO test_table (FirstName, City)
VALUES
("Joan", "Barcelona"),
("Tim", "Berlin");

SELECT * FROM test_table;
