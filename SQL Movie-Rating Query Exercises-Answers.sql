-- SQL Movie-Rating Query Exercises

-- Q1
select title 
from movie 
where director = 'Steven Spielberg'


-- Q2
select year 
from movie 
where mid in (select mid from rating where stars in (4,5))
order by year asc


-- Q3
select title 
from movie 
where mid not in (select mid from rating)

-- Q4
select name 
from reviewer
where rid in (select rid from rating where ratingdate is null)

-- Q5
select 
	(select name from reviewer where rid=rating.rid) as rev_name, 
	(select title from movie where mid = rating.mid) as title,
	stars,
	ratingdate
from rating
order by rev_name , title , stars

-- Q6 on progress
select name , (select title from movie where mid = rt.mid)
from reviewer as rv
inner join rating as rt
using(rid)
inner join rating as rt2 
using(rid)
where rt.stars < rt2.stars 
	and rt.ratingdate < rt2.ratingdate and rt.mid = rt2.mid 

-- Q7
-- SQL Movie-Rating Query Exercises

-- Q1
select title 
from movie 
where director = 'Steven Spielberg'


-- Q2
select year 
from movie 
where mid in (select mid from rating where stars in (4,5))
order by year asc


-- Q3
select title 
from movie 
where mid not in (select mid from rating)

-- Q4
select name 
from reviewer
where rid in (select rid from rating where ratingdate is null)

-- Q5
select 
	(select name from reviewer where rid=rating.rid) as rev_name, 
	(select title from movie where mid = rating.mid) as title,
	stars,
	ratingdate
from rating
order by rev_name , title , stars

-- Q6 on progress
select name , (select title from movie where mid = rt.mid)
from reviewer as rv
inner join rating as rt
using(rid)
inner join rating as rt2 
using(rid)
where rt.stars < rt2.stars 
	and rt.ratingdate < rt2.ratingdate and rt.mid = rt2.mid 

-- Q7
select title , max(stars) as max_rate
from movie , rating 
where movie.mid = rating.mid 
group by title
order by title

-- Q8
select title , max(stars) - min(stars) as "rating spread"
from movie , rating 
where movie.mid = rating.mid 
group by title
order by "rating spread" desc , title

-- Q9
select 
	avg(a1.avgBeforeighty) - avg(a2.avgAftereighty)
from (select avg(stars) as avgBeforeighty
	from movie , rating
	where movie.mid = rating.mid and movie.year<1980
	group by title ) as a1 ,

	(select avg(stars) as avgAftereighty
	from movie , rating
	where movie.mid = rating.mid and movie.year>1980
	group by title ) as a2
		














