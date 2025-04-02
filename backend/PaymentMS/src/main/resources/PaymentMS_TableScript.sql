DROP SCHEMA IF EXISTS payment_db;
CREATE SCHEMA payment_db;
USE payment_db;
CREATE TABLE payment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    card_type ENUM('Debit', 'Credit'),
    card_num BIGINT(16),
    expiry VARCHAR(10),
    cvv INT
);

INSERT INTO Payment (name, card_type, card_num, expiry, cvv) VALUES('John Doe', 'Credit', 1234567812345678, '12/25', 123),('Aman Smith', 'Debit', 8765432187654321, '11/24', 406);
INSERT INTO Payment (name, card_type, card_num, expiry, cvv) VALUES('Aman Doe', 'Credit', 1232563812345678, '12/25', 153),('Jane kumar', 'Debit', 8765432187654321, '11/24', 496);
INSERT INTO Payment (name, card_type, card_num, expiry, cvv) VALUES('John kumar', 'Credit', 1233667812345678, '12/25', 193),('kotla Smith', 'Debit', 8765432187654321, '11/24', 856);


commit;

select*from payment;