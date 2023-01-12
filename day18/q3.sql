CREATE TABLE Student (
student_id INT PRIMARY KEY,
student_name VARCHAR(255)
);

INSERT INTO Student (student_id, student_name) VALUES (1, 'Daniel');
INSERT INTO Student (student_id, student_name) VALUES (2, 'Jade');
INSERT INTO Student (student_id, student_name) VALUES (3, 'Stella');
INSERT INTO Student (student_id, student_name) VALUES (4, 'Jonathan');
INSERT INTO Student (student_id, student_name) VALUES (5, 'Will');


CREATE TABLE Exam (
exam_id INT,
student_id INT,
score INT,
PRIMARY KEY (exam_id, student_id)
);

INSERT INTO Exam (exam_id, student_id, score) VALUES (10, 1, 70);
INSERT INTO Exam (exam_id, student_id, score) VALUES (10, 2, 80);
INSERT INTO Exam (exam_id, student_id, score) VALUES (10, 3, 90);
INSERT INTO Exam (exam_id, student_id, score) VALUES (20, 1, 80);
INSERT INTO Exam (exam_id, student_id, score) VALUES (30, 1, 70);
INSERT INTO Exam (exam_id, student_id, score) VALUES (30, 3, 80);
INSERT INTO Exam (exam_id, student_id, score) VALUES (30, 4, 90);
INSERT INTO Exam (exam_id, student_id, score) VALUES (40, 1, 60);
INSERT INTO Exam (exam_id, student_id, score) VALUES (40, 2, 70);
INSERT INTO Exam (exam_id, student_id, score) VALUES (40, 4, 80);



select student_id, student_name
from
(
    select distinct student_id
    from Exam
    where student_id not in
    (
        select distinct student_id
        from Exam exam1 left join
        (
            select exam_id, max(score) maxs, min(score) mins
            from Exam
            group by exam_id
        ) t
        using(exam_id)
        where score = maxs or score = mins

    )
) test
left join Student
using(student_id)
order by student_id
