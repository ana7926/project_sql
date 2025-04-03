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
    AND job_work_from_home = True
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25;


----------------------------------------------------------------
[
  {
    "skills": "c#",
    "avg_salary": "115000"
  },
  {
    "skills": "flow",
    "avg_salary": "115000"
  },
  {
    "skills": "sql server",
    "avg_salary": "115000"
  },
  {
    "skills": "spss",
    "avg_salary": "100000"
  },
  {
    "skills": "azure",
    "avg_salary": "87500"
  },
  {
    "skills": "t-sql",
    "avg_salary": "82000"
  },
  {
    "skills": "outlook",
    "avg_salary": "80000"
  },
  {
    "skills": "jira",
    "avg_salary": "80000"
  },
  {
    "skills": "confluence",
    "avg_salary": "80000"
  },
  {
    "skills": "r",
    "avg_salary": "79375"
  },
  {
    "skills": "sas",
    "avg_salary": "78571"
  },
  {
    "skills": "sql",
    "avg_salary": "77250"
  },
  {
    "skills": "oracle",
    "avg_salary": "75875"
  },
  {
    "skills": "python",
    "avg_salary": "75368"
  },
  {
    "skills": "matplotlib",
    "avg_salary": "75000"
  },
  {
    "skills": "databricks",
    "avg_salary": "75000"
  },
  {
    "skills": "hadoop",
    "avg_salary": "75000"
  },
  {
    "skills": "html",
    "avg_salary": "75000"
  },
  {
    "skills": "numpy",
    "avg_salary": "75000"
  },
  {
    "skills": "pyspark",
    "avg_salary": "75000"
  },
  {
    "skills": "sharepoint",
    "avg_salary": "75000"
  },
  {
    "skills": "sheets",
    "avg_salary": "75000"
  },
  {
    "skills": "nosql",
    "avg_salary": "73500"
  },
  {
    "skills": "vba",
    "avg_salary": "73333"
  },
  {
    "skills": "matlab",
    "avg_salary": "72857"
  }
]