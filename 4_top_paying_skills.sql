/*
Question: What are the top skills based on salary?
-Look at the average salary associated with each skill for current positions
-Focuses on roles with specified salaries, regardless of location
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
   (job_postings_fact.job_title ILIKE '%data%' 
        OR job_postings_fact.job_title ILIKE '%analyst%'
        OR job_postings_fact.job_title ILIKE '%business%'
        )
    AND job_postings_fact.job_title ILIKE '%junior%'
    AND 
        job_postings_fact.job_title NOT ILIKE '%Engineer%'
    AND job_work_from_home = True
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY 
    avg_salary
LIMIT 25;