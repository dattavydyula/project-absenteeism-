---compensation rate increase for non- smokers
select count(*) as nonsmokers from Absenteeism_at_work
where Social_smoker = 0 

--optimising
select
a.ID,
r.Reason,
Month_of_absence,
Body_mass_index,
CASE When Body_mass_index <18.5 then 'underweight'
WHEN Body_mass_index between 18.5 and 25 then 'Healthy'
WHEN Body_mass_index Between 25 and 30 then 'over weight'
WHEN Body_mass_index >18.5 then 'obese'
Else 'unknown' end as BMI_category,
CASE when Month_of_absence In (12,1,2) then 'winter'
when Month_of_absence In (3,4,5) then 'Spring' 
when Month_of_absence In (6,7,8) then 'Summer'
when Month_of_absence In (9,10,11) then 'fall'
else 'unknown' End as Seasons_names,
Seasons,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on 
a.Reason_for_absence = r.Number; 
