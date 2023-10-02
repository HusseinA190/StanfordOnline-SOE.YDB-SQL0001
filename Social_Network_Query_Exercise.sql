-- SQL Social-Network Query Exercises

-- Q1

-- select distinct name
-- from highschooler as high 
-- inner join friend as fr
-- on high.id = fr.id1 or high.id = fr.id2 and name <> 'Gabriel'
-- where id2 in (select id from highschooler where name = 'Gabriel')

-- Q2

-- SELECT H1.name, H1.grade, H2.name, H2.grade
-- FROM Highschooler H1
-- INNER JOIN Likes ON H1.ID = Likes.ID1
-- INNER JOIN Highschooler H2 ON H2.ID = Likes.ID2
-- WHERE (H1.grade - H2.grade) >= 2;

-- Q3

-- select  h1.name , h1.grade , h2.name  , h2.grade
-- from highschooler  h1 
-- inner join likes on likes.id1 = h1.id
-- inner join highschooler h2 on likes.id2 = h2.id
-- where exists (
-- 	select distinct id1 , id2
-- 	from likes as s
-- 	where s.id1 = likes.id2 and s.id2 = likes.id1
-- ) and h1.name < h2.name 
-- order by h1.name , h2.name

-- Q4

-- select name , grade 
-- from highschooler 
-- where id not in (
-- 	select id1
-- 	from likes
-- ) and id not in (
-- 	select id2
-- 	from likes
-- )
-- order by grade , name

-- Q5 

-- select h.name , h.grade , h2.name , h2.grade 
-- from highschooler as h , highschooler as h2 , likes as s
-- where h.id = s.id1 and h2.id = s.id2
-- and id2 not in (select id1 from likes)

-- Q6 not fully understandable

-- select name , grade 
-- from highschooler 
-- where id not in (
-- 	select id1
-- 	from highschooler as h 
-- 	inner join friend as fr 
-- 	on fr.id1 = h.id 
-- 	inner join highschooler as h2
-- 	on h2.id = fr.id2 
-- 	where h.grade = h2.grade
-- )
-- order by grade , name

-- Q7 not obvious
-- SELECT DISTINCT H1.name, H1.grade, H2.name, H2.grade, H3.name, H3.grade
-- FROM Highschooler H1, Highschooler H2, Highschooler H3, Likes L, Friend F1, Friend F2
-- WHERE (H1.ID = L.ID1 AND H2.ID = L.ID2) AND H2.ID NOT IN (
--   SELECT ID2
--   FROM Friend
--   WHERE ID1 = H1.ID
-- ) AND (H1.ID = F1.ID1 AND H3.ID = F1.ID2) AND (H2.ID = F2.ID1 AND H3.ID = F2.ID2);

-- Q8 
-- select count(*) - count(distinct name)
-- from highschooler

-- Q9
-- select name , grade 
-- from highschooler 
-- where id in (
-- 	select id2 
-- 	from likes 
-- 	group by id2 
-- 	having count(id1) > 1
-- )



