
insert into Course(cname, meets_at, room)
values('Computer Programming I', 'Elva Jones Computer Science Building', '#3101');

insert into Offered(cid, fid, semester, year)
values('1', '1', 'fall', 2019);

insert into Course(cname, meets_at, room)
values('Computer Programming II', 'Elva Jones Computer Science Building', '#3103');

insert into Offered(cid, fid, semester, year)
values('2', '1', 'winter', 2019);

insert into Course(cname, meets_at, room)
values('Operating System', 'Elva Jones Computer Science Building', '#3112');

insert into Offered(cid, fid, semester, year)
values('3', '1', 'summer I', 2019);

insert into Enrolled(sid, oid)
values(1, 1);

insert into Enrolled(sid, oid)
values(1, 2);

insert into Enrolled(sid, oid)
values(1, 3);

insert into Enrolled(sid, oid)
values(2, 1);

insert into Enrolled(sid, oid)
values(2, 2);

insert into Enrolled(sid, oid)
values(2, 3);

/*
select s.fname, f.fname, o.semester
from student s, Faculty f, Course c, Enrolled e, Offered o
where e.sid=s.sid and o.oid=e.oid and c.cid=o.cid and f.fid=o.fid and o.semester='fall' and c.cname='Computer Programming I' and o.year=2019
*/