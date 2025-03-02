/*
Question: What are the most in-demand skills for current positions 
- Join job posting to inner join table similar to query 2
- Identify the top 5 in - demand skills for a data analyst
- Focus on all job postings
*/


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
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
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5;