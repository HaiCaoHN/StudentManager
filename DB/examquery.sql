select A.* from (select s.sid, s.sname, e.examid, e.score, e.date, a.aid, a.aname from Student s 
						inner join Exam e on s.sid = e.sid
						inner join Assessment a on a.aid = e.aid) A 
inner join 
(select sid, aid, MAX(date) as date from Exam GROUP BY sid,aid) B
on A.sid = B.sid AND A.aid = B.aid AND A.date = B.date
						