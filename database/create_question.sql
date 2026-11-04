START TRANSACTION;

INSERT INTO
    question (quiz_id, question_text)
VALUES
    --note just placeholders eventually will be parameters
    (1, 'question text');

SELECT
    MAX(question_id)
FROM
    question;

COMMIT;