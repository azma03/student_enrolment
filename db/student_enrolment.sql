DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses (
  id SERIAL4 primary key,
  name varchar(255),
  logo varchar(255)
);


CREATE TABLE students (
  id SERIAL4 primary key,
  first_name varchar(255),
  last_name varchar(255),
  house_id INT4 REFERENCES houses(id) ON DELETE CASCADE,
  age INT4
);
