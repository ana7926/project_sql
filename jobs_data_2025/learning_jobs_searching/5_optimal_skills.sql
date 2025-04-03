/*
Answer: What are the most optimal skills to learn( aka its in high demand and a high-paying skills)?
- identify skills ih high demand and associated with average salaries for relevant roles
- concentrates on remote positions with specified salaries

*/

SELECT 
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
    AND job_work_from_home = True
GROUP BY 
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.job_id) > 30
ORDER BY  
    demand_count DESC,
    avg_salary DESC
LIMIT 5;
    

------

[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "337",
    "avg_salary": "77094"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "333",
    "avg_salary": "79045"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "237",
    "avg_salary": "71136"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "149",
    "avg_salary": "75000"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "136",
    "avg_salary": "97500"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "101",
    "avg_salary": "68333"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "92",
    "avg_salary": "75000"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "76",
    "avg_salary": "75000"
  },
  {
    "skill_id": 108,
    "skills": "matplotlib",
    "demand_count": "52",
    "avg_salary": "75000"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "51",
    "avg_salary": "75000"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "44",
    "avg_salary": null
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "42",
    "avg_salary": null
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "37",
    "avg_salary": "100000"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "37",
    "avg_salary": "100000"
  },
  {
    "skill_id": 210,
    "skills": "git",
    "demand_count": "36",
    "avg_salary": null
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "35",
    "avg_salary": null
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "34",
    "avg_salary": null
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": "34",
    "avg_salary": "75000"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "33",
    "avg_salary": "78500"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "31",
    "avg_salary": null
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "31",
    "avg_salary": "65000"
  }
]

