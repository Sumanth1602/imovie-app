DROP SCHEMA IF EXISTS seat_db;
CREATE SCHEMA seat_db;
USE seat_db;

CREATE TABLE seat (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT
);

CREATE TABLE seatlist (
    each_seat_id INT AUTO_INCREMENT PRIMARY KEY,
    seat_num INT,
    status ENUM('AVAILABLE', 'BOOKED'),
    price INT,
    type VARCHAR(50),
    seat_id INT,
    FOREIGN KEY (seat_id) REFERENCES seat(seat_id)
);


-- Insert statements for seat table
INSERT INTO seat (show_id) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- Insert statements for seatlist table
-- Show 1: Mixed seating with normal and recliner seats
INSERT INTO seatlist (seat_id, seat_num, status, price, type) VALUES
(1, 1, 'AVAILABLE', 200, 'Normal'), (1, 2, 'BOOKED', 200, 'Normal'), (1, 3, 'AVAILABLE', 200, 'Normal'),
(1, 4, 'AVAILABLE', 200, 'Normal'), (1, 5, 'BOOKED', 200, 'Normal'), (1, 6, 'AVAILABLE', 400, 'Recliner'),
(1, 7, 'BOOKED', 400, 'Recliner'), (1, 8, 'AVAILABLE', 400, 'Recliner'), (1, 9, 'AVAILABLE', 200, 'Normal'),
(1, 10, 'BOOKED', 200, 'Normal'), (1, 11, 'AVAILABLE', 200, 'Normal'), (1, 12, 'BOOKED', 200, 'Normal'),
(1, 13, 'AVAILABLE', 200, 'Normal'), (1, 14, 'AVAILABLE', 200, 'Normal'), (1, 15, 'BOOKED', 200, 'Normal'),
(1, 16, 'AVAILABLE', 400, 'Recliner'), (1, 17, 'BOOKED', 400, 'Recliner'), (1, 18, 'AVAILABLE', 400, 'Recliner'),
(1, 19, 'AVAILABLE', 200, 'Normal'), (1, 20, 'BOOKED', 200, 'Normal'), (1, 21, 'AVAILABLE', 200, 'Normal'),
(1, 22, 'BOOKED', 200, 'Normal'), (1, 23, 'AVAILABLE', 200, 'Normal'), (1, 24, 'AVAILABLE', 200, 'Normal'),
(1, 25, 'BOOKED', 200, 'Normal'), (1, 26, 'AVAILABLE', 400, 'Recliner'), (1, 27, 'BOOKED', 400, 'Recliner'),
(1, 28, 'AVAILABLE', 400, 'Recliner'), (1, 29, 'AVAILABLE', 200, 'Normal'), (1, 30, 'BOOKED', 200, 'Normal'),
(1, 31, 'AVAILABLE', 200, 'Normal'), (1, 32, 'BOOKED', 200, 'Normal'), (1, 33, 'AVAILABLE', 200, 'Normal'),
(1, 34, 'AVAILABLE', 200, 'Normal'), (1, 35, 'BOOKED', 200, 'Normal'), (1, 36, 'AVAILABLE', 400, 'Recliner'),
(1, 37, 'BOOKED', 400, 'Recliner'), (1, 38, 'AVAILABLE', 400, 'Recliner'), (1, 39, 'AVAILABLE', 200, 'Normal'),
(1, 40, 'BOOKED', 200, 'Normal'), (1, 41, 'AVAILABLE', 200, 'Normal'), (1, 42, 'BOOKED', 200, 'Normal'),
(1, 43, 'AVAILABLE', 200, 'Normal'), (1, 44, 'AVAILABLE', 200, 'Normal'), (1, 45, 'BOOKED', 200, 'Normal'),
(1, 46, 'AVAILABLE', 400, 'Recliner'), (1, 47, 'BOOKED', 400, 'Recliner'), (1, 48, 'AVAILABLE', 400, 'Recliner'),
(1, 49, 'AVAILABLE', 200, 'Normal'), (1, 50, 'BOOKED', 200, 'Normal');

-- Show 2: Majority recliner seats with some normal seats
INSERT INTO seatlist (seat_id, seat_num, status, price, type) VALUES
(2, 1, 'AVAILABLE', 400, 'Recliner'), (2, 2, 'BOOKED', 400, 'Recliner'), (2, 3, 'AVAILABLE', 400, 'Recliner'),
(2, 4, 'BOOKED', 400, 'Recliner'), (2, 5, 'AVAILABLE', 400, 'Recliner'), (2, 6, 'AVAILABLE', 400, 'Recliner'),
(2, 7, 'BOOKED', 400, 'Recliner'), (2, 8, 'AVAILABLE', 400, 'Recliner'), (2, 9, 'AVAILABLE', 250, 'Normal'),
(2, 10, 'BOOKED', 250, 'Normal'), (2, 11, 'AVAILABLE', 400, 'Recliner'), (2, 12, 'BOOKED', 400, 'Recliner'),
(2, 13, 'AVAILABLE', 400, 'Recliner'), (2, 14, 'AVAILABLE', 400, 'Recliner'), (2, 15, 'BOOKED', 400, 'Recliner'),
(2, 16, 'AVAILABLE', 400, 'Recliner'), (2, 17, 'BOOKED', 400, 'Recliner'), (2, 18, 'AVAILABLE', 400, 'Recliner'),
(2, 19, 'AVAILABLE', 250, 'Normal'), (2, 20, 'BOOKED', 250, 'Normal'), (2, 21, 'AVAILABLE', 400, 'Recliner'),
(2, 22, 'BOOKED', 400, 'Recliner'), (2, 23, 'AVAILABLE', 400, 'Recliner'), (2, 24, 'AVAILABLE', 400, 'Recliner'),
(2, 25, 'BOOKED', 400, 'Recliner'), (2, 26, 'AVAILABLE', 400, 'Recliner'), (2, 27, 'BOOKED', 400, 'Recliner'),
(2, 28, 'AVAILABLE', 400, 'Recliner'), (2, 29, 'AVAILABLE', 250, 'Normal'), (2, 30, 'BOOKED', 250, 'Normal'),
(2, 31, 'AVAILABLE', 400, 'Recliner'), (2, 32, 'BOOKED', 400, 'Recliner'), (2, 33, 'AVAILABLE', 400, 'Recliner'),
(2, 34, 'AVAILABLE', 400, 'Recliner'), (2, 35, 'BOOKED', 400, 'Recliner'), (2, 36, 'AVAILABLE', 400, 'Recliner'),
(2, 37, 'BOOKED', 400, 'Recliner'), (2, 38, 'AVAILABLE', 400, 'Recliner'), (2, 39, 'AVAILABLE', 250, 'Normal'),
(2, 40, 'BOOKED', 250, 'Normal'), (2, 41, 'AVAILABLE', 400, 'Recliner'), (2, 42, 'BOOKED', 400, 'Recliner'),
(2, 43, 'AVAILABLE', 400, 'Recliner'), (2, 44, 'AVAILABLE', 400, 'Recliner'), (2, 45, 'BOOKED', 400, 'Recliner'),
(2, 46, 'AVAILABLE', 400, 'Recliner'), (2, 47, 'BOOKED', 400, 'Recliner'), (2, 48, 'AVAILABLE', 400, 'Recliner'),
(2, 49, 'AVAILABLE', 250, 'Normal'), (2, 50, 'BOOKED', 250, 'Normal');

-- Show 3: All normal seats with varied pricing
INSERT INTO seatlist (seat_id, seat_num, status, price, type) VALUES
(3, 1, 'AVAILABLE', 150, 'Normal'), (3, 2, 'AVAILABLE', 150, 'Normal'), (3, 3, 'BOOKED', 150, 'Normal'),
(3, 4, 'AVAILABLE', 150, 'Normal'), (3, 5, 'BOOKED', 150, 'Normal'), (3, 6, 'AVAILABLE', 150, 'Normal'),
(3, 7, 'AVAILABLE', 150, 'Normal'), (3, 8, 'BOOKED', 150, 'Normal'), (3, 9, 'AVAILABLE', 150, 'Normal'),
(3, 10, 'AVAILABLE', 150, 'Normal'), (3, 11, 'BOOKED', 180, 'Normal'), (3, 12, 'AVAILABLE', 180, 'Normal'),
(3, 13, 'AVAILABLE', 180, 'Normal'), (3, 14, 'BOOKED', 180, 'Normal'), (3, 15, 'AVAILABLE', 180, 'Normal'),
(3, 16, 'AVAILABLE', 180, 'Normal'), (3, 17, 'BOOKED', 180, 'Normal'), (3, 18, 'AVAILABLE', 180, 'Normal'),
(3, 19, 'AVAILABLE', 180, 'Normal'), (3, 20, 'BOOKED', 180, 'Normal'), (3, 21, 'AVAILABLE', 200, 'Normal'),
(3, 22, 'BOOKED', 200, 'Normal'), (3, 23, 'AVAILABLE', 200, 'Normal'), (3, 24, 'AVAILABLE', 200, 'Normal'),
(3, 25, 'BOOKED', 200, 'Normal'), (3, 26, 'AVAILABLE', 200, 'Normal'), (3, 27, 'AVAILABLE', 200, 'Normal'),
(3, 28, 'BOOKED', 200, 'Normal'), (3, 29, 'AVAILABLE', 200, 'Normal'), (3, 30, 'AVAILABLE', 200, 'Normal'),
(3, 31, 'BOOKED', 200, 'Normal'), (3, 32, 'AVAILABLE', 200, 'Normal'), (3, 33, 'AVAILABLE', 200, 'Normal'),
(3, 34, 'BOOKED', 200, 'Normal'), (3, 35, 'AVAILABLE', 200, 'Normal'), (3, 36, 'AVAILABLE', 200, 'Normal'),
(3, 37, 'BOOKED', 200, 'Normal'), (3, 38, 'AVAILABLE', 200, 'Normal'), (3, 39, 'AVAILABLE', 200, 'Normal'),
(3, 40, 'BOOKED', 200, 'Normal'), (3, 41, 'AVAILABLE', 200, 'Normal'), (3, 42, 'AVAILABLE', 200, 'Normal'),
(3, 43, 'BOOKED', 200, 'Normal'), (3, 44, 'AVAILABLE', 200, 'Normal'), (3, 45, 'AVAILABLE', 200, 'Normal'),
(3, 46, 'BOOKED', 200, 'Normal'), (3, 47, 'AVAILABLE', 200, 'Normal'), (3, 48, 'AVAILABLE', 200, 'Normal'),
(3, 49, 'BOOKED', 200, 'Normal'), (3, 50, 'AVAILABLE', 200, 'Normal');

-- Show 4: Mixed seating with varied pricing
INSERT INTO seatlist (seat_id, seat_num, status, price, type) VALUES
(4, 1, 'AVAILABLE', 180, 'Normal'), (4, 2, 'BOOKED', 180, 'Normal'), (4, 3, 'AVAILABLE', 180, 'Normal'),
(4, 4, 'AVAILABLE', 180, 'Normal'), (4, 5, 'BOOKED', 180, 'Normal'), (4, 6, 'AVAILABLE', 180, 'Normal'),
(4, 7, 'AVAILABLE', 400, 'Recliner'), (4, 8, 'BOOKED', 400, 'Recliner'), (4, 9, 'AVAILABLE', 400, 'Recliner'),
(4, 10, 'BOOKED', 400, 'Recliner'), (4, 11, 'AVAILABLE', 180, 'Normal'), (4, 12, 'BOOKED', 180, 'Normal'),
(4, 13, 'AVAILABLE', 180, 'Normal'), (4, 14, 'AVAILABLE', 180, 'Normal'), (4, 15, 'BOOKED', 180, 'Normal'),
(4, 16, 'AVAILABLE', 400, 'Recliner'), (4, 17, 'BOOKED', 400, 'Recliner'), (4, 18, 'AVAILABLE', 400, 'Recliner'),
(4, 19, 'AVAILABLE', 400, 'Recliner'), (4, 20, 'BOOKED', 400, 'Recliner'), (4, 21, 'AVAILABLE', 180, 'Normal'),
(4, 22, 'BOOKED', 180, 'Normal'), (4, 23, 'AVAILABLE', 180, 'Normal'), (4, 24, 'AVAILABLE', 180, 'Normal'),
(4, 25, 'BOOKED', 180, 'Normal'), (4, 26, 'AVAILABLE', 400, 'Recliner'), (4, 27, 'BOOKED', 400, 'Recliner'),
(4, 28, 'AVAILABLE', 400, 'Recliner'), (4, 29, 'AVAILABLE', 400, 'Recliner'), (4, 30, 'BOOKED', 400, 'Recliner'),
(4, 31, 'AVAILABLE', 180, 'Normal'), (4, 32, 'BOOKED', 180, 'Normal'), (4, 33, 'AVAILABLE', 180, 'Normal'),
(4, 34, 'AVAILABLE', 180, 'Normal'), (4, 35, 'BOOKED', 180, 'Normal'), (4, 36, 'AVAILABLE', 400, 'Recliner'),
(4, 37, 'BOOKED', 400, 'Recliner'), (4, 38, 'AVAILABLE', 400, 'Recliner'), (4, 39, 'AVAILABLE', 400, 'Recliner'), (4, 40, 'BOOKED', 400, 'Recliner'), (4, 41, 'AVAILABLE', 180, 'Normal'),
(4, 42, 'BOOKED', 180, 'Normal'), (4, 43, 'AVAILABLE', 180, 'Normal'), (4, 44, 'AVAILABLE', 180, 'Normal'),
(4, 45, 'BOOKED', 180, 'Normal'), (4, 46, 'AVAILABLE', 400, 'Recliner'), (4, 47, 'BOOKED', 400, 'Recliner'),
(4, 48, 'AVAILABLE', 400, 'Recliner'), (4, 49, 'AVAILABLE', 400, 'Recliner'), (4, 50, 'BOOKED', 400, 'Recliner');

-- Show 5: Alternating normal and recliner seats
INSERT INTO seatlist (seat_id, seat_num, status, price, type) VALUES
(5, 1, 'AVAILABLE', 200, 'Normal'), (5, 2, 'BOOKED', 450, 'Recliner'), (5, 3, 'AVAILABLE', 200, 'Normal'),
(5, 4, 'AVAILABLE', 450, 'Recliner'), (5, 5, 'BOOKED', 200, 'Normal'), (5, 6, 'AVAILABLE', 450, 'Recliner'),
(5, 7, 'BOOKED', 200, 'Normal'), (5, 8, 'AVAILABLE', 450, 'Recliner'), (5, 9, 'AVAILABLE', 200, 'Normal'),
(5, 10, 'BOOKED', 450, 'Recliner'), (5, 11, 'AVAILABLE', 200, 'Normal'), (5, 12, 'BOOKED', 450, 'Recliner'),
(5, 13, 'AVAILABLE', 200, 'Normal'), (5, 14, 'AVAILABLE', 450, 'Recliner'), (5, 15, 'BOOKED', 200, 'Normal'),
(5, 16, 'AVAILABLE', 450, 'Recliner'), (5, 17, 'BOOKED', 200, 'Normal'), (5, 18, 'AVAILABLE', 450, 'Recliner'),
(5, 19, 'AVAILABLE', 200, 'Normal'), (5, 20, 'BOOKED', 450, 'Recliner'), (5, 21, 'AVAILABLE', 200, 'Normal'),
(5, 22, 'BOOKED', 450, 'Recliner'), (5, 23, 'AVAILABLE', 200, 'Normal'), (5, 24, 'AVAILABLE', 450, 'Recliner'),
(5, 25, 'BOOKED', 200, 'Normal'), (5, 26, 'AVAILABLE', 450, 'Recliner'), (5, 27, 'BOOKED', 200, 'Normal'),
(5, 28, 'AVAILABLE', 450, 'Recliner'), (5, 29, 'AVAILABLE', 200, 'Normal'), (5, 30, 'BOOKED', 450, 'Recliner'),
(5, 31, 'AVAILABLE', 200, 'Normal'), (5, 32, 'BOOKED', 450, 'Recliner'), (5, 33, 'AVAILABLE', 200, 'Normal'),
(5, 34, 'AVAILABLE', 450, 'Recliner'), (5, 35, 'BOOKED', 200, 'Normal'), (5, 36, 'AVAILABLE', 450, 'Recliner'),
(5, 37, 'BOOKED', 200, 'Normal'), (5, 38, 'AVAILABLE', 450, 'Recliner'), (5, 39, 'AVAILABLE', 200, 'Normal'),
(5, 40, 'BOOKED', 450, 'Recliner'), (5, 41, 'AVAILABLE', 200, 'Normal'), (5, 42, 'BOOKED', 450, 'Recliner'),
(5, 43, 'AVAILABLE', 200, 'Normal'), (5, 44, 'AVAILABLE', 450, 'Recliner'), (5, 45, 'BOOKED', 200, 'Normal'),
(5, 46, 'AVAILABLE', 450, 'Recliner'), (5, 47, 'BOOKED', 200, 'Normal'), (5, 48, 'AVAILABLE', 450, 'Recliner'),
(5, 49, 'AVAILABLE', 200, 'Normal'), (5, 50, 'BOOKED', 450, 'Recliner');

-- Show 6: Premium show with higher prices
INSERT INTO seatlist (seat_id, seat_num, status, price, type) VALUES
(6, 1, 'AVAILABLE', 300, 'Normal'), (6, 2, 'BOOKED', 300, 'Normal'), (6, 3, 'AVAILABLE', 300, 'Normal'),
(6, 4, 'AVAILABLE', 300, 'Normal'), (6, 5, 'BOOKED', 300, 'Normal'), (6, 6, 'AVAILABLE', 600, 'Recliner'),
(6, 7, 'BOOKED', 600, 'Recliner'), (6, 8, 'AVAILABLE', 600, 'Recliner'), (6, 9, 'AVAILABLE', 300, 'Normal'),
(6, 10, 'BOOKED', 300, 'Normal'), (6, 11, 'AVAILABLE', 300, 'Normal'), (6, 12, 'BOOKED', 300, 'Normal'),
(6, 13, 'AVAILABLE', 300, 'Normal'), (6, 14, 'AVAILABLE', 300, 'Normal'), (6, 15, 'BOOKED', 300, 'Normal'),
(6, 16, 'AVAILABLE', 600, 'Recliner'), (6, 17, 'BOOKED', 600, 'Recliner'), (6, 18, 'AVAILABLE', 600, 'Recliner'),
(6, 19, 'AVAILABLE', 300, 'Normal'), (6, 20, 'BOOKED', 300, 'Normal'), (6, 21, 'AVAILABLE', 300, 'Normal'),
(6, 22, 'BOOKED', 300, 'Normal'), (6, 23, 'AVAILABLE', 300, 'Normal'), (6, 24, 'AVAILABLE', 300, 'Normal'),
(6, 25, 'BOOKED', 300, 'Normal'), (6, 26, 'AVAILABLE', 600, 'Recliner'), (6, 27, 'BOOKED', 600, 'Recliner'),
(6, 28, 'AVAILABLE', 600, 'Recliner'), (6, 29, 'AVAILABLE', 300, 'Normal'), (6, 30, 'BOOKED', 300, 'Normal'),
(6, 31, 'AVAILABLE', 300, 'Normal'), (6, 32, 'BOOKED', 300, 'Normal'), (6, 33, 'AVAILABLE', 300, 'Normal'),
(6, 34, 'AVAILABLE', 300, 'Normal'), (6, 35, 'BOOKED', 300, 'Normal'), (6, 36, 'AVAILABLE', 600, 'Recliner'),
(6, 37, 'BOOKED', 600, 'Recliner'), (6, 38, 'AVAILABLE', 600, 'Recliner'), (6, 39, 'AVAILABLE', 300, 'Normal'),
(6, 40, 'BOOKED', 300, 'Normal'), (6, 41, 'AVAILABLE', 300, 'Normal'), (6, 42, 'BOOKED', 300, 'Normal'),
(6, 43, 'AVAILABLE', 300, 'Normal'), (6, 44, 'AVAILABLE', 300, 'Normal'), (6, 45, 'BOOKED', 300, 'Normal'),
(6, 46, 'AVAILABLE', 600, 'Recliner'), (6, 47, 'BOOKED', 600, 'Recliner'), (6, 48, 'AVAILABLE', 600, 'Recliner'),
(6, 49, 'AVAILABLE', 300, 'Normal'), (6, 50, 'BOOKED', 300, 'Normal');

-- Show 7: Budget show with lower prices
INSERT INTO seatlist (seat_id, seat_num, status, price, type) VALUES
(7, 1, 'AVAILABLE', 120, 'Normal'), (7, 2, 'BOOKED', 120, 'Normal'), (7, 3, 'AVAILABLE', 120, 'Normal'),
(7, 4, 'AVAILABLE', 120, 'Normal'), (7, 5, 'BOOKED', 120, 'Normal'), (7, 6, 'AVAILABLE', 250, 'Recliner'),
(7, 7, 'BOOKED', 250, 'Recliner'), (7, 8, 'AVAILABLE', 250, 'Recliner'), (7, 9, 'AVAILABLE', 120, 'Normal'),
(7, 10, 'BOOKED', 120, 'Normal'), (7, 11, 'AVAILABLE', 120, 'Normal'), (7, 12, 'BOOKED', 120, 'Normal'),
(7, 13, 'AVAILABLE', 120, 'Normal'), (7, 14, 'AVAILABLE', 120, 'Normal'), (7, 15, 'BOOKED', 120, 'Normal'),
(7, 16, 'AVAILABLE', 250, 'Recliner'), (7, 17, 'BOOKED', 250, 'Recliner'), (7, 18, 'AVAILABLE', 250, 'Recliner'),
(7, 19, 'AVAILABLE', 120, 'Normal'), (7, 20, 'BOOKED', 120, 'Normal'), (7, 21, 'AVAILABLE', 120, 'Normal'),
(7, 22, 'BOOKED', 120, 'Normal'), (7, 23, 'AVAILABLE', 120, 'Normal'), (7, 24, 'AVAILABLE', 120, 'Normal'),
(7, 25, 'BOOKED', 120, 'Normal'), (7, 26, 'AVAILABLE', 250, 'Recliner'), (7, 27, 'BOOKED', 250, 'Recliner'),
(7, 28, 'AVAILABLE', 250, 'Recliner'), (7, 29, 'AVAILABLE', 120, 'Normal'), (7, 30, 'BOOKED', 120, 'Normal'),
(7, 31, 'AVAILABLE', 120, 'Normal'), (7, 32, 'BOOKED', 120, 'Normal'), (7, 33, 'AVAILABLE', 120, 'Normal'),
(7, 34, 'AVAILABLE', 120, 'Normal'), (7, 35, 'BOOKED', 120, 'Normal'), (7, 36, 'AVAILABLE', 250, 'Recliner'),
(7, 37, 'BOOKED', 250, 'Recliner'), (7, 38, 'AVAILABLE', 250, 'Recliner'), (7, 39, 'AVAILABLE', 120, 'Normal'),
(7, 40, 'BOOKED', 120, 'Normal'), (7, 41, 'AVAILABLE', 120, 'Normal'), (7, 42, 'BOOKED', 120, 'Normal'),
(7, 43, 'AVAILABLE', 120, 'Normal'), (7, 44, 'AVAILABLE', 120, 'Normal'), (7, 45, 'BOOKED', 120, 'Normal'),
(7, 46, 'AVAILABLE', 250, 'Recliner'), (7, 47, 'BOOKED', 250, 'Recliner'), (7, 48, 'AVAILABLE', 250, 'Recliner'),
(7, 49, 'AVAILABLE', 120, 'Normal'), (7, 50, 'BOOKED', 120, 'Normal');

-- Show 8: All recliner seats
INSERT INTO seatlist (seat_id, seat_num, status, price, type) VALUES
(8, 1, 'AVAILABLE', 500, 'Recliner'), (8, 2, 'BOOKED', 500, 'Recliner'), (8, 3, 'AVAILABLE', 500, 'Recliner'),
(8, 4, 'AVAILABLE', 500, 'Recliner'), (8, 5, 'BOOKED', 500, 'Recliner'), (8, 6, 'AVAILABLE', 500, 'Recliner'),
(8, 7, 'BOOKED', 500, 'Recliner'), (8, 8, 'AVAILABLE', 500, 'Recliner'), (8, 9, 'AVAILABLE', 500, 'Recliner'),
(8, 10, 'BOOKED', 500, 'Recliner'), (8, 11, 'AVAILABLE', 500, 'Recliner'), (8, 12, 'BOOKED', 500, 'Recliner'),
(8, 13, 'AVAILABLE', 500, 'Recliner'), (8, 14, 'AVAILABLE', 500, 'Recliner'), (8, 15, 'BOOKED', 500, 'Recliner'),
(8, 16, 'AVAILABLE', 500, 'Recliner'), (8, 17, 'BOOKED', 500, 'Recliner'), (8, 18, 'AVAILABLE', 500, 'Recliner'),
(8, 19, 'AVAILABLE', 500, 'Recliner'), (8, 20, 'BOOKED', 500, 'Recliner'), (8, 21, 'AVAILABLE', 500, 'Recliner'),
(8, 22, 'BOOKED', 500, 'Recliner'), (8, 23, 'AVAILABLE', 500, 'Recliner'), (8, 24, 'AVAILABLE', 500, 'Recliner'),
(8, 25, 'BOOKED', 500, 'Recliner'), (8, 26, 'AVAILABLE', 500, 'Recliner'), (8, 27, 'BOOKED', 500, 'Recliner'),
(8, 28, 'AVAILABLE', 500, 'Recliner'), (8, 29, 'AVAILABLE', 500, 'Recliner'),
(8, 30, 'BOOKED', 500, 'Recliner'), (8, 31, 'AVAILABLE', 500, 'Recliner'), (8, 32, 'BOOKED', 500, 'Recliner'),
(8, 33, 'AVAILABLE', 500, 'Recliner'), (8, 34, 'AVAILABLE', 500, 'Recliner'), (8, 35, 'BOOKED', 500, 'Recliner'),
(8, 36, 'AVAILABLE', 500, 'Recliner'), (8, 37, 'BOOKED', 500, 'Recliner'), (8, 38, 'AVAILABLE', 500, 'Recliner'),
(8, 39, 'AVAILABLE', 500, 'Recliner'), (8, 40, 'BOOKED', 500, 'Recliner'), (8, 41, 'AVAILABLE', 500, 'Recliner'),
(8, 42, 'BOOKED', 500, 'Recliner'), (8, 43, 'AVAILABLE', 500, 'Recliner'), (8, 44, 'AVAILABLE', 500, 'Recliner'),
(8, 45, 'BOOKED', 500, 'Recliner'), (8, 46, 'AVAILABLE', 500, 'Recliner'), (8, 47, 'BOOKED', 500, 'Recliner'),
(8, 48, 'AVAILABLE', 500, 'Recliner'), (8, 49, 'AVAILABLE', 500, 'Recliner'), (8, 50, 'BOOKED', 500, 'Recliner');

-- Show 9: Mixed seating with more normal seats
INSERT INTO seatlist (seat_id, seat_num, status, price, type) VALUES
(9, 1, 'AVAILABLE', 220, 'Normal'), (9, 2, 'BOOKED', 220, 'Normal'), (9, 3, 'AVAILABLE', 220, 'Normal'),
(9, 4, 'AVAILABLE', 220, 'Normal'), (9, 5, 'BOOKED', 220, 'Normal'), (9, 6, 'AVAILABLE', 220, 'Normal'),
(9, 7, 'BOOKED', 220, 'Normal'), (9, 8, 'AVAILABLE', 220, 'Normal'), (9, 9, 'AVAILABLE', 220, 'Normal'),
(9, 10, 'BOOKED', 220, 'Normal'), (9, 11, 'AVAILABLE', 450, 'Recliner'), (9, 12, 'BOOKED', 450, 'Recliner'),
(9, 13, 'AVAILABLE', 450, 'Recliner'), (9, 14, 'AVAILABLE', 450, 'Recliner'), (9, 15, 'BOOKED', 450, 'Recliner'),
(9, 16, 'AVAILABLE', 220, 'Normal'), (9, 17, 'BOOKED', 220, 'Normal'), (9, 18, 'AVAILABLE', 220, 'Normal'),
(9, 19, 'AVAILABLE', 220, 'Normal'), (9, 20, 'BOOKED', 220, 'Normal'), (9, 21, 'AVAILABLE', 220, 'Normal'),
(9, 22, 'BOOKED', 220, 'Normal'), (9, 23, 'AVAILABLE', 220, 'Normal'), (9, 24, 'AVAILABLE', 220, 'Normal'),
(9, 25, 'BOOKED', 220, 'Normal'), (9, 26, 'AVAILABLE', 450, 'Recliner'), (9, 27, 'BOOKED', 450, 'Recliner'),
(9, 28, 'AVAILABLE', 450, 'Recliner'), (9, 29, 'AVAILABLE', 450, 'Recliner'), (9, 30, 'BOOKED', 450, 'Recliner'),
(9, 31, 'AVAILABLE', 220, 'Normal'), (9, 32, 'BOOKED', 220, 'Normal'), (9, 33, 'AVAILABLE', 220, 'Normal'),
(9, 34, 'AVAILABLE', 220, 'Normal'), (9, 35, 'BOOKED', 220, 'Normal'), (9, 36, 'AVAILABLE', 220, 'Normal'),
(9, 37, 'BOOKED', 220, 'Normal'), (9, 38, 'AVAILABLE', 220, 'Normal'), (9, 39, 'AVAILABLE', 220, 'Normal'),
(9, 40, 'BOOKED', 220, 'Normal'), (9, 41, 'AVAILABLE', 450, 'Recliner'), (9, 42, 'BOOKED', 450, 'Recliner'),
(9, 43, 'AVAILABLE', 450, 'Recliner'), (9, 44, 'AVAILABLE', 450, 'Recliner'), (9, 45, 'BOOKED', 450, 'Recliner'),
(9, 46, 'AVAILABLE', 220, 'Normal'), (9, 47, 'BOOKED', 220, 'Normal'), (9, 48, 'AVAILABLE', 220, 'Normal'),
(9, 49, 'AVAILABLE', 220, 'Normal'), (9, 50, 'BOOKED', 220, 'Normal');

-- Show 10: Mixed seating with varied pricing
INSERT INTO seatlist (seat_id, seat_num, status, price, type) VALUES
(10, 1, 'AVAILABLE', 180, 'Normal'), (10, 2, 'BOOKED', 180, 'Normal'), (10, 3, 'AVAILABLE', 180, 'Normal'),
(10, 4, 'AVAILABLE', 180, 'Normal'), (10, 5, 'BOOKED', 180, 'Normal'), (10, 6, 'AVAILABLE', 420, 'Recliner'),
(10, 7, 'BOOKED', 420, 'Recliner'), (10, 8, 'AVAILABLE', 420, 'Recliner'), (10, 9, 'AVAILABLE', 180, 'Normal'),
(10, 10, 'BOOKED', 180, 'Normal'), (10, 11, 'AVAILABLE', 180, 'Normal'), (10, 12, 'BOOKED', 180, 'Normal'),
(10, 13, 'AVAILABLE', 180, 'Normal'), (10, 14, 'AVAILABLE', 180, 'Normal'), (10, 15, 'BOOKED', 180, 'Normal'),
(10, 16, 'AVAILABLE', 420, 'Recliner'), (10, 17, 'BOOKED', 420, 'Recliner'), (10, 18, 'AVAILABLE', 420, 'Recliner'),
(10, 19, 'AVAILABLE', 180, 'Normal'), (10, 20, 'BOOKED', 180, 'Normal'), (10, 21, 'AVAILABLE', 180, 'Normal'),
(10, 22, 'BOOKED', 180, 'Normal'), (10, 23, 'AVAILABLE', 180, 'Normal'), (10, 24, 'AVAILABLE', 180, 'Normal'),
(10, 25, 'BOOKED', 180, 'Normal'), (10, 26, 'AVAILABLE', 420, 'Recliner'), (10, 27, 'BOOKED', 420, 'Recliner'),
(10, 28, 'AVAILABLE', 420, 'Recliner'), (10, 29, 'AVAILABLE', 180, 'Normal'), (10, 30, 'BOOKED', 180, 'Normal'),
(10, 31, 'AVAILABLE', 180, 'Normal'), (10, 32, 'BOOKED', 180, 'Normal'), (10, 33, 'AVAILABLE', 180, 'Normal'),
(10, 34, 'AVAILABLE', 180, 'Normal'), (10, 35, 'BOOKED', 180, 'Normal'), (10, 36, 'AVAILABLE', 420, 'Recliner'),
(10, 37, 'BOOKED', 420, 'Recliner'), (10, 38, 'AVAILABLE', 420, 'Recliner'), (10, 39, 'AVAILABLE', 180, 'Normal'),
(10, 40, 'BOOKED', 180, 'Normal'), (10, 41, 'AVAILABLE', 180, 'Normal'), (10, 42, 'BOOKED', 180, 'Normal'),
(10, 43, 'AVAILABLE', 180, 'Normal'), (10, 44, 'AVAILABLE', 180, 'Normal'), (10, 45, 'BOOKED', 180, 'Normal'),
(10, 46, 'AVAILABLE', 420, 'Recliner'), (10, 47, 'BOOKED', 420, 'Recliner'), (10, 48, 'AVAILABLE', 420, 'Recliner'),
(10, 49, 'AVAILABLE', 180, 'Normal'), (10, 50, 'BOOKED', 180, 'Normal');

COMMIT;

select*from seatlist;
select*from seat;