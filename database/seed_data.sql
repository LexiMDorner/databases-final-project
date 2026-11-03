USE `finalProject`;

INSERT INTO
    teacher (teacher_name, email)
VALUES
    ('Dr. Avery Morgan', 'avery.morgan@example.com'),
    ('Prof. Jordan Lee', 'jordan.lee@example.com');

INSERT INTO
    course (title, section)
VALUES
    ('Introduction to Biology', 1),
    ('World History', 1),
    ('Computer Science Fundamentals', 1);

INSERT INTO
    teaches (teacher_id, course_id, section)
VALUES
    (1, 1, 1),
    (1, 2, 1),
    (2, 3, 1);

INSERT INTO
    student (student_name, email)
VALUES
    ('Alice Brown', 'alice.brown@example.com'),
    ('Ben Carter', 'ben.carter@example.com'),
    ('Chloe Davis', 'chloe.davis@example.com'),
    ('Daniel Evans', 'daniel.evans@example.com'),
    ('Emma Foster', 'emma.foster@example.com'),
    ('Finn Garcia', 'finn.garcia@example.com'),
    ('Grace Hall', 'grace.hall@example.com'),
    ('Henry Ibarra', 'henry.ibarra@example.com'),
    ('Isla Johnson', 'isla.johnson@example.com'),
    ('Jack Kim', 'jack.kim@example.com'),
    ('Kira Lewis', 'kira.lewis@example.com'),
    ('Liam Moore', 'liam.moore@example.com'),
    ('Mia Nelson', 'mia.nelson@example.com'),
    ('Noah Ortiz', 'noah.ortiz@example.com'),
    ('Olivia Perez', 'olivia.perez@example.com'),
    ('Paul Quinn', 'paul.quinn@example.com'),
    ('Quinn Rivera', 'quinn.rivera@example.com'),
    ('Riley Smith', 'riley.smith@example.com'),
    ('Sophia Taylor', 'sophia.taylor@example.com'),
    ('Theo Underwood', 'theo.underwood@example.com'),
    ('Uma Vance', 'uma.vance@example.com'),
    ('Victor White', 'victor.white@example.com'),
    ('Wendy Xu', 'wendy.xu@example.com'),
    ('Xavier Young', 'xavier.young@example.com'),
    ('Yara Zane', 'yara.zane@example.com'),
    ('Zach Adams', 'zach.adams@example.com'),
    ('Nora Baker', 'nora.baker@example.com');

-- Course 1: students 1-9
INSERT INTO
    enrollment (student_id, course_id, section)
VALUES
    (1, 1, 1),
    (2, 1, 1),
    (3, 1, 1),
    (4, 1, 1),
    (5, 1, 1),
    (6, 1, 1),
    (7, 1, 1),
    (8, 1, 1),
    (9, 1, 1);

-- Course 2: students 10-18
INSERT INTO
    enrollment (student_id, course_id, section)
VALUES
    (10, 2, 1),
    (11, 2, 1),
    (12, 2, 1),
    (13, 2, 1),
    (14, 2, 1),
    (15, 2, 1),
    (16, 2, 1),
    (17, 2, 1),
    (18, 2, 1);

-- Course 3: students 19-27
INSERT INTO
    enrollment (student_id, course_id, section)
VALUES
    (19, 3, 1),
    (20, 3, 1),
    (21, 3, 1),
    (22, 3, 1),
    (23, 3, 1),
    (24, 3, 1),
    (25, 3, 1),
    (26, 3, 1),
    (27, 3, 1);

-- Three groups of three students in each course.
INSERT INTO
    `group` (group_name, course_id, section)
VALUES
    ('Biology Group A', 1, 1),
    ('Biology Group B', 1, 1),
    ('Biology Group C', 1, 1),
    ('History Group A', 2, 1),
    ('History Group B', 2, 1),
    ('History Group C', 2, 1),
    ('Computer Science Group A', 3, 1),
    ('Computer Science Group B', 3, 1),
    ('Computer Science Group C', 3, 1);

INSERT INTO
    student_group (group_id, student_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (3, 7),
    (3, 8),
    (3, 9),
    (4, 10),
    (4, 11),
    (4, 12),
    (5, 13),
    (5, 14),
    (5, 15),
    (6, 16),
    (6, 17),
    (6, 18),
    (7, 19),
    (7, 20),
    (7, 21),
    (8, 22),
    (8, 23),
    (8, 24),
    (9, 25),
    (9, 26),
    (9, 27);

INSERT INTO
    quiz (quiz_name)
VALUES
    ('Fundamentals Knowledge Check');

INSERT INTO
    question (quiz_id, question_text)
VALUES
    (1, 'What is the basic unit of life?'),
    (
        1,
        'Which organelle stores genetic material in a eukaryotic cell?'
    ),
    (
        1,
        'What process do plants use to convert light energy into chemical energy?'
    ),
    (1, 'Which molecule carries genetic instructions?'),
    (1, 'What is the largest organ of the human body?');

INSERT INTO
    answer (question_id, answer_text, isCorrect)
VALUES
    (1, 'The cell', 1),
    (1, 'The atom', 0),
    (1, 'The tissue', 0),
    (1, 'The organ', 0),
    (2, 'Mitochondrion', 0),
    (2, 'Nucleus', 1),
    (2, 'Ribosome', 0),
    (2, 'Golgi apparatus', 0),
    (3, 'Cellular respiration', 0),
    (3, 'Fermentation', 0),
    (3, 'Photosynthesis', 1),
    (3, 'Transcription', 0),
    (4, 'Protein', 0),
    (4, 'DNA', 1),
    (4, 'Glucose', 0),
    (4, 'Cholesterol', 0),
    (5, 'Heart', 0),
    (5, 'Liver', 0),
    (5, 'Skin', 1),
    (5, 'Brain', 0);

-- Assign the quiz to Biology course 1, and then to every Biology group.
INSERT INTO
    class_quiz (course_id, quiz_id, section)
VALUES
    (1, 1, 1);

INSERT INTO
    group_quiz (group_id, quiz_id, score)
VALUES
    (1, 1, 10),
    (2, 1, 5),
    (3, 1, 12);