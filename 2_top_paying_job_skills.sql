
/*
Question: What skills are required for the top-paying relevant job positions?
- Use the top 30 highest-paying relevant job positions from first query
- Add the specific skills required for these roles 

*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact 
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
            ( job_title ILIKE '%data%' 
            OR job_title ILIKE '%analyst%'
            OR job_title ILIKE '%business%'
            )
        AND job_title ILIKE '%junior%'
        AND 
            job_title NOT ILIKE '%Engineer%'
        AND    
            (job_location ILIKE '%Austin%' OR 
            job_location ILIKE '%Anywhere%')
            
        AND salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 30
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    
/* 
Answer: 