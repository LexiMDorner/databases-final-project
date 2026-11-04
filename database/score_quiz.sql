UPDATE group_quiz
SET
    -- use params not hardcoded values
    score = 5
WHERE
    group_id = 1
    and quiz_id = 1