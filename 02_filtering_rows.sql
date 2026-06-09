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
---use single quotes to match the terms, and % symbol to return the word (even if extra terms are surrounding it).
select *from cd.facilities where name like '%Tennis%'; 