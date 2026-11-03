SELECT
    c.title,
    c.section,
    AVG(gq.score) as class_average
FROM
    course c
    JOIN class_quiz cq on c.course_id = cq.course_id
    and c.section = cq.section
    JOIN group_quiz gq on cq.quiz_id = gq.quiz_id
    JOIN `group` g ON g.group_id = gq.group_id
WHERE
    g.course_id = c.course_id
    and g.section = c.section
GROUP BY
    c.course_id,
    c.section;