DROP SCHEMA IF EXISTS booking_db;
CREATE SCHEMA booking_db;
USE booking_db;

CREATE TABLE booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT,
    amount DOUBLE,
    name VARCHAR(50),
    seats VARCHAR(50),
    booking_time DATETIME NOT NULL
);

commit;

select*from booking;