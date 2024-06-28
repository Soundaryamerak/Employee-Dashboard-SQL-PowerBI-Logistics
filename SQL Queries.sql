-- CHART 1
SELECT 
    COALESCE(h.year, l.year) AS year,
    COALESCE(h.hired, 0) AS no_of_employees_hired,
    COALESCE(l.quit, 0) AS no_of_employees_quit
FROM 
    (SELECT 
         YEAR(hire_date) AS year,
         COUNT(emp_no) AS hired
     FROM 
         employees
     WHERE
         employment_status = 'active'
     GROUP BY 
         YEAR(hire_date)
    ) AS h
LEFT JOIN
    (SELECT 
         YEAR(to_date) AS year,
         COUNT(dept_emp.emp_no) AS quit
     FROM 
         dept_emp
     JOIN
         employees ON dept_emp.emp_no = employees.emp_no
     WHERE 
         to_date <> '9999-01-01' 
         AND employment_status = 'inactive'
     GROUP BY 
         YEAR(to_date)
    ) AS l
ON 
    h.year = l.year

UNION

SELECT 
    COALESCE(h.year, l.year) AS year,
    COALESCE(h.hired, 0) AS no_of_employees_hired,
    COALESCE(l.quit, 0) AS no_of_employees_left
FROM 
    (SELECT 
         YEAR(hire_date) AS year,
         COUNT(emp_no) AS hired
     FROM 
         employees
     WHERE
         employment_status = 'active'
     GROUP BY 
         YEAR(hire_date)
    ) AS h
RIGHT JOIN
    (SELECT 
         YEAR(to_date) AS year,
         COUNT(dept_emp.emp_no) AS quit
     FROM 
         dept_emp
     JOIN
         employees ON dept_emp.emp_no = employees.emp_no
     WHERE 
         to_date <> '9999-01-01' 
         AND employment_status = 'inactive'
     GROUP BY 
         YEAR(to_date)
    ) AS l
ON 
    h.year = l.year

ORDER BY 
    year;

-- CHART 8,10,11,6
SELECT 
    t.title,
    SUM(s.salary) AS total_salary_paid,
    AVG(CASE WHEN e.gender = 'M' THEN s.salary END) AS average_salary_male,
    AVG(CASE WHEN e.gender = 'F' THEN s.salary END) AS average_salary_female,
    (COUNT(CASE WHEN e.gender = 'M' THEN 1 END) / COUNT(CASE WHEN e.gender = 'F' THEN 1 END) * 100) AS gender_ratio,
    AVG(
        CASE 
            WHEN e.employment_status = 'active' THEN DATEDIFF('2003-01-01', e.hire_date)
            ELSE DATEDIFF(t.to_date, e.hire_date)
        END / 365
    ) AS average_years_spent
FROM 
    employees e
JOIN 
    titles t ON e.emp_no = t.emp_no
JOIN 
    salaries s ON e.emp_no = s.emp_no
WHERE 
    s.to_date = '9999-01-01' 
GROUP BY 
    t.title
ORDER BY 
    t.title;



-- CHART 4,8,9
SELECT 
    d.dept_name AS Department,
    COUNT(CASE WHEN e.gender = 'M' THEN e.emp_no END) AS current_active_male_employees,
    COUNT(CASE WHEN e.gender = 'F' THEN e.emp_no END) AS current_active_female_employees,
    AVG(CASE WHEN e.gender = 'M' THEN s.salary END) AS average_salary_male,
    AVG(CASE WHEN e.gender = 'F' THEN s.salary END) AS average_salary_female,
    SUM(s.salary) AS total_salary_paid,
    (COUNT(CASE WHEN e.gender = 'M' THEN 1 END) / COUNT(CASE WHEN e.gender = 'F' THEN 1 END) * 100) AS gender_ratio
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
JOIN 
    salaries s ON e.emp_no = s.emp_no
WHERE 
    e.employment_status = 'active'
    AND s.to_date = '9999-01-01' 
GROUP BY 
    d.dept_name
ORDER BY 
    d.dept_name;

-- Chart 3 
SELECT 
    years_range,
    COUNT(CASE WHEN gender = 'M' THEN 1 END) AS no_of_male_employees_who_left,
    COUNT(CASE WHEN gender = 'F' THEN 1 END) AS no_of_female_employees_who_left
FROM 
    (
        SELECT 
            e.emp_no,
            e.gender,
            (DATEDIFF(t.to_date, e.hire_date) / 365) AS years_spent,
            CASE 
                WHEN DATEDIFF(t.to_date, e.hire_date) / 365 BETWEEN 0 AND 3 THEN '0 to 3'
                WHEN DATEDIFF(t.to_date, e.hire_date) / 365 BETWEEN 3 AND 6 THEN '3 to 6'
                WHEN DATEDIFF(t.to_date, e.hire_date) / 365 BETWEEN 6 AND 9 THEN '6 to 9'
                WHEN DATEDIFF(t.to_date, e.hire_date) / 365 BETWEEN 9 AND 12 THEN '9 to 12'
                WHEN DATEDIFF(t.to_date, e.hire_date) / 365 BETWEEN 12 AND 15 THEN '12 to 15'
                WHEN DATEDIFF(t.to_date, e.hire_date) / 365 BETWEEN 15 AND 18 THEN '15 to 18'
                ELSE '18+'
            END AS years_range
        FROM 
            employees e
        JOIN 
            titles t ON e.emp_no = t.emp_no
        WHERE 
            e.employment_status = 'inactive'
    ) AS subquery
GROUP BY 
    years_range
ORDER BY 
    years_range;



-- CHART 7
SELECT 
    YEAR(e.hire_date) AS year,
  
    AVG(CASE WHEN t.title = 'Assistant Engineer' THEN s.salary ELSE NULL END) AS avg_salary_assistant_engineer,
    AVG(CASE WHEN t.title = 'Engineer' THEN s.salary ELSE NULL END) AS avg_salary_engineer,
    AVG(CASE WHEN t.title = 'Manager' THEN s.salary ELSE NULL END) AS avg_salary_manager,
    AVG(CASE WHEN t.title = 'Senior Engineer' THEN s.salary ELSE NULL END) AS avg_salary_senior_engineer,
    AVG(CASE WHEN t.title = 'Senior Staff' THEN s.salary ELSE NULL END) AS avg_salary_senior_staff,
    AVG(CASE WHEN t.title = 'Staff' THEN s.salary ELSE NULL END) AS avg_salary_staff,
    AVG(CASE WHEN t.title = 'Technique Leader' THEN s.salary ELSE NULL END) AS avg_salary_technique_leader
FROM 
    employees e
JOIN
    titles t ON e.emp_no = t.emp_no
JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY 
    YEAR(e.hire_date);



-- CHART 2
SELECT 
    d.dept_name AS department,
    SUM(CASE WHEN t.title = 'Assistant Engineer' AND YEAR(de.to_date) = 2000 THEN 1 ELSE 0 END) AS "no. of Assistant Engineer who quit",
    SUM(CASE WHEN t.title = 'Engineer' AND YEAR(de.to_date) = 2000 THEN 1 ELSE 0 END) AS "no. of Engineer who quit",
    SUM(CASE WHEN t.title = 'Manager' AND YEAR(de.to_date) = 2000 THEN 1 ELSE 0 END) AS "no. of Manager who quit",
    SUM(CASE WHEN t.title = 'Senior Engineer' AND YEAR(de.to_date) = 2000 THEN 1 ELSE 0 END) AS "no. of Senior Engineer who quit",
    SUM(CASE WHEN t.title = 'Senior Staff' AND YEAR(de.to_date) = 2000 THEN 1 ELSE 0 END) AS "no. of Senior Staff who quit",
    SUM(CASE WHEN t.title = 'Staff' AND YEAR(de.to_date) = 2000 THEN 1 ELSE 0 END) AS "no. of Staff who quit",
    SUM(CASE WHEN t.title = 'Technique Leader' AND YEAR(de.to_date) = 2000 THEN 1 ELSE 0 END) AS "no. of Technique Leader who quit",
    COUNT(CASE WHEN YEAR(de.to_date) = 2000 THEN 1 ELSE NULL END) AS "total no. of employees who quit",
    COUNT(DISTINCT CASE WHEN (de.from_date <= '2000-01-01') AND (de.to_date >= '2000-01-01' OR de.to_date = '9999-01-01') THEN e.emp_no END) AS "total no. of active employees as of 01/01/2000"
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
JOIN 
    titles t ON e.emp_no = t.emp_no
WHERE 
    de.to_date IS NOT NULL AND (YEAR(de.to_date) = 2000 OR de.to_date = '9999-01-01')
GROUP BY 
    d.dept_name
ORDER BY 
    d.dept_name;

