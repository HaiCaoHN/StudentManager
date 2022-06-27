-- SQl take data for attendance table
select s.sid,sessionID, sname, g.gid, taker, code, date from Student s inner join enroll e on s.sid = e.sid
						inner join [Group] g on g.gid = e.gid
						inner join [Session] ss on ss.gid = g.gid
where taker = 'triTD' and g.gid = 'SE1634-CSI' and date = '2022/12/08'
group by  sname, g.gid, taker, code, [date]

-- SQL take data for schedule table
select g.gid, room, s.slot, [date], [status]  
		from [Group] g inner join [Session] s on g.gid = s.gid
					   inner join TimeSlot t on t.slot = s.slot
where date > '2022/12/06' and date < '2022/12/10'

-- SQL take data for view table
select gid, sname, code, [date], attend from Student s inner join Attendance a on s.sid = a.sid
						inner join [Session] ss on ss.sessionID = a.sessionID
where gid = 'SE1634-CSI'