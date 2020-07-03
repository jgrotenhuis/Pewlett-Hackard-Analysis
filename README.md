# Pewlett-Hackard-Analysis

Bobby's manager needs a variety of insights in order to first understand how many all up employees are going to retire soon and then to see that broken down by various attributes, such as title, birth date, etc.  It sounds like a large portion of a company's workforce retiring all at once can have a variety of downsides, from brain/work experience drain to incurred costs depending on whether or not the company has promised pensions and other retirement-IOUs.   Helping Pewlett Hackard prepare for this will be crucial, so understanding the scale and nature of this "silver tsunami" as well as how to keep their senior talent engaged for longer in the company through a mentorship program.  


>>> 1st Technical Deliverable <<< 

I identified and created table(s0 for the following:

1) showing number of [titles] retiring
2) one showing number of employees with each title
3) one showing a list of current employees born between Jan. 1, 1952 and Dec. 31, 1955

General Query Explanation
After creating the query and new table for the 1st item above, then I build queries for the following questions based on the new tables created.  Each time I created a new table, I had to use that to answer the following question, so they each built on each other.  In summary, I started this challenge with all the data I needed but they were in different tables and not filtered.

My Findings
1) After removing dupe profiles, I realized that a pretty large sum of employees have been promoted over the years
2) After doing a count of total employees who are retiring by title, I found that 41,380 employees are nearing retirement and that a large number of them are nearing retirement with senior job titles like staff.  


>>> 2nd Technical Deliverable <<<

I identified and created table(s) for the following:
1) show the number of employees who are eligible for the mentorship program

General Query Explanation
I accessed data from three tables: employees, dept_emp, and titles to get the answers that I needed and then used partition (I.e. dupe removal) to get rid of the duplicate profiles.

My findings:

1) 1,940 employees are eligible for the mentorship program.


Further Analysis Recommendation
1) I would suggest looking into the company's pension plans and other IOUs to see how much money the company can save by keeping people still on payroll in a limited capacity like 0.5 FTE that way they can delay pension payouts or other IOUs. This would require doing additional joins from new tables that would include sensitive information and probably some high level approvals for access. 

Extras
1) I also learned how to use CONCAT to combine column headers like first_name and last_name

