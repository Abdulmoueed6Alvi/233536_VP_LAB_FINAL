-- Create the quizzes database
CREATE DATABASE  quizzes;

-- Use the quizzes database
USE quizzes;

-- Create the questions table
CREATE TABLE  questionss (
  
    category VARCHAR(50),
    question TEXT NOT NULL,
    option_a VARCHAR(255),
    option_b VARCHAR(255),
    option_c VARCHAR(255),
    option_d VARCHAR(255),
    correct_option CHAR(1)
);

-- Insert questions into the questions table

-- Math Category
INSERT INTO questionss (category, question, option_a, option_b, option_c, option_d, correct_option)
VALUES
('Math', 'What is 5 + 7?', '10', '11', '12', '13', 'C'),
('Math', 'What is the square root of 81?', '8', '9', '10', '11', 'B'),
('Math', 'What is 15 * 3?', '35', '45', '55', '60', 'B'),
('Math', 'What is 10 / 2?', '3', '5', '8', '7', 'B'),
('Math', 'What is 100 - 55?', '35', '45', '55', '65', 'B'),
('Math', 'If x = 2, what is 3x + 4?', '8', '10', '11', '13', 'D'),
('Math', 'What is the perimeter of a square with side length 4?', '12', '14', '16', '18', 'C'),
('Math', 'What is the value of 2^5?', '16', '32', '64', '8', 'B'),
('Math', 'What is 7 * 8?', '54', '56', '64', '72', 'B'),
('Math', 'Solve: 2x + 6 = 10. Find x.', '1', '2', '3', '4', 'B');

-- Science Category
INSERT INTO questionss (category, question, option_a, option_b, option_c, option_d, correct_option)
VALUES
('Science', 'What planet is known as the Red Planet?', 'Earth', 'Mars', 'Venus', 'Jupiter', 'B'),
('Science', 'What is the chemical symbol for water?', 'HO', 'OH', 'H2O', 'WO', 'C'),
('Science', 'What gas do plants absorb during photosynthesis?', 'Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen', 'B'),
('Science', 'Which planet is the largest in the solar system?', 'Earth', 'Saturn', 'Jupiter', 'Mars', 'C'),
('Science', 'What is the speed of light?', '300,000 km/s', '150,000 km/s', '400,000 km/s', '100,000 km/s', 'A'),
('Science', 'Which element is needed for hemoglobin in blood?', 'Iron', 'Calcium', 'Zinc', 'Magnesium', 'A'),
('Science', 'What is the atomic number of Helium?', '1', '2', '3', '4', 'B'),
('Science', 'What is the process of converting water to vapor called?', 'Condensation', 'Evaporation', 'Freezing', 'Sublimation', 'B'),
('Science', 'Who developed the theory of relativity?', 'Newton', 'Einstein', 'Galileo', 'Darwin', 'B'),
('Science', 'Which organ in the body is responsible for filtering blood?', 'Heart', 'Liver', 'Lungs', 'Kidney', 'D');

-- History Category
INSERT INTO questionss (category, question, option_a, option_b, option_c, option_d, correct_option)
VALUES
('History', 'Who was the first president of the United States?', 'Abraham Lincoln', 'Thomas Jefferson', 'George Washington', 'John Adams', 'C'),
('History', 'In which year did World War II end?', '1941', '1943', '1945', '1947', 'C'),
('History', 'Who discovered America?', 'Marco Polo', 'Christopher Columbus', 'Ferdinand Magellan', 'James Cook', 'B'),
('History', 'Which empire built the Great Wall of China?', 'Mongol Empire', 'Qin Dynasty', 'Roman Empire', 'Ottoman Empire', 'B'),
('History', 'Who wrote the Declaration of Independence?', 'Benjamin Franklin', 'Thomas Jefferson', 'George Washington', 'John Adams', 'B'),
('History', 'Which ancient civilization built the pyramids?', 'Romans', 'Egyptians', 'Greeks', 'Mayans', 'B'),
('History', 'In which year did the French Revolution begin?', '1789', '1791', '1801', '1815', 'A'),
('History', 'Who was known as the Iron Lady?', 'Margaret Thatcher', 'Queen Elizabeth', 'Indira Gandhi', 'Angela Merkel', 'A'),
('History', 'Which country gifted the Statue of Liberty to the USA?', 'Spain', 'France', 'Italy', 'Germany', 'B'),
('History', 'Who was the leader of the Soviet Union during World War II?', 'Vladimir Lenin', 'Joseph Stalin', 'Nikita Khrushchev', 'Mikhail Gorbachev', 'B');

-- General Knowledge Category
INSERT INTO questionss (category, question, option_a, option_b, option_c, option_d, correct_option)
VALUES
('General Knowledge', 'What is the capital of France?', 'Berlin', 'Madrid', 'Paris', 'Rome', 'C'),
('General Knowledge', 'Which language is most spoken worldwide?', 'English', 'Spanish', 'Mandarin', 'Hindi', 'C'),
('General Knowledge', 'What is the currency of Japan?', 'Yen', 'Dollar', 'Won', 'Euro', 'A'),
('General Knowledge', 'Which is the longest river in the world?', 'Amazon', 'Nile', 'Yangtze', 'Mississippi', 'B'),
('General Knowledge', 'Who painted the Mona Lisa?', 'Van Gogh', 'Picasso', 'Da Vinci', 'Michelangelo', 'C'),
('General Knowledge', 'Which country is known as the Land of the Rising Sun?', 'China', 'Japan', 'India', 'Korea', 'B'),
('General Knowledge', 'What is the smallest continent?', 'Australia', 'Antarctica', 'Europe', 'South America', 'A'),
('General Knowledge', 'Which sport is known as the "king of sports"?', 'Basketball', 'Cricket', 'Football (Soccer)', 'Tennis', 'C'),
('General Knowledge', 'What does HTTP stand for?', 'HyperText Transfer Protocol', 'HyperText Translation Protocol', 'High-Transfer Text Protocol', 'HyperText Transfer Pipeline', 'A'),
('General Knowledge', 'Who invented the telephone?', 'Alexander Graham Bell', 'Thomas Edison', 'Nikola Tesla', 'Michael Faraday', 'A');
