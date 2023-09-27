select * from rating order by mov_id
--write a SQL query to find the name of all reviewers who have rated their ratings with a NULL value. Return reviewer name.
select rev_name from reviewer
inner join rating	
on reviewer.rev_id = rating.rev_id
where num_o_ratings is null or num_o_ratings = ''

--write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role. 
select act_fname,act_lname,role from movie m
inner join movie_cast movc
on m.mov_id=movc.mov_id
inner join actor act
on act.act_id = movc.act_id
where mov_title='annie hall'

--write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. Return director first name, last name and movie title.
select dir_fname,dir_lname,mov_title from movie m
inner join movie_direction md
on m.mov_id=md.mov_id
inner join director dir
on dir.dir_id = md.dir_id
where mov_title='eyes wide shut'

--write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.
select dir_fname,dir_lname,mov_title from movie m
inner join movie_direction md
on m.mov_id=md.mov_id
inner join director dir
on dir.dir_id = md.dir_id
inner join movie_cast as movc
on movc.mov_id=m.mov_id
where role='Sean Maguire'


--write a SQL query to find the actors who have not acted in any movie between 1990 and 2000 (Begin and end values are included.). Return actor first name, last name, movie title and release year.
select act_fname,act_lname,mov_title,mov_year from movie m
inner join movie_cast mc
on m.mov_id=mc.mov_id
inner join actor a
on a.act_id=mc.act_id
where not mov_year between 1990 and 2000

--write a SQL query to find the directors with number of genres movies. Group the result set on director first name, last name and generic title. Sort the result-set in ascending order by director first name and last name. Return director first name, last name and number of genres movies.

 select */*dir_fname as firstName,dir_lname as lastName,count(mg.gen_id) as countGen*/ from director as d
inner join movie_direction as md
on md.dir_id = d.dir_id
inner join movie_genres as mg
on mg.mov_id = md.mov_id
inner join genres as g 
on g.gen_id=mg.gen_id
group by dir_fname,dir_lname,mg.gen_id
order by dir_fname,dir_lname



--write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.
select mov_title,mov_year,gen_title from movie as m
inner join movie_genres as mg
on mg.mov_id = m.mov_id
inner join genres as g
on g.gen_id=mg.gen_id


--write a SQL query to find all the movies with year, genres, and name of the director.
select mov_title,mov_year,gen_title from movie as m
inner join movie_genres as mg
on mg.mov_id = m.mov_id
inner join genres as g
on g.gen_id=mg.gen_id
inner join movie_direction as md
on md.mov_id=m.mov_id
inner join director as d
on d.dir_id = md.dir_id


--write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release. Return movie title, release year, date of release, duration, and first and last name of the director.
select mov_title,year(mov_dt_rel) as [release year],mov_year,mov_dt_rel,mov_time as duration,CONCAT_WS(' ',dir_fname,dir_lname)as [director name] from movie
inner join movie_direction as md
on md.mov_id = movie.mov_id
inner join director as d
on d.dir_id=md.dir_id
where mov_dt_rel < '1-01-1989'
order by mov_dt_rel desc


--write a SQL query to compute the average time and count number of movies for each genre. Return genre title, average time and number of movies for each genre.
select gen_title,avg(mov_time) as [avg time],count(*) as [number of movies] from movie_genres mg
inner join movie m
on m.mov_id=mg.mov_id
inner join genres g
on g.gen_id = mg.gen_id
group by g.gen_id,gen_title


-- write a SQL query to find movies with the lowest duration. Return movie title, movie year, director first name, last name, actor first name, last name and role.
select mov_title,mov_year,CONCAT_WS(' ',dir_fname,dir_lname)as directorName,CONCAT_WS(' ',act_fname,act_lname)as actorName,role from movie m
inner join movie_direction md
on md.mov_id = m.mov_id
inner join director d
on d.dir_id=md.dir_id
inner join movie_cast mc
on mc.mov_id=m.mov_id
inner join actor a
on a.act_id = mc.act_id
where mov_time = (select min(mov_time) from movie)

--write a SQL query to find those years when a movie received a rating of 3 or 4. Sort the result in increasing order on movie year. Return movie year. 
select mov_year from movie m
inner join rating r
on m.mov_id=r.mov_id
where rev_stars = 3 or rev_stars = 4
order by mov_year


--write a SQL query to get the reviewer name, movie title, and stars in an order that reviewer name will come first, then by movie title, and lastly by number of stars.
select rev_name,mov_title,rev_stars from movie m
inner join rating r
on m.mov_id=r.mov_id
inner join reviewer rev
on rev.rev_id=r.rev_id

--write a SQL query to find those movies that have at least one rating and received highest number of stars. Sort the result-set on movie title. Return movie title and maximum review stars.
select mov_title,rev_stars,countOfRev from (select r.mov_id as mov_id,count(rev_stars)as countOfRev from movie m
								 inner join rating r
								 on m.mov_id=r.mov_id
								 group by r.mov_id
								 having count(rev_stars)> 0) as result
inner join movie m
on m.mov_id=result.mov_id
inner join rating r
on r.mov_id=m.mov_id
where rev_stars = (select max(rev_stars) from rating)
order by mov_title

--write a SQL query to find those movies, which have received ratings. Return movie title, director first name, director last name and review stars.
select mov_title,dir_fname,dir_lname,rev_stars from movie m
inner join rating r
on m.mov_id=r.mov_id
inner join movie_direction as md
on md.mov_id=m.mov_id
inner join director d
on d.dir_id=md.dir_id

--Write a query in SQL to find the movie title, actor first and last name, and the role for those movies where one or more actors acted in two or more movies. 
select mov_title,act_fname,act_lname,role from movie m
inner join movie_cast mc
on m.mov_id=mc.mov_id
inner join actor a
on a.act_id=mc.act_id
inner join (select act_id from movie_cast
					group by act_id
					having COUNT(mov_id) > 1) as result
on result.act_id=a.act_id