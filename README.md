## Pewlett-Hackard "Silver Tsunami" Analysis Overview
This analysis tries to anticipate the number of current employees who might retire soon. Based on the age of the employee (using birth_year in the employees table) and filtering for employees who are currently employed by the organization(using to_date dept_emp table), I've generated three lists which will help the organization anticipate the overall impact to resourcing and business, any resulting management vaccuums, and finally a list of indivuals who would benefit from mentorship if the retiring employees were to stay on as business guides for younger leaders.


## Final Deliverables:
1. Retirement_titles.csv -- a comprehensive list of all current employees that may be retiring along with all titles they had while employed.
2. unique_titles.csv -- a comprehensive list of all current employees that may be retiring along with their current title.
2. retiring_titles.csv -- a count of potential retirees grouped by title.
3. mentorship_eligibility.csv -- a list of individuals who may benefit from a mentorship program (based on age).


## Resources
- Data Sources: titles.csv, salaries.csv, employees.csv, dept_manager.csv, dept_emp.csv, departments.csv
- Software: VS Code, PGAdmin, Postgres SQL
- Assistance and detailed walk through: Columbia Data Analysis Bootcamp


## Summary
This analysis answers the following two questions:
1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
    If the organization fills roles on a direct 1-to-1 basis then there will be 33,118 open heads to resource against (count found in unique_titles.csv). However, given the top heavy nature of the retirees' titles, this will be a difficult aim. The company should take the opportunity to reassess the organization's structure and requirements before attempting to fill each vacancy.
2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
    Yes, there are enough employees to function as mentors however the current list of those who would be mentored is quite small: only 1549 employees qualify with current standards (count found in mentorship_eligibility.csv). Management should expand the definition of those that are qualified to be mentored.

Additionally, outside of the initial questions, I've provided a department level analysis here. It appears that development and production departments pose the largest organizational risk given the number of older employees in each. Large scale employee departures in these departments could be paralyzing to the company as they are foundational elements in terms of output, supply and resulting revenue. These additional queries can be found in the sql file and tables with counts are seen below.


## High-level Findings by the numbers
1. 33,118 current employees are potentially retiring in the very near future (unique_titles.csv)
2. By title, Senior Engineers and Senior Staff will be impacted the most with 13,651 and 12,872 retirees respectively. Senior Engineering roles would be a particularly difficult knowledge and skill gap to overcome if all exits were immediate and/or stimultaneous. (retiring_titles.csv)
3. Only 1549 current employees qualify to be mentored given current eligibility standards. (mentorship_eligibility.csv)
4. The 33,118 potential retirees have a vast amount of instiutional knowledge, having had 1.65 titles on average amongst the group. (retirement_titles.csv, unique_titles.csv)
5. 9,281 retirees are in development and 8,174 are in production


## Recommendations
If all or most of the potential retirees listed in retirement_titles.csv did retire, the organization would be greatly impacted. A lengthier, staggered, exit for most of these employees would be in the company's benefit. By offering these individuals part-time hours which would include mentorship of younger leaders within the organization: the company could stave off any knowledge gaps and an impending vacuum in managerial roles.
