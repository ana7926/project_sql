/*
Question: What are the top-paying data analyst jobs?
- Identify the top 30 highest-paying Junior Data/Business Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
LIMIT 30;