--create database db_course_management_system;

create table Student(
	sid integer NOT NULL IDENTITY(1,1),
	fname varchar(50),
	mname varchar(50),
	lname varchar(50),
	major varchar(30),
	level varchar(20),
	byear integer,
	primary key(sid),
	check (fname!=null and lname!=null)
	);
--Create Course table
--
---
create table Course(
	cid integer not null IDENTITY(1,1),
	cname varchar(50),
	meets_at varchar(100),
	room varchar(100),
	primary key (cid)
	);

--Create Faculty
--
---
create table Faculty(
	fid integer not null IDENTITY(1,1),
	fname varchar(50),
	mname varchar(50),
	lname varchar(50),
	department varchar(100),
	primary key(fid),
	check (fname!=null and lname!=null)
);

--Create Offered
--
---
create table Offered(
	oid integer NOT NULL IDENTITY(1,1),
	cid integer not null,
	fid integer not null,
	semester varchar(15),
	year integer,
	primary key(oid),
	foreign key(cid) references Course,
	foreign key(fid) references Faculty
);

--Create Enrolled table
--
---
create table Enrolled(
	sid integer not null,
	oid integer not null,
	primary key (sid, oid),
	foreign key (sid) references Student,
	foreign key (oid) references Offered,
	);

create table StudentCredential(
	sid integer NOT NULL,
	username varchar(100),
	password varchar(100),
	primary key (sid),
	foreign key(sid) references Student
);

create table FacultyCredential(
	fid integer not null,
	username varchar(100),
	password varchar(100),
	primary key(fid),
	foreign key(fid) references Faculty,
);
