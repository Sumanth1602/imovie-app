DROP SCHEMA IF EXISTS theatre_db;
CREATE SCHEMA theatre_db;
USE theatre_db;

CREATE TABLE theatre (
    theatre_id INT AUTO_INCREMENT PRIMARY KEY,
    theatre_name VARCHAR(255) NOT NULL,
    theatre_location VARCHAR(255) NOT NULL
);

CREATE TABLE shows (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL,
    timings DATETIME NOT NULL,
    seat_id INT NOT NULL,
    theatre_id INT,
    FOREIGN KEY (theatre_id)
    REFERENCES theatre(theatre_id) ON DELETE CASCADE
);


-- First, let's insert some theatres
INSERT INTO theatre (theatre_name, theatre_location) VALUES
('Starlight Cinema', 'Downtown'),
('Metroplex', 'Suburbs'),
('Majestic Theatre', 'City Center'),
('Silver Screen Pavilion', 'Waterfront'),
('Quantum Theatres', 'Tech District'),
('Neon Dreams Cinema', 'Arts District'),
('Galactic View IMAX', 'Shopping Mall'),
('Retro Reel Theatre', 'Old Town'),
('Future Flix', 'University Campus'),
('Cine-Magic Experience', 'Entertainment Complex');

-- Now, let's insert shows for these theatres
INSERT INTO shows (movie_name, timings, seat_id, theatre_id) VALUES
-- Starlight Cinema (theatre_id 1)
('Quantum Horizon', '2024-09-09 14:00:00', 101, 1),
('Neon Nights', '2024-09-09 17:30:00', 102, 1),
('Whispers of Eternity', '2024-09-09 20:00:00', 103, 1),
('Crimson Tides', '2024-09-10 15:00:00', 104, 1),
('Echoes of Tomorrow', '2024-09-10 18:30:00', 105, 1),

-- Metroplex (theatre_id 2)
('Shadows of the Past', '2024-09-09 16:00:00', 201, 2),
('Galactic Embers', '2024-09-09 19:30:00', 202, 2),
('Winds of Change', '2024-09-10 14:30:00', 203, 2),
('Midnight Serenade', '2024-09-10 17:00:00', 204, 2),
('Digital Dreamscape', '2024-09-10 20:30:00', 205, 2),

-- Majestic Theatre (theatre_id 3)
('Eternal Bloom', '2024-09-09 15:30:00', 301, 3),
('Neon Samurai', '2024-09-09 18:45:00', 302, 3),
('Whispers in the Wind', '2024-09-10 16:15:00', 303, 3),
('Lunar Legends', '2024-09-10 19:45:00', 304, 3),
('Codebreaker''s Gambit', '2024-09-11 17:30:00', 305, 3),

-- Silver Screen Pavilion (theatre_id 4)
('Rhythms of the Heart', '2024-09-09 14:15:00', 401, 4),
('Quantum Heist', '2024-09-09 17:45:00', 402, 4),
('Echoes of Atlantis', '2024-09-10 15:30:00', 403, 4),
('Starborn Legacy', '2024-09-10 19:00:00', 404, 4),
('Whispers of the Forest', '2024-09-11 18:15:00', 405, 4),

-- Quantum Theatres (theatre_id 5)
('Neon Ronin', '2024-09-09 16:30:00', 501, 5),
('Echoes of Revolution', '2024-09-09 20:00:00', 502, 5),
('Quantum Paradox', '2024-09-10 14:00:00', 503, 5),
('Celestial Harmony', '2024-09-10 17:30:00', 504, 5),
('Digital Nomad', '2024-09-11 19:45:00', 505, 5),

-- Neon Dreams Cinema (theatre_id 6)
('Echoes of Eternity', '2024-09-09 15:00:00', 601, 6),
('Neon Pharaoh', '2024-09-09 18:30:00', 602, 6),
('Whispers of the Void', '2024-09-10 16:45:00', 603, 6),
('Quantum Circus', '2024-09-10 20:15:00', 604, 6),
('Cyber Samurai', '2024-09-11 17:00:00', 605, 6),

-- Galactic View IMAX (theatre_id 7)
('Echoes of the Cosmos', '2024-09-09 14:30:00', 701, 7),
('Neon Oasis', '2024-09-09 18:00:00', 702, 7),
('Whispers of the Deep', '2024-09-10 15:45:00', 703, 7),
('Quantum Detective', '2024-09-10 19:30:00', 704, 7),
('Starlight Symphony', '2024-09-11 16:30:00', 705, 7),

-- Retro Reel Theatre (theatre_id 8)
('Echoes of Empire', '2024-09-09 16:15:00', 801, 8),
('Neon Shogun', '2024-09-09 19:45:00', 802, 8),
('Whispers of Rebellion', '2024-09-10 17:00:00', 803, 8),
('Quantum Pirate', '2024-09-10 20:30:00', 804, 8),
('Echoes of Avalon', '2024-09-11 18:45:00', 805, 8),

-- Future Flix (theatre_id 9)
('Neon Valkyrie', '2024-09-09 15:15:00', 901, 9),
('Whispers of the Ancients', '2024-09-09 18:45:00', 902, 9),
('Quantum Nexus', '2024-09-10 16:30:00', 903, 9),
('Celestial Forge', '2024-09-10 20:00:00', 904, 9),
('Echoes of Dystopia', '2024-09-11 17:45:00', 905, 9),

-- Cine-Magic Experience (theatre_id 10)
('Neon Samurai: Revenge', '2024-09-09 14:45:00', 1001, 10),
('Whispers of the Multiverse', '2024-09-09 18:15:00', 1002, 10),
('Quantum Ghost', '2024-09-10 15:00:00', 1003, 10),
('Galactic Rhapsody', '2024-09-10 19:30:00', 1004, 10),
('Echoes of Atlantis: Resurgence', '2024-09-11 16:15:00', 1005, 10);

-- Add some additional showtimes for popular movies
INSERT INTO shows (movie_name, timings, seat_id, theatre_id) VALUES
('Quantum Horizon', '2024-09-11 15:00:00', 106, 1),
('Neon Nights', '2024-09-11 18:30:00', 206, 2),
('Digital Dreamscape', '2024-09-11 14:45:00', 306, 3),
('Galactic Embers', '2024-09-11 19:15:00', 406, 4),
('Echoes of Tomorrow', '2024-09-11 16:00:00', 506, 5),
('Neon Ronin', '2024-09-11 20:30:00', 606, 6),
('Quantum Paradox', '2024-09-11 15:30:00', 706, 7),
('Whispers of the Void', '2024-09-11 19:00:00', 806, 8),
('Starborn Legacy', '2024-09-11 14:15:00', 906, 9),
('Neon Valkyrie', '2024-09-11 18:45:00', 1006, 10);

COMMIT;

select*from theatre;
select*from shows;