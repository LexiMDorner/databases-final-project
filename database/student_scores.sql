SELECT
    s.student_name,
    g.group_name,
    q.quiz_name,
    gq.score
FROM
    student s
    JOIN student_group sg ON s.student_id = sg.student_id
    JOIN `group` g ON sg.group_id = g.group_id
    JOIN group_quiz gq ON g.group_id = gq.group_id
    JOIN quiz q ON gq.quiz_id = q.quiz_id
ORDER BY
    q.quiz_name,
    g.group_name,
    s.student_name;