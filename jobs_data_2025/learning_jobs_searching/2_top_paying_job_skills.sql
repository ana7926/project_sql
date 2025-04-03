
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
            job_location ILIKE '%Anywhere%'
            
        AND salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 30
)

SELECT 
    top_paying_jobs.salary_year_avg,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    
----------------------------------------------------------------
[
  {
    "job_id": 153367,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "sql"
  },
  {
    "job_id": 153367,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "python"
  },
  {
    "job_id": 153367,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "r"
  },
  {
    "job_id": 161651,
    "job_title": "Junior Data Scientist (Remote)",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "sql"
  },
  {
    "job_id": 161651,
    "job_title": "Junior Data Scientist (Remote)",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "python"
  },
  {
    "job_id": 161651,
    "job_title": "Junior Data Scientist (Remote)",
    "salary_year_avg": "105000.0",
    "company_name": "Trilogy Federal",
    "skills": "r"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "sql"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "python"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "r"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "sas"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "excel"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "tableau"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "sas"
  },
  {
    "job_id": 958457,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "100000.0",
    "company_name": "Morgan Hunter",
    "skills": "spss"
  },
  {
    "job_id": 463381,
    "job_title": "Data Analyst (Junior/Mid/Senior) - Remote - Defense Manpower Data...",
    "salary_year_avg": "82000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 463381,
    "job_title": "Data Analyst (Junior/Mid/Senior) - Remote - Defense Manpower Data...",
    "salary_year_avg": "82000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "t-sql"
  },
  {
    "job_id": 463381,
    "job_title": "Data Analyst (Junior/Mid/Senior) - Remote - Defense Manpower Data...",
    "salary_year_avg": "82000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "oracle"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "sql"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "python"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "r"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "excel"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "tableau"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "sharepoint"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "jira"
  },
  {
    "job_id": 564679,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "confluence"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "sql"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "excel"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "power bi"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "word"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "outlook"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "jira"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "confluence"
  },
  {
    "job_id": 550113,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Motion Recruitment",
    "skills": "python"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "nosql"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "vba"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "oracle"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "hadoop"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "excel"
  },
  {
    "job_id": 1170721,
    "job_title": "Junior Data BI Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "tableau"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "python"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "databricks"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "pandas"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "numpy"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "pyspark"
  },
  {
    "job_id": 1806181,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "matplotlib"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "python"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "databricks"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "pandas"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "numpy"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "pyspark"
  },
  {
    "job_id": 964514,
    "job_title": "Junior Data Scientist - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "matplotlib"
  },
  {
    "job_id": 1321085,
    "job_title": "Junior Data Analyst - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 1321085,
    "job_title": "Junior Data Analyst - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "excel"
  },
  {
    "job_id": 1321085,
    "job_title": "Junior Data Analyst - US/Canada",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sheets"
  },
  {
    "job_id": 156786,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 156786,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "excel"
  },
  {
    "job_id": 156786,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "75000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sheets"
  },
  {
    "job_id": 432310,
    "job_title": "Junior Business/Data Analyst",
    "salary_year_avg": "72000.0",
    "company_name": "Get It Recruit - Transportation",
    "skills": "sql"
  },
  {
    "job_id": 432310,
    "job_title": "Junior Business/Data Analyst",
    "salary_year_avg": "72000.0",
    "company_name": "Get It Recruit - Transportation",
    "skills": "nosql"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "vba"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "excel"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 1264889,
    "job_title": "Junior Reporting Data Analyst",
    "salary_year_avg": "70000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sharepoint"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "visual basic"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "vba"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "excel"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "power bi"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "word"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "powerpoint"
  },
  {
    "job_id": 1441940,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "65000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "ms access"
  },
  {
    "job_id": 153583,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "65000.0",
    "company_name": "EMG Acquisitions",
    "skills": "sql"
  },
  {
    "job_id": 153583,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "65000.0",
    "company_name": "EMG Acquisitions",
    "skills": "datarobot"
  },
  {
    "job_id": 931611,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "62500.0",
    "company_name": "DonorSearch",
    "skills": "sql"
  },
  {
    "job_id": 931611,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "62500.0",
    "company_name": "DonorSearch",
    "skills": "python"
  },
  {
    "job_id": 1111802,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "62000.0",
    "company_name": "DonorSearch",
    "skills": "sql"
  },
  {
    "job_id": 1111802,
    "job_title": "Junior Data Scientist",
    "salary_year_avg": "62000.0",
    "company_name": "DonorSearch",
    "skills": "python"
  },
  {
    "job_id": 616124,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "sql"
  },
  {
    "job_id": 616124,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "excel"
  },
  {
    "job_id": 616124,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "tableau"
  },
  {
    "job_id": 616124,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "60000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "power bi"
  },
  {
    "job_id": 1804497,
    "job_title": "Junior Data Scientist (Clone)",
    "salary_year_avg": "55000.0",
    "company_name": "mlxar",
    "skills": "python"
  },
  {
    "job_id": 902110,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "52500.0",
    "company_name": "Phoenix Capital Group Holdings LLC",
    "skills": "julia"
  },
  {
    "job_id": 902110,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "52500.0",
    "company_name": "Phoenix Capital Group Holdings LLC",
    "skills": "phoenix"
  },
  {
    "job_id": 902110,
    "job_title": "Junior Data Analyst",
    "salary_year_avg": "52500.0",
    "company_name": "Phoenix Capital Group Holdings LLC",
    "skills": "excel"
  },
  {
    "job_id": 1332865,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "50000.0",
    "company_name": "Inspirus (a Pluxee company)",
    "skills": "excel"
  }
]

/* 

The dataset includes junior roles such as Junior Data Scientist, Junior Data Analyst, Junior Business Analyst, and Junior BI Analyst, with salaries ranging from $70,000 to $105,000 per year in 2023.

Most Commonly Required Skills

The top skills appearing across multiple job listings are:
	1.	SQL – Required in almost all positions, indicating its fundamental importance in data analysis and database management.
	2.	Python – Frequently mentioned for data analysis, data science, and automation tasks.
	3.	R – Commonly seen in data science roles, particularly for statistical analysis.
	4.	Excel – Essential for data analysis and reporting.
	5.	Tableau & Power BI – Important for data visualization.
	6.	SAS & SPSS – Required in some analytical roles, often used for statistical modeling.
	7.	NoSQL & Oracle – Required in database-related jobs.
	8.	JIRA & Confluence – Often mentioned in business and data analyst roles.
	9.	Hadoop & Databricks – Found in data science roles, suggesting knowledge of big data tools can be advantageous.
	10.	Pandas, NumPy, PySpark, Matplotlib – Used in machine learning and data science roles.

Insights
	•	SQL and Python are the most crucial skills, appearing across almost all high-paying positions.
	•	Data visualization tools (Tableau, Power BI) are highly valued in analyst roles.
	•	Big Data and Machine Learning tools (Hadoop, PySpark, Databricks) are required in specialized roles.
	•	Excel remains a necessary skill, especially for business and data analyst roles.

*/
