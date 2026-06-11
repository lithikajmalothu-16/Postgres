--Excersice 10:a combined list of all surnames and all facility names. Yes, this is a contrived example 
select surname from cd.members union select name from cd.facilities;
-- the union in sql acts like 'and' in python 


---Excersice 11: You'd like to get the signup date of your last member. How can you retrieve this information?
select max(joindate) as latest from cd.members;
-- max (column_name) provides the most recent information.
-- "as" lets us name the output column.