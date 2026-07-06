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
WHERE facs.name in ('Tennis Court 1','Tennis Court 2') -- eliminating everything that else that does not include Tennis Court
AND bks.starttime >= '2012-09-21' AND bks.starttime < '2012-09-22' -- 21st (including this day) and after, and before 22nd.
ORDER BY bks.starttime; 
-- order by : displayed in ascending order of time.


---How can you output a list of all members who have recommended another member? 
---Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

SELECT distinct recs.firstname as firstname, recs.surname as surname -- we use the new alias named table as output belongs to the new table.
FROM cd.members mems 
INNER JOIN cd.members recs ON  -- to create another copy of the same table-> use a different alias.
recs.memid = mems.recommendedby --(this was the original name of the row)
ORDER BY surname, firstname;


---How can you output a list of all members, including the individual 
--who recommended them (if any)? Ensure that results are ordered by (surname, firstname).

select mems.firstname as memfname, mems.surname as memsname, recs.firstname as recfname, recs.surname as recsname
	from 
		cd.members mems
		left outer join cd.members recs
			on recs.memid = mems.recommendedby
order by memsname, memfname; 


---How can you produce a list of all members who have used a tennis court? 
--Include in your output the name of the court, and the name of the member formatted as a single column. 
--Ensure no duplicate data, and order by the member name followed by the facility name.

select distinct mems.firstname || ' ' || mems.surname as member, facs.name as facility
	from 
		cd.members mems
		inner join cd.bookings bks
			on mems.memid = bks.memid
		inner join cd.facilities facs
			on bks.facid = facs.facid
	where
		facs.name in ('Tennis Court 2','Tennis Court 1')
order by member, facility 

--How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? 
--Remember that guests have different costs to members (the listed costs are per half-hour 'slot'),and the guest user is always ID 0. 
--Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. 
--Order by descending cost, and do not use any subqueries.

select mems.firstname || ' ' || mems.surname as member, 
	facs.name as facility, 
	case 
		when mems.memid = 0 then
			bks.slots*facs.guestcost
		else
			bks.slots*facs.membercost
	end as cost
        from
                cd.members mems                
                inner join cd.bookings bks
                        on mems.memid = bks.memid
                inner join cd.facilities facs
                        on bks.facid = facs.facid
        where
		bks.starttime >= '2012-09-14' and 
		bks.starttime < '2012-09-15' and (
			(mems.memid = 0 and bks.slots*facs.guestcost > 30) or
			(mems.memid != 0 and bks.slots*facs.membercost > 30)
		)
order by cost desc;  


--How can you produce a list of all members who have used a tennis court? Include in your output 
--the name of the court, and the name of the member formatted as a single column. 
--Ensure no duplicate data, and order by the member name followed by the facility name.

select distinct mems.firstname || ' ' || mems.surname as member, facs.name as facility
	from 
		cd.members mems
		inner join cd.bookings bks
			on mems.memid = bks.memid
		inner join cd.facilities facs
			on bks.facid = facs.facid
	where
		facs.name in ('Tennis Court 2','Tennis Court 1')
order by member, facility 



---How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) 
--more than $30? Remember that guests have different costs to members (the listed costs are per half-hour 'slot'),
-- and the guest user is always ID 0. Include in your output the name of the facility, the name of the member 
--formatted as a single column, and the cost. Order by descending cost, and do not use any subqueries.

select mems.firstname || ' ' || mems.surname as member, 
	facs.name as facility, 
	case 
		when mems.memid = 0 then
			bks.slots*facs.guestcost
		else
			bks.slots*facs.membercost
	end as cost
        from
                cd.members mems                
                inner join cd.bookings bks
                        on mems.memid = bks.memid
                inner join cd.facilities facs
                        on bks.facid = facs.facid
        where
		bks.starttime >= '2012-09-14' and 
		bks.starttime < '2012-09-15' and (
			(mems.memid = 0 and bks.slots*facs.guestcost > 30) or
			(mems.memid != 0 and bks.slots*facs.membercost > 30)
		)
order by cost desc;   