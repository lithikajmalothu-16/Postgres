---Exercise 3: How can you produce a list of facilities that charge a fee to members?
select * from cd.facilities where membercost>0;

--Exercise 4: How can you produce a list of facilities that charge a fee to members, 
--and that fee is less than 1/50th of the monthly maintenance cost? 
---Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

select facid, name, membercost, monthlymaintenance 
	from cd.facilities 
	where 
		membercost > 0 and 
		(membercost < monthlymaintenance/50.0);          

---Exercise 5:How can you produce a list of all facilities with the word 'Tennis' in their name?
---use single quotes to match the terms, and % symbol to return the word (even if extra terms are surrounding it.)
select *from cd.facilities where name like '%Tennis%'; 

---Exercise 6: How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
--with OR:
select * from cd.facilities where facid = 1 or facid= 5;
--without OR:
select * from cd.facilities 
where facid in (1,5);


---Exercise 7: How can you produce a list of facilities, with each labelled as 'cheap' 
---or 'expensive' depending on if their 
---monthly maintenance cost is more than $100? Return the name and monthly maintenance 
---of the facilities in question.

select name, 
	case when (monthlymaintenance > 100) then
		'expensive'
	else
		'cheap'
	end as cost
	from cd.facilities;          

--The CASE statement functions like an if/switch statement, allowing you to add conditional WHEN..
--.THEN sections.
--The AS operator is used to rename columns 
--or expressions (like naming a new column cost) for better display and easier subquery reference.

---Excercise 8: How can you produce a list of members who joined after the start of September 2012? 
--Return the memid, surname, firstname, and joindate of the members in question.

select memid, surname, firstname, joindate 
	from cd.members
	where joindate >= '2012-09-01';          


--Excercise 9:How can you produce an ordered list of 
--the first 10 surnames in the members table? The list must not contain duplicates.

select distinct surname 
	from cd.members
order by surname
limit 10;          

