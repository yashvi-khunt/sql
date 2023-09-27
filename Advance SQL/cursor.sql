--CURSOR

USE MOVIES_W3

select act_fname,act_lname,mov_title,mov_year from movie m
inner join movie_cast mc
on m.mov_id=mc.mov_id
inner join actor a
on a.act_id=mc.act_id
where not mov_year between 1990 and 2000

-- declare cursor
DECLARE cursor_temp CURSOR FOR
	select act_fname,act_lname,mov_title,mov_year from movie m
	inner join movie_cast mc
	on m.mov_id=mc.mov_id
	inner join actor a
	on a.act_id=mc.act_id
	where not mov_year between 1990 and 2000
 
-- open cursor
OPEN cursor_temp;
 
-- declare variables used in cursor
DECLARE @act_fname VARCHAR(128);
DECLARE @act_lname VARCHAR(128);
DECLARE @mov_title VARCHAR(128);
DECLARE @mov_year int;

-- loop through a cursor
FETCH NEXT FROM cursor_temp INTO @act_fname,@act_lname,@mov_title,@mov_year;
WHILE @@FETCH_STATUS = 0
    BEGIN
    PRINT CONCAT('act_fname: ', @act_fname, ' / act_lname: ', @act_lname, ' / mov_title: ', @mov_title, ' / mov_year: ', @mov_year);
    FETCH NEXT FROM cursor_temp INTO @act_fname,@act_lname,@mov_title,@mov_year;
    END;
 
-- close and deallocate cursor
CLOSE cursor_temp;
DEALLOCATE cursor_temp;