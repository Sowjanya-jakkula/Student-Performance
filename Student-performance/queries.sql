#SQL Queries for Analysis

                                                                    
create database student_db;
use student_db;

CREATE TABLE StudentPerformanceFactors_1 (
  hours_studied INT,
  attendance INT,
  parental_involvement VARCHAR(20),
  access_to_resources VARCHAR(20),
  extracurricular_activities VARCHAR(10),
  sleep_hours INT,
  previous_scores INT,
  motivation_level VARCHAR(20),
  internet_access VARCHAR(10),
  tutoring_sessions INT,
  family_income VARCHAR(20),
  teacher_quality VARCHAR(20),
  school_type VARCHAR(20),
  peer_influence VARCHAR(20),
  physical_activity INT,
  learning_disabilities VARCHAR(10),
  parental_education_level VARCHAR(30),
  distance_from_home VARCHAR(20),
  gender VARCHAR(10),
  exam_score INT
);

SELECT * FROM StudentPerformanceFactors_1;


select count(*) as total_students from StudentPerformanceFactors_1;


select count(*) - count(hours_studied) as null_hours,
count(*) - count(exam_score) as null_exam_score
from StudentPerformanceFactors_1;


select 
min(exam_score) as min_score,
avg(exam_score) as avg_score,
max(exam_score) as max_score
from StudentPerformanceFactors_1;

select
round(avg(hours_studied) ,2) as avg_hours,
round(avg(exam_score),2) as avg_score
from StudentPerformanceFactors_1;


select hours_studied,
avg(exam_score) as avg_score
from StudentPerformanceFactors_1
group by hours_studied
order by hours_studied;

select
round(avg(attendance),2) as avg_attendance,
round(avg(exam_score),2) as avg_score
from StudentPerformanceFactors_1;

select
CASE
     when attendance >= 80 then "high attendance"
     else "low attendance"
end as attendance_category,
avg(exam_score) as avg_score
from StudentPerformanceFactors_1
group by attendance_category;     


select
sleep_hours,
avg(exam_score) as avg_score
from StudentPerformanceFactors_1
group by sleep_hours
order by sleep_hours;

select 
round(avg(previous_scores),2) as avg_previous,
round(avg(exam_score),2) as avg_score
from StudentPerformanceFactors_1;


select gender,
avg(exam_score)as avg_score
from StudentPerformanceFactors_1
group by gender;

select
family_income,
avg(exam_score) as avg_score
from StudentPerformanceFactors_1
group by family_income
order by avg_score desc;

select school_type,
avg(exam_score) as avg_score
from StudentPerformanceFactors_1
group by school_type;

select teacher_quality,
avg(exam_score) as avg_score
from StudentPerformanceFactors_1
group by teacher_quality
order by avg_score desc;

select * from StudentPerformanceFactors_1
order by exam_score desc
limit 10;


select * from StudentPerformanceFactors_1
where exam_score < (
       select avg(exam_score)
       from StudentPerformanceFactors_1
 );      


select exam_score,
case 
    when exam_score >= 90 then 'A'
    when exam_score >= 75 then 'B'
    when exam_score >= 50 then 'C'
    else 'Fail'
end as grade
from StudentPerformanceFactors_1;   


select * ,
rank() over (order by exam_score desc) as rank_no 
from StudentPerformanceFactors_1; 

select *,
dense_rank() over (order by exam_score desc) as dens_rank_no
from StudentPerformanceFactors_1;

select *,
row_number() over (order by exam_score desc) as row_num
from StudentPerformanceFactors_1; 


select *,
avg(exam_score) over (partition by gender) as gender_avg
from StudentPerformanceFactors_1; 


select * ,
sum(exam_score) over (order by exam_score) as running_total
from StudentPerformanceFactors_1; 


select * from StudentPerformanceFactors_1 sp1
where exam_score > (
select avg(exam_score)
from StudentPerformanceFactors_1 sp2
where sp1.gender=sp2.gender);


create view gender_summery as
select gender ,avg(exam_score) as avg_score
from StudentPerformanceFactors_1
group by gender;

create index idx_exam_score
on StudentPerformanceFactors_1(exam_score);





