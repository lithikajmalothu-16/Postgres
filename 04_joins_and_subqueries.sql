--INNER JOIN:
--How can you produce a list of the start times for bookings by members named 'David Farrell'?

-- 'bks' & 'mems' is the alias name.
-- alias should be after the table NAME and before the row.
SELECT bks.starttime FROM cd.bookings bks  
INNER JOIN cd.members mems 
ON mems.memid = bks.memid
WHERE mems.firstname = 'David' and mems.surname = 'Farrell';        

--How can you produce a list of the start times for bookings for tennis courts, 
--for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.


---INNER JOIN, SQL treats the two separate tables as one big combined table for the duration of that query.
-- Because they are joined, you can freely select columns from either table in your SELECT clause, 
--regardless of which table you listed first in the FROM clause

SELECT bks.starttime as start, facs.name as name  -- new column names.
FROM cd.bookings bks -- can be cd.facilities facs
INNER JOIN cd.facilities facs ON facs.facid = bks.facid
WHERE facs.name in ('Tennis Court 1','Tennis Court 2')
AND bks.starttime >= '2012-09-21' AND bks.starttime < '2012-09-22'
ORDER BY bks.starttime;



---How can you output a list of all members who have recommended another member? 
---Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

select distinct recs.firstname as firstname, recs.surname as surname
	from 
		cd.members mems
		inner join cd.members recs
			on recs.memid = mems.recommendedby
order by surname, firstname;  


---How can you output a list of all members, including the individual 
--who recommended them (if any)? Ensure that results are ordered by (surname, firstname).

select mems.firstname as memfname, mems.surname as memsname, recs.firstname as recfname, recs.surname as recsname
	from 
		cd.members mems
		left outer join cd.members recs
			on recs.memid = mems.recommendedby
order by memsname, memfname; 