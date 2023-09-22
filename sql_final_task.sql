select * from actor
select * from director
select * FROM genres
select * from movie
select * from reviewer
select * from rating



--Write a SQL query to find the name and year of the movies. Return movie title, movie release year.
select mov_title,mov_year from movie


--write a SQL query to find when the movie ‘American Beauty’ released. Return movie release year.
select mov_year from movie
where mov_title='american beauty'

-- write a SQL query to find the movie, which was made in the year 1999. Return movie title.
select mov_title from movie
where mov_year=1999


-- write a SQL query to find those movies, which was made before 1998. Return movie title.
select mov_title from movie
where mov_year<1999


--write a SQL query to find the name of all reviewers and movies together in a single list.
select mov_title,rev_name from rating
inner join movie
on movie.mov_id = rating.mov_id
inner join reviewer
on reviewer.rev_id=rating.rev_id


--write a SQL query to find all reviewers who have rated 7 or more stars to their rating. Return reviewer name.
select rev_name from  (select rating.rev_id from rating
group by rating.rev_id
having SUM(rev_stars) > 7) as t1
inner join reviewer
on reviewer.rev_id = t1.rev_id

--write a SQL query to find the movies without any rating. Return movie title.
Select mov_title from rating
inner join movie
on movie.mov_id=rating.mov_id
where num_o_ratings is null 


--write a SQL query to find the movies with ID 905 or 907 or 917. Return movie title.
select * from movie
where mov_id=905 or mov_id =907 or mov_id=917

--write a SQL query to find those movie titles, which include the words 'Boogie Nights'. Sort the result-set in ascending order by movie year. Return movie ID, movie title and movie release year.
select mov_id,mov_title,mov_year from movie
where mov_title like '%boogie Nights%'
order by mov_year


--write a SQL query to find those actors whose first name is 'Woody' and the last name is 'Allen'. Return actor ID
select act_id from actor
where act_fname='woody' and act_lname='allen'