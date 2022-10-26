--1 ���������� ������������ � ������ �����;
select g."name", count(musicant_id) from musicantgenre m  
left join genre g on g.id=m.genre_id  group by g."name" 

--2 ���������� ������, �������� � ������� 2019-2020 �����;
select count(t.id)  from track t  
left join album a on t.album_id=a.id where (a.year_of_release >= 2019) and (a.year_of_release <= 2020)

-- 3   ������� ����������������� ������ �� ������� �������;
SELECT a.name, round(avg(t.duration),2) FROM track t
LEFT JOIN album a ON t.album_id = a.id
group by a.id order by a."name"  asc ;

-- 4   ��� �����������, ������� �� ��������� ������� � 2020 ����;
select name from musicant m
except
select m3.name from musicantalbum m2 
join album a on a.id = m2.album_id
join musicant m3 on m3.id = m2.musicant_id 
where a.year_of_release = 2020

-- 5   �������� ���������, � ������� ������������ ���������� ����������� (�������� ����);
SELECT distinct c.name FROM collection c 
JOIN trackcollection t ON t.collection_id  = c.id 
join track t1 on t1.id = t.track_id 
join album a on a.id = t1.album_id 
join musicantalbum m on m.album_id = a.id 
join musicant m1 on m1.id = m.musicant_id 
where m1.name = '�������';

-- 6   �������� ��������, � ������� ������������ ����������� ����� 1 �����;
select a.name, count(g.name)  from album a 
join musicantalbum m on m.album_id = a.id 
join musicant m1 on m1.id = m.musicant_id 
join musicantgenre m2 on m2.musicant_id  = m1.id 
join genre g on g.id = m2.genre_id 
group by a.name 
having count(g.name) > 1

-- 7   ������������ ������, ������� �� ������ � ��������;
select t.name, t1.collection_id  from track t
left join trackcollection t1 on t1.track_id  = t.id 
where t1.collection_id is null 


-- 8   �����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������);
select m2.name as ����������� , t.name as ����, t.duration as �����������������  from track t
join album a on a.id  = t.album_id 
join musicantalbum m on m.album_id = a.id 
join musicant m2 on m2.id  = m.musicant_id 
where t.duration = (select MIN(t.duration) FROM track t);


-- 9   �������� ��������, ���������� ���������� ���������� ������.
select a.name, count(s.id)  from album a
join track  s on s.album_id = a.id 
group by a.id 
having count(s.id) = (select count(s.id)  from album a 
	join track   s on s.album_id = a.id 
	group by a.id order by count(s.id)
	limit 1)
