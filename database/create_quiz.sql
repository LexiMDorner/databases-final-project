START TRANSACTION;

INSERT INTO
    quiz (quiz_name)
VALUES
    --note just placeholders eventually will be parameters
    ('quiz name');

SELECT
    MAX(quiz_id)
FROM
    quiz;

COMMIT;