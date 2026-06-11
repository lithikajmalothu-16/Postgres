--Excersice 10:a combined list of all surnames and all facility names. Yes, this is a contrived example 
select surname from cd.members union select name from cd.facilities;
-- the union in sql acts like 'and' in python 
