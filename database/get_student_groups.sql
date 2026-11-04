DROP PROCEDURE IF EXISTS GetStudentGroups;
DELIMITER //
CREATE PROCEDURE GetStudentGroups (
    IN course_id INT, 
    IN section INT
) 
BEGIN
SELECT
    s.student_name,
    g.group_name
FROM
    student s
    JOIN student_group sg ON s.student_id = sg.student_id
    -- placeholder values use parameters
    JOIN `group` g ON sg.group_id = g.group_id
    and g.course_id = course_id
    and g.section = section
ORDER BY
    g.group_name,
    s.student_name;

END //
DELIMITER ;