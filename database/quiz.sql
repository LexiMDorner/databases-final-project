SELECT
    quiz.quiz_id,
    quiz.quiz_name,
    q.question_id,
    q.question_text,
    a.answer_text,
    a.isCorrect
FROM
    question q
    JOIN answer a ON q.question_id = a.question_id
    JOIN quiz ON quiz.quiz_id = q.quiz_id
ORDER BY
    quiz.quiz_id,
    q.question_id,
    a.isCorrect desc;