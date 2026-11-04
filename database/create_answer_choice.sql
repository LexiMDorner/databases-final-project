START TRANSACTION;

INSERT INTO
    answer (question_id, answer_text, isCorrect)
VALUES
    --note just placeholders eventually will be parameters
    (1, 'answer text', FALSE);

SELECT
    MAX(answer_id)
FROM
    answer;

COMMIT;