# Employee Analysis & Dashboard
Data manipulation & visualization using SQL & PowerBI.

## Data
SQL dataframe consists of 7 interconnected tables.
![image](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/assets/170541567/9f069fd8-3ee0-40e7-9c69-c0872f7be8f6)

## SQL Queries
6 queries to manipulate and extract data for a total of 11 charts. [Find SQL file here](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/blob/main/SQL%20Queries.sql)

## Exported CSV Files
These are the CSV files exported:

- [Chart 1](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/blob/main/Chart%201.csv)
- [Chart 2](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/blob/main/Chart%202.csv)
- [Chart 2 Manipulated](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/blob/main/Chart%202%20Manipulated.csv)
- [Chart 3](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/blob/main/Chart%203.csv)
- [Chart 4, 8, 9](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/blob/main/Chart%204%2C8(part2)%2C9.csv)
- [Chart 7](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/blob/main/Chart%207.csv)
- [Chart 6, 8, 10, 11](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/blob/main/Chart%208%2C10%2C11%2C6.csv)

## Power BI Dashboard
Two dashboards, namely Attrition & Gender Gap Analysis. [Find Workbook here](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/blob/main/Employee%20Dashboard.pbix)

## Attrition Analysis Dashboard
![image](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/assets/170541567/36c7f15d-d2ef-4507-bf4f-218b98a38bba)

### Charts
1. **Employees Hired and Quit Over the Years:** Line chart showing the number of employees hired (blue) and quit (purple) from 1985 to 2000.
2. **Average Salary Over the Years:** Line chart depicting average salaries for various job titles from 1985 to 2000, with each title represented by different colors.
3. **Salary Distribution for the Year 2000 (Department):** Pie chart illustrating the 2000 salary distribution by department, each represented by a unique color.
4. **Salary Distribution for the Year 2000 (Title):** Pie chart showing the 2000 salary distribution by job title, each represented by a different color.
5. **Years Spent by Employees Before Quitting:** Bar chart displaying the number of male and female employees who quit after various tenures (0-3, 3-6, 6-9, 9-12, 12-15, 15-16 years).
6. **Attrition (2000):** Stacked bar chart depicting 2000 attrition rates by job title across different departments.
7. **Employee Lifecycle:** Horizontal bar chart showing the average tenure of employees in each job title before quitting.

### Insights & Recommendations from the Dashboard
**Insight 1:** The number of hires has steadily declined, while the number of employees quitting has increased.

**Recommendations:**
1. Improve Retention Strategies: Develop and execute targeted retention strategies to address the root causes of increased attrition.
2. Recruitment Boost: Intensify recruitment efforts to balance the workforce and mitigate the impact of higher attrition.

**Insight 2:** Average salaries have slightly declined over the years, which is concerning given inflationary trends.

**Recommendations:**
1. Competitive Compensation: Regularly evaluate and adjust compensation packages to ensure market competitiveness.
2. Enhance Benefits: Introduce or enhance non-monetary benefits to supplement stagnant salaries.

**Insight 3:** High attrition rates are observed among staff and senior staff in support departments, as well as among engineers and senior engineers in core departments (production, development, and quality service).

**Recommendations:**
1. Employee Surveys: Conduct surveys to understand the root causes of high attrition specifically tailored for each title and act on employee feedback to address issues.
2. Career Development Initiatives: Implement comprehensive career development and progression plans for engineers and senior engineers, staff, and support staff.

**Insight 4:** A significant number of employees quit between 6 to 12 years, despite the average employee lifecycle showing approximately 12 years in each role.

**Recommendations:**
1. Mid-Career Support: Provide additional support and development opportunities for employees in the 6 to 12-year tenure range.
2. Recognition Programs: Implement targeted recognition and reward programs for long-term employees to enhance morale and retention.
3. Succession Planning: Develop and execute succession planning initiatives to ensure career progression and reduce mid-career attrition.

## Gender Dashboard
![image](https://github.com/Soundaryamerak/Employee-Dashboard-SQL-PowerBI-Logistics/assets/170541567/dcdcb357-3a78-4610-8428-de1e175b7deb)

### Charts
1. **Gender Ratio (Department):** Pie chart displaying the gender ratio across various departments, with each department represented by a unique color.
2. **Female & Male Employees:** Gauge chart showing the total number of female and male employees.
3. **Number of Employees:** Bar chart displaying the number of active male and female employees across different departments as of the year 2000.
4. **Gender Ratio (Title):** Pie chart illustrating the gender ratio across various job titles, with each title represented by a different color.
5. **Average Salary (Department):** Bar chart showing the average salary for male and female employees across different departments.
6. **Average Salary (Title):** Bar chart displaying the average salary for male and female employees across various job titles.

### Insights and Recommendations
**Insight 1:** The overall gender ratio is 150%, indicating a significant gender imbalance, with ratios ranging from 140% to 158% across most departments and titles, except for Managers at 84%.

**Recommendations:**
1. Gender Balance Initiatives: Implement targeted recruitment and retention strategies to achieve a more balanced gender ratio across departments and titles.
2. Diversity Programs: Launch diversity and inclusion programs to address the gender imbalance and create a more equitable workplace.
3. Monitor and Report: Regularly monitor and report on gender ratio metrics to track progress and identify areas needing further attention.
4. Female Recruitment Focus: Develop and execute recruitment campaigns aimed at increasing the number of female employees in underrepresented departments.
5. Mentorship Programs: Establish mentorship and support programs to encourage and support female employees in their career growth.
6. Inclusive Culture: Foster an inclusive workplace culture that attracts and retains female talent through policies and practices that support work-life balance and career advancement.

**Insight 2:** There is a significant pay disparity for managers, where despite having a higher number of female managers, their average salary is lower than that of male managers.

**Recommendations:**
1. Salary Review: Conduct a comprehensive salary review to identify and rectify pay disparities between male and female managers.
2. Equal Pay Policy: Implement and enforce an equal pay policy to ensure fair compensation practices across all job titles and departments.
3. Transparency and Communication: Increase transparency in salary structures and communicate the organization's commitment to pay equity to all employees.
