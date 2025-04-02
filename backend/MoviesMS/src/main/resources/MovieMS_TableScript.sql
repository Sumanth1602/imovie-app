DROP SCHEMA IF EXISTS movie_db;
CREATE SCHEMA movie_db;
USE movie_db;

CREATE TABLE movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL,
    img_url VARCHAR(255),
    release_date DATE,
    rating DOUBLE,
    censor_rating VARCHAR(10),
    description VARCHAR(255),
    genre JSON,
    languages JSON
);

INSERT INTO movie (movie_name, img_url, release_date, rating, censor_rating, description, genre, languages) VALUES
('Quantum Horizon', '../../assets/pos1.jpg', '2024-08-30', 4.5, 'PG-13', 'A team of scientists discovers a way to manipulate quantum reality, with unforeseen consequences.', '["Sci-Fi", "Thriller", "Drama"]', '["English", "Mandarin", "Spanish"]'),
('Neon Nights', '../../assets/pos2.jpg', '2024-09-06', 4.2, 'R', 'In a cyberpunk future, a hacker uncovers a conspiracy that threatens the entire city.', '["Action", "Sci-Fi", "Mystery"]', '["English", "Japanese", "Korean"]'),
('Whispers of Eternity', '../../assets/pos3.jpg', '2024-08-28', 4.0, 'PG', 'An archaeologist discovers an ancient artifact that allows communication with past civilizations.', '["Adventure", "Fantasy", "History"]', '["English", "Arabic", "French"]'),
('Crimson Tides', '../../assets/pos4.jpg', '2024-09-04', 3.8, 'R', 'A naval thriller about a submarine crew facing a mysterious threat in the depths of the ocean.', '["Action", "Thriller", "Drama"]', '["English", "Russian", "German"]'),
('Echoes of Tomorrow', '../../assets/pos5.jpg', '2024-08-27', 4.3, 'PG-13', 'A time traveler attempts to prevent a catastrophic event, but each change creates unforeseen ripples in the timeline.', '["Sci-Fi", "Drama", "Mystery"]', '["English", "French", "Chinese"]'),
('Shadows of the Past', '../../assets/pos1.jpg', '2024-09-03', 3.9, 'R', 'A detective with a troubled past investigates a series of murders linked to his own history.', '["Crime", "Thriller", "Mystery"]', '["English", "Italian", "Spanish"]'),
('Galactic Embers', '../../assets/pos2.jpg', '2024-08-29', 4.1, 'PG-13', 'The last survivors of Earth embark on a perilous journey to find a new home among the stars.', '["Sci-Fi", "Adventure", "Drama"]', '["English", "Russian", "Hindi"]'),
('Winds of Change', '../../assets/pos3.jpg', '2024-09-05', 3.7, 'PG', 'A heartwarming story about a small town coming together to overcome environmental challenges.', '["Drama", "Family", "Environment"]', '["English", "Spanish", "Portuguese"]'),
('Midnight Serenade', '../../assets/pos4.jpg', '2024-08-31', 4.0, 'PG-13', 'A jazz musician in 1950s New Orleans navigates love, race, and music in a changing world.', '["Drama", "Music", "Romance"]', '["English", "French", "Italian"]'),
('Digital Dreamscape', '../../assets/pos5.jpg', '2024-09-07', 4.4, 'PG-13', 'A programmer creates an AI that becomes self-aware, blurring the lines between reality and virtual worlds.', '["Sci-Fi", "Thriller", "Philosophy"]', '["English", "Japanese", "German"]'),
('Eternal Bloom', '../../assets/pos1.jpg', '2024-08-26', 3.9, 'PG', 'A botanist discovers a plant with miraculous healing properties, attracting both wonder and danger.', '["Drama", "Science", "Thriller"]', '["English", "Portuguese", "Mandarin"]'),
('Neon Samurai', '../../assets/pos2.jpg', '2024-09-02', 4.3, 'R', 'In a futuristic Tokyo, a cyber-enhanced samurai fights to protect his clan from rival factions.', '["Action", "Sci-Fi", "Martial Arts"]', '["Japanese", "English", "Mandarin"]'),
('Whispers in the Wind', '../../assets/pos3.jpg', '2024-08-25', 3.8, 'PG-13', 'A young girl discovers she can communicate with the wind, unraveling a mystery that threatens her village.', '["Fantasy", "Adventure", "Family"]', '["English", "Hindi", "Spanish"]'),
('Lunar Legends', '../../assets/pos4.jpg', '2024-09-01', 4.2, 'PG', 'The first lunar colony faces unexpected challenges when they uncover ancient alien ruins on the moon.', '["Sci-Fi", "Adventure", "Mystery"]', '["English", "Russian", "Chinese"]'),
('Codebreaker''s Gambit', '../../assets/pos5.jpg', '2024-08-28', 4.1, 'PG-13', 'A brilliant mathematician races against time to crack a code that could prevent a global catastrophe.', '["Thriller", "Drama", "Mystery"]', '["English", "German", "French"]'),
('Rhythms of the Heart', '../../assets/pos1.jpg', '2024-09-04', 3.7, 'PG', 'A deaf dancer struggles to pursue her passion while navigating personal relationships and societal expectations.', '["Drama", "Romance", "Music"]', '["English", "Sign Language", "Spanish"]'),
('Quantum Heist', '../../assets/pos2.jpg', '2024-08-30', 4.4, 'PG-13', 'A team of skilled thieves attempts to rob a highly secure vault using cutting-edge quantum technology.', '["Action", "Sci-Fi", "Heist"]', '["English", "Korean", "Russian"]'),
('Echoes of Atlantis', '../../assets/pos1.jpg', '2024-09-05', 4.0, 'PG-13', 'An oceanographer discovers evidence of the lost city of Atlantis, triggering a race to uncover its secrets.', '["Adventure", "Mystery", "History"]', '["English", "Greek", "Arabic"]'),
('Starborn Legacy', '../../assets/pos1.jpg', '2024-08-27', 4.3, 'PG-13', 'A young woman discovers she''s the last of an alien race and must protect Earth from an impending invasion.', '["Sci-Fi", "Action", "Drama"]', '["English", "Alien Language", "Japanese"]'),
('Whispers of the Forest', '../../assets/pos1.jpg', '2024-09-03', 3.9, 'PG', 'A nature photographer captures evidence of mythical creatures in an ancient forest, drawing unwanted attention.', '["Fantasy", "Adventure", "Environment"]', '["English", "Celtic", "French"]'),
('Neon Ronin', '../../assets/pos1.jpg', '2024-08-29', 4.2, 'R', 'A disgraced samurai seeks redemption in a dystopian future where traditional values clash with advanced technology.', '["Action", "Sci-Fi", "Drama"]', '["Japanese", "English", "Mandarin"]'),
('Echoes of Revolution', '../../assets/pos1.jpg', '2024-09-06', 4.1, 'PG-13', 'In a alternate history, the American Revolution failed, and a group of rebels fight to overthrow British rule in the modern day.', '["Action", "Drama", "History"]', '["English", "French", "Spanish"]'),
('Quantum Paradox', '../../assets/pos1.jpg', '2024-08-26', 4.5, 'PG-13', 'A physicist creates a device that allows communication with parallel universes, leading to unforeseen consequences.', '["Sci-Fi", "Thriller", "Mystery"]', '["English", "German", "Mandarin"]'),
('Celestial Harmony', '../../assets/pos1.jpg', '2024-09-02', 3.8, 'PG', 'A young prodigy composes a symphony that unexpectedly opens a portal to another dimension.', '["Fantasy", "Music", "Family"]', '["English", "Italian", "Russian"]'),
('Digital Nomad', '../../assets/pos1.jpg', '2024-08-28', 4.0, 'PG-13', 'A hacker living off the grid becomes entangled in a global conspiracy while trying to clear her name.', '["Thriller", "Drama", "Sci-Fi"]', '["English", "Spanish", "Hindi"]'),
('Echoes of Eternity', '../../assets/pos1.jpg', '2024-09-04', 4.2, 'PG-13', 'An immortal being struggles with the weight of centuries as they search for a way to end their eternal existence.', '["Drama", "Fantasy", "Philosophy"]', '["English", "Latin", "Arabic"]'),
('Neon Pharaoh', '../../assets/pos1.jpg', '2024-08-30', 4.3, 'PG-13', 'In a futuristic Egypt, a resurrected pharaoh grapples with modern technology and ancient prophecies.', '["Sci-Fi", "Adventure", "History"]', '["Arabic", "English", "Ancient Egyptian"]'),
('Whispers of the Void', '../../assets/pos1.jpg', '2024-09-05', 4.1, 'R', 'A space station crew investigates a mysterious signal from a nearby black hole, uncovering cosmic horrors.', '["Sci-Fi", "Horror", "Thriller"]', '["English", "Russian", "Mandarin"]'),
('Quantum Circus', '../../assets/pos1.jpg', '2024-08-27', 3.9, 'PG', 'A traveling circus uses quantum technology for its acts, but a malfunction threatens to tear reality apart.', '["Fantasy", "Sci-Fi", "Family"]', '["English", "French", "Spanish"]'),
('Cyber Samurai', '../../assets/pos1.jpg', '2024-09-03', 4.4, 'PG-13', 'In a world where martial arts and cybernetics have merged, a young prodigy must save her dojo from corporate takeover.', '["Action", "Sci-Fi", "Martial Arts"]', '["Japanese", "English", "Korean"]'),
('Echoes of the Cosmos', '../../assets/pos1.jpg', '2024-08-29', 4.2, 'PG-13', 'A deep space exploration team encounters an ancient alien artifact that holds the key to humanity''s origins.', '["Sci-Fi", "Adventure", "Mystery"]', '["English", "Russian", "Mandarin"]'),
('Neon Oasis', '../../assets/pos1.jpg', '2024-09-06', 3.8, 'PG-13', 'In a water-scarce future, a group of outcasts defend their hidden oasis from ruthless corporations and bandits.', '["Action", "Sci-Fi", "Western"]', '["English", "Arabic", "Spanish"]'),
('Whispers of the Deep', '../../assets/pos1.jpg', '2024-08-26', 4.0, 'PG-13', 'A team of marine biologists discover a lost underwater civilization while investigating strange oceanic phenomena.', '["Adventure", "Sci-Fi", "Mystery"]', '["English", "Greek", "Japanese"]'),
('Quantum Detective', '../../assets/pos1.jpg', '2024-09-02', 4.1, 'PG-13', 'A detective gains the ability to see quantum probabilities, using it to solve seemingly impossible cases.', '["Mystery", "Sci-Fi", "Crime"]', '["English", "German", "Mandarin"]'),
('Starlight Symphony', '../../assets/pos1.jpg', '2024-08-28', 3.9, 'PG', 'A young musician discovers that her music can influence the stars, leading to an intergalactic adventure.', '["Family", "Sci-Fi", "Music"]', '["English", "Italian", "Alien Languages"]'),
('Echoes of Empire', '../../assets/pos1.jpg', '2024-09-04', 4.3, 'PG-13', 'In a galaxy where Earth''s empire has fallen, a group of unlikely heroes must reunite humanity''s scattered colonies.', '["Sci-Fi", "Adventure", "Drama"]', '["English", "Mandarin", "Hindi"]'),
('Neon Shogun', '../../assets/pos1.jpg', '2024-08-30', 4.2, 'R', 'In a neo-feudal Japan, a rogue AI gains control of an army of robotic samurai, threatening to overthrow human rule.', '["Action", "Sci-Fi", "Thriller"]', '["Japanese", "English", "Binary Code"]'),
('Whispers of Rebellion', '../../assets/pos1.jpg', '2024-09-05', 4.0, 'PG-13', 'On a distant colony world, a group of teens discover a dark secret about their society and spark a revolution.', '["Sci-Fi", "Drama", "Young Adult"]', '["English", "French", "Constructed Language"]'),
('Quantum Pirate', '../../assets/pos1.jpg', '2024-08-27', 4.4, 'PG-13', 'A space pirate crew uses quantum tunneling technology for daring heists across the galaxy.', '["Sci-Fi", "Adventure", "Heist"]', '["English", "Spanish", "Alien Dialects"]'),
('Echoes of Avalon', '../../assets/pos1.jpg', '2024-09-03', 3.8, 'PG', 'In modern-day Britain, the legendary island of Avalon resurfaces, bringing magic and myth into conflict with the modern world.', '["Fantasy", "Adventure", "Drama"]', '["English", "Welsh", "Old English"]'),
('Neon Valkyrie', '../../assets/pos1.jpg', '2024-08-29', 4.1, 'PG-13', 'A cybernetically enhanced warrior leads a team to defend Neo-Asgard from both earthly and otherworldly threats.', '["Sci-Fi", "Action", "Mythology"]', '["English", "Norse", "Binary"]'),
('Whispers of the Ancients', '../../assets/pos1.jpg', '2024-09-06', 4.0, 'PG-13', 'A linguist decodes an ancient language that allows communication with long-extinct species, reshaping our understanding of history.', '["Sci-Fi", "Drama", "Mystery"]', '["English", "Dead Languages", "Sign Language"]'),
('Quantum Nexus', '../../assets/pos1.jpg', '2024-08-26', 4.3, 'PG-13', 'A massive quantum computer becomes sentient, forcing humanity to question the nature of consciousness and reality.', '["Sci-Fi", "Philosophy", "Thriller"]', '["English", "Binary", "Mathematics"]'),
('Celestial Forge', '../../assets/pos1.jpg', '2024-09-02', 4.2, 'PG-13', 'A master blacksmith discovers he can forge weapons from fallen stars, attracting the attention of both heroes and villains.', '["Fantasy", "Action", "Drama"]', '["English", "Norse", "Celtic"]'),
('Echoes of Dystopia', '../../assets/pos1.jpg', '2024-08-28', 3.9, 'R', 'In a world where emotions are outlawed, an underground resistance fights to bring back the human experience.', '["Sci-Fi", "Drama", "Thriller"]', '["English", "Newspeak", "Emoji"]'),
('Neon Samurai: Revenge', '../../assets/pos1.jpg', '2024-09-04', 4.1, 'R', 'The cyber-enhanced samurai returns to avenge his fallen clan, uncovering a conspiracy that threatens all of Neo-Tokyo.', '["Action", "Sci-Fi", "Martial Arts"]', '["Japanese", "English", "Binary"]'),
('Whispers of the Multiverse', '../../assets/pos1.jpg', '2024-08-30', 4.4, 'PG-13', 'A physicist discovers a way to communicate across parallel universes, but each contact risks destroying both realities.', '["Sci-Fi", "Drama", "Romance"]', '["English", "Parallel English", "Physics Equations"]'),
('Quantum Ghost', '../../assets/pos1.jpg', '2024-09-05', 3.8, 'PG-13', 'A spy gains the ability to quantum leap through solid matter, becoming the perfect infiltrator—and the perfect target.', '["Spy", "Sci-Fi", "Action"]', '["English", "Russian", "Mandarin"]'),
('Galactic Rhapsody', '../../assets/pos1.jpg', '2024-08-27', 4.0, 'PG', 'An interstellar singing competition becomes the stage for diplomatic relations between various alien species and humanity.', '["Sci-Fi", "Music", "Comedy"]', '["English", "Alien Languages", "Musical Notes"]'),
('Echoes of Atlantis: Resurgence', '../../assets/pos1.jpg', '2024-09-03', 4.2, 'PG-13', 'The long-lost city of Atlantis rises from the depths, bringing advanced technology and ancient conflicts to the modern world.', '["Action", "Sci-Fi", "Adventure"]', '["English", "Ancient Greek", "Atlantean"]'),
('Neon Ronin: Redemption', '../../assets/pos1.jpg', '2024-08-29', 4.1, 'R', 'The disgraced samurai seeks to restore his honor by protecting a young AI from those who would exploit its power.', '["Action", "Sci-Fi", "Drama"]', '["Japanese", "English", "AI Language"]');

COMMIT;

SELECT * FROM movie;