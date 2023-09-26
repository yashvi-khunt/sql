select * from actor 
select * from director
select * FROM genres
select * from movie
select * from reviewer
select * from rating
select * from [dbo].[movie_cast]
select * from [dbo].[movie_direction]

--SUBQUERIES

--Find the actors who played a role in the movie 'Annie Hall'. Return all the fields of actor table.
/*
insert into movie_cast
values(102,911,null)
*/

select * from actor
where act_id = any (select act_id from movie_cast 
					where mov_id = any (select mov_id from movie
									where mov_title = 'Annie hall'))

-- write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. Return director first name, last name.
select dir_fname,dir_lname from director
where dir_id = any (select dir_id from movie_direction
				where mov_id = any (select mov_id from movie 
								where mov_title='eyes wide shut'))

--write a SQL query to find those movies, which released in the country besides UK. Return movie title, movie year, movie time, date of release, releasing country.
select * from movie where mov_rel_country<>'uk'


-- write a SQL query to find those movies where reviewer is unknown. Return movie title, year, release date, director first name, last name, actor first name, last name.

select mov_title,mov_year,mov_dt_rel,dir_fname,dir_lname,act_fname,act_lname
from movie as m 
inner join ( select director.dir_id,dir_fname,dir_lname,mov_id from director
			 inner join movie_direction
			 on movie_direction.dir_id = director.dir_id)as md
on md.mov_id=m.mov_id
inner join  ( select actor.act_id,act_fname,act_lname,mov_id from actor
			 inner join movie_cast
			 on movie_cast.act_id= actor.act_id)as act
on act.mov_id = m.mov_id
where m.mov_id = any(select mov_id from rating
				where rev_id = any(select rev_id from reviewer
								   where rev_name is null or rev_name=''))
				
--write a SQL query to find those movies directed by the director whose first name is ‘Woddy’ and last name is ‘Allen’. Return movie title. 
select * from movie as m
inner join ( select director.dir_id,dir_fname,dir_lname,mov_id from director
			 inner join movie_direction
			 on movie_direction.dir_id = director.dir_id)as md
on md.mov_id=m.mov_id
where dir_fname = 'woody'
and dir_lname='allen'

-- write a SQL query to find those years, which produced at least one movie and that, received a rating of more than three stars. Sort the result-set in ascending order by movie year. Return movie year.
select mov_year from movie 
where mov_id = any(select mov_id from rating
										where rev_stars > 3)
group by mov_year
having COUNT(mov_id)>=1
order by mov_year


-- write a SQL query to find those movies, which have no ratings. Return movie title.
select mov_title from movie 
where mov_id = any(select mov_id from rating
										where num_o_ratings is null or rev_stars='')

--write a SQL query to find those reviewers who have rated nothing for some movies. Return reviewer name.
select rev_name from reviewer
where rev_id = any(select rev_id from rating
					where num_o_ratings is null or rev_stars='')

--write a SQL query to find those movies, which reviewed by a reviewer and got a rating. Sort the result-set in ascending order by reviewer name, movie title, review Stars. Return reviewer name, movie title, review Stars.
select rev_name, mov_title,rev_stars from (select rev_name,mov_id,rev_stars from reviewer
											inner join rating
											on reviewer.rev_id=rating.rev_id
											where num_o_ratings is not null 
											and num_o_ratings <> '' 
											and rev_name <> '' ) as review,
movie 
where movie.mov_id=review.mov_id
order by rev_name,mov_title,rev_stars

--write a SQL query to find those reviewers who rated more than one movie. Group the result set on reviewer’s name, movie title. Return reviewer’s , movie title
select rev_name,mov_title from (select rev_id from rating
								group by rev_id
								having count(*) > 1) as rev
inner join rating
on rev.rev_id = rating.rev_id
inner join reviewer
on rev.rev_id = reviewer.rev_id
inner join movie
on movie.mov_id=rating.mov_id

-- write a SQL query to find those movies, which have received highest number of stars. Group the result set on movie title and sorts the result-set in ascending order by movie title. Return movie title and maximum number of review stars. 

select mov_title,rev_stars from rating
inner join movie
on rating.mov_id = movie.mov_id
where rev_stars = any (select max(rev_stars) from rating)
order by mov_title

-- write a SQL query to find all reviewers who rated the movie 'American Beauty'. Return reviewer name.
--insert into rating
--VALUES(914,9001,8.6,545341)

select rev_name from rating
inner join reviewer
on reviewer.rev_id=rating.rev_id
where mov_id = any(select mov_id from movie
				where mov_title='american beauty')

				----OR----

select rev_name 
from (select rev_name,mov_id from rating
	  inner join reviewer
	  on reviewer.rev_id=rating.rev_id) as rev 
inner join movie as m
on m.mov_id=rev.mov_id
where mov_title='American Beauty'

-- write a SQL query to find the movies, which have reviewed by any reviewer body except by 'Paul Monks'. Return movie title. 
select mov_id,mov_title from movie
where mov_id = any(select mov_id from rating
					inner join reviewer
					on reviewer.rev_id=rating.rev_id
					where rev_name <> 'paul monks')
--returns distinct movie names

				----OR----

--returns all values
select mov_title 
from (select mov_id from rating
	  inner join reviewer
	  on reviewer.rev_id=rating.rev_id
	  where rev_name <> 'paul monks') as rev 
inner join movie as m
on m.mov_id=rev.mov_id


--write a SQL query to find the lowest rated movies. Return reviewer name, movie title, and number of stars for those movies. 

select mov_title,rev_stars,rev_name
from movie as m
inner join (select mov_id,rev_stars,rev_name from rating
			inner join reviewer
			on reviewer.rev_id=rating.rev_id
			where rev_stars= any(select min(rev_stars) from rating)) as rev
on rev.mov_id=m.mov_id


select mov_title,rev_stars,rev_name from rating
inner join movie
on rating.mov_id = movie.mov_id
inner join reviewer
ON reviewer.rev_id=rating.rev_id
where rev_stars = any (select min(rev_stars) from rating)

-- write a SQL query to find the movies directed by 'James Cameron'. Return movie title. 

select mov_title from movie m
inner join movie_direction md
on md.mov_id=m.mov_id
where dir_id = any(select dir_id from director 
					where dir_fname='james' and dir_lname='cameron')

select mov_title from movie
inner join movie_direction as md
on md.mov_id=movie.mov_id
inner join director 
on md.dir_id=director.dir_id
where CONCAT(dir_fname,' ',dir_lname) = 'james cameron'

--Write a query in SQL to find the name of those movies where one or more actors acted in two or more movies.

select mov_title,act_id from movie
inner join movie_cast
on movie.mov_id = movie_cast.mov_id
where act_id = any (select act_id from movie_cast
					group by act_id
					having COUNT(mov_id) > 1)

