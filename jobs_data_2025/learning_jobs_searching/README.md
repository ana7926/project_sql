# Introduction 
Hello! I created this project to explore how I can kick off my career in programming. To  do that I analyzed data from previous years to identify trends. 
 
 📊 I focused on data-related roles—Data Analyst, Data Scientist, Data Engineer, Business Analyst.
 
 🎯 My goal? To figure out which jobs to apply for and what skills to learn or sharpen as an aspiring Junior Data Specialist.

 SQL Queries? Check  them out here: [learning_jobs_searching](/jobs_data_2025/learning_jobs_searching/)
 
 # Background
 Driven by a quest to break into Junior Data roles, this project was created to identify the most in-demand and high-paying skills, making it easier for others to navigate the job market efficiently.


 ### The questions I wanted to answer through my SQL queries were:
 
 1. What are the highest-paying emote Junior roles in Data and Business Analysis?
 2. What skills are required for the top-paying entry level Data jobs?
 3. What are the most in-demand skills for entry-level remote Data jobs?
 4. What are the highest-paying skills for Junior Data roles?
 5. What are the best skills to learn for a high-demand, high-paying Junior Data role?
 
 # Tools I Used
 
 For my deep dive into the Junior Data job market, I harnessed the power of several key tools:
 
 - **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
 - **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
 - **Visual Studio Code:** My go-to for database management and executing SQL queries.
 - **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
 
 # The Analysis
 
 Each query for this project aimed at investigating specific aspects of Junior Data job market. Here’s how I approached each question:
 

 ## 1. Top Paying Junior Data Jobs
 
 To uncover the highest-paying junior data roles, I filtered job postings that include “Data” or “Business Analyst” in the title while specifically targeting junior-level positions. The query focuses on remote opportunities with reported salary data.

```sql
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
        job_location ILIKE '%Anywhere%'
        
    AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 30;
```
### Key Insights from the Data:

💰 Top Junior Salaries: The highest-paying junior data roles reach up to $115,000, with the top positions in Data Engineering and Data Science.

🏢 Leading Employers: Patterned Learning AI and Trilogy Federal are among the companies offering competitive salaries, showing strong demand in AI and federal sectors.

📊 Job Role Trends: Data Engineers, Data Scientists, and Data Analysts dominate the list, with multiple opportunities available across these specializations.

![Top Paying Roles](/jobs_data_2025/learning_jobs_searching/assets/top-paying-jobs.png)

*Here’s the bar chart visualizing the top 10 highest-paying junior data jobs. It highlights the most lucrative roles, with Junior Data Engineers and Junior Data Scientists leading in salary.*

## 2. Top Paying Junior Data Skills

To understand what skills are required for the top-paying entry-level data jobs, I analyzed job postings and their associated skills. This provides insight into what employers value for high-compensation junior roles.

```sql
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
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
```

### Key Insights from the Data:

📌 SQL is the most in-demand skill, appearing in 26 job listings.

📌 Python follows closely, required in 17 roles.

📌 SAS is also a key skill, with 14 job postings mentioning it.

![Top Paying Skills](/jobs_data_2025/learning_jobs_searching/assets/top-paying-skills.png)
*The bar graph above visualizes the top required skills for high-paying junior data jobs.*

## 3. In-Demand Skills for Junior Data Jobs

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
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
```

### Key Insights on the Most In-Demand Skills for Junior Data Jobs:

📊 **SQL & Python Dominate** – With 554 mentions each, SQL and Python are the top-required skills, reinforcing their importance in data manipulation and analysis.

📈 **Excel Still Holds Value** – Excel appears in 227 job postings, highlighting its continued relevance for reporting and data handling.

🔍 **Data Science Tools on the Rise** – R (190) and Tableau (177) are also in high demand, suggesting an increasing need for statistical analysis and data visualization skills.

| Skills  | Demand Count|
|---------|-------------|
| SQL     | 574         |
| Python  | 562         |
| Excel   | 256         |
| R       | 194         |
| Tableau | 184         |

![top-paying-skils](/jobs_data_2025/learning_jobs_searching/assets/top-demand-skills.png)

*Table of the demand for the top 5 skills in Junior Data job postings*

## 4. Skills Based on Salary

Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
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
```

### Here's a breakdown of the results for top paying skills for Junior Data roles:

✅ **Top-Paying Data Engineering & Development Skills**

High salaries are linked to C#, Flow and SQL Server, highlighting the value of software development and database expertise.

![top-paying-skils](/jobs_data_2025/learning_jobs_searching/assets/top-paying-skills-4.png)

📊 **Statistical & Cloud Technologies Drive Earnings**

Skills like SPSS, R, SAS, Azure, and Databricks command competitive salaries, showing the demand for statistical analysis and cloud-based solutions.

📁 **Business & Productivity Tools Add Value**

Tools like Jira, Confluence, Outlook, and SharePoint rank high, proving that project management and collaboration skills can boost earning potential.

| 🏆 Skills     | 💰 Avg Salary ($) |
|-------------|------------------|
| **C#**        | 115,000          |
| **Flow**      | 115,000          |
| **SQL Server** | 115,000          |
| **SPSS**      | 100,000          |
| **Azure**     | 87,500           |
| **T-SQL**     | 82,000           |
| **Outlook**   | 80,000           |
| **Jira**      | 80,000           |
| **Confluence** | 80,000           |
| **R**         | 79,375           |

*This analysis highlights the key skills that drive the highest salaries for entry-level data jobs.*

## 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
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
```

| 🔥 Skill  | 📊 Demand Count | 💰 Avg. Salary ($) |
|-----------|----------------|--------------------|
| SQL       | 574            | 77,250             |
| Python    | 562            | 75,368             |
| Excel     | 256            | 69,583             |
| R         | 194            | 79,375             |
| Tableau   | 184            | 71,786             |


*Table of the most optimal skills for Junior Data jobs sorted by Demand Count*

![optimal.](/jobs_data_2025/learning_jobs_searching/assets/optimal.png) 


### Here's a breakdown of the most optimal skills for Data Analysts in 2023:

**Most In-Demand Skill: 🔥 SQL**

Leads with 574 job postings, making it the most sought-after skill.


**Highest-Paid Skill: 💰 R** 

Has the highest average salary at $79,375, despite having fewer job postings (194).

**Balanced Demand & Salary: Python** 

Has a solid mix of both demand (562 postings) and a competitive salary ($75,368), making it a well-rounded choice.

**Excel’s Role: 📊 Excel** 

Has the lowest average salary ($69,583), but its demand (256) suggests it remains a relevant skill, likely as a supporting tool rather than a primary focus.

# What I learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

**🧩 Complex Query Crafting:** 

Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.

**📊 Data Aggregation:** 

Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.

**💡 Analytical Wizardry:** 

Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

## Insights

From the analysis, several general insights emerged:

1. **Top-Paying Data Jobs for Junior roles:** 
The highest-paying Junior Data roles reach up to $115,000, with the top positions in Data Engineering and Data Science.

2. **Skills for Top-Paying Jobs:** 
High-paying Junior Data Jobs require advanced proficiency in SQL and Python, suggesting that these are critical skills for earning a top salary.

3. **Most In-Demand Skills:** 
SQL and Python are also the most demanded skills in the Junior Data Job market, thus making them essential for job seekers.

4. **Skills with Higher Salaries:**
High salaries are linked to C#, SQL Server, and Flow, highlighting the value of software development and database expertise.

5. **Optimal Skills for Job Market Value:** 
SQL is the most in-demand skill with 574 job postings, while Python offers a strong balance of demand (562) and salary ($75,368). Excel remains relevant with 256 postings but has the lowest average salary ($69,583), likely serving as a supporting tool.

## Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the Junior Data Job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring Data Nerds can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of Data Field.
