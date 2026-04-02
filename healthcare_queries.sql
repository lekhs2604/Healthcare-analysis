-- created and using database
use healthcare_analysis;
select * from healthcare_details;

-- total rows from table
select count(*) as total_rows from healthcare_details;

-- total admission 
select Patient_Admission_Flag, count(*) as total_admission
from healthcare_details
group by Patient_Admission_Flag;

-- waitime from different people
select Patient_Race, sum(Patient_Waittime)
from healthcare_details
group by Patient_Race
order by  Patient_Race asc;

-- high score and avg by using subquery from review
select count(*) from healthcare_details
where Patient_Satisfaction_Score >=5;


select * from healthcare_details
where Patient_Satisfaction_Score > (
  select avg(Patient_Satisfaction_Score) from healthcare_details);
  
  -- where clause
select Department_Referral,count(*) as total_orthopedics 
from healthcare_details
where Department_Referral='Orthopedics';

-- by using where and group by clause, identifying admmision
select Patient_Race,count(*) as admitted 
from healthcare_details
where Patient_Admission_Flag='Admission'
group by Patient_Race
order by admitted desc;


select Patient_Race,count(*) as not_admitted 
from healthcare_details
where Patient_Admission_Flag='Not Admission'
group by Patient_Race
order by not_admitted asc;

-- counting gender 
select Patient_Gender, count(*) from healthcare_details
group by Patient_Gender;

select Department_Referral,sum(Patient_Waittime) as total_hours 
from healthcare_details
group by Department_Referral
order by total_hours desc;

-- ranking by score
select Department_Referral,total_score
from ( 
 select 
    Department_Referral,
	sum(Patient_Satisfaction_Score) as total_score,
    rank()over(order by sum(Patient_Satisfaction_Score) desc) as rnk
 from healthcare_details
 group by Department_Referral
)as ranked_Departments
where rnk<=5;










