/*
Answer: What are the most optimal skills to learn( aka its in high demand and a high-paying skills)?
- identify skills ih high demand and associated with average salaries for relevant roles
- concentrates on remote positions with specified salaries

*/

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    (job_postings_fact.job_title ILIKE '%data%' 
    OR job_postings_fact.job_title ILIKE '%analyst%'
    OR job_postings_fact.job_title ILIKE '%business%'
            )
    AND job_postings_fact.job_title ILIKE '%junior%'
    AND job_postings_fact.job_title NOT ILIKE '%Engineer%'
    -- AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY 
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.job_id) > 30
ORDER BY  
    demand_count DESC,
    avg_salary DESC
LIMIT 30;
    

