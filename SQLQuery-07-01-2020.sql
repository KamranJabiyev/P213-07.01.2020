use P213;

create table Students(
	Id int,
	[Name] nvarchar(100),
	Surname nvarchar(100)
)

drop table Students

alter table Students
add Email nvarchar(250)

alter table Students 
drop column Email

insert into Students
values(1,'Memmed','Lazimli','memmedBomba@gmail.com')

select * from Students

select Name,Surname from Students

insert into Students
values (2,'Rafiq','Qasimov','rafig@code.az'),
	(3,'Elgiz','Memmedli','elgiz@code.az')

insert into Students (Id,Name)
values(4,'Nesib')

create table Students(
	Id int identity,
	[Name] nvarchar(100) not null,
	Surname nvarchar(100),
	Email nvarchar(250) unique
)

insert into Students (Name) values('Kamran')
select * from Students

update Students
set Surname='Jabiyev',Email='kamran@code.edu.az' 
where Id=1

Delete from Students where Name='Kamran'

insert into Students
values('Memmed','Necefov','Bomba@gmail.com'),
		('Elman','Elko','elko@code.az'),
		('Zeynal','Zey','zey@code.az')

insert into Students
values('Rafiq','Qasimov','bomba2@gmail.com')

Select Surname 'Lastname' from Students
--where Id<10
--where Id<=8 And Id>=4
--where Id=8 OR Id=3
--where Id Between 4 and 8
where Id in(8,3)

Select SUBSTRING(Email,0,CHARINDEX('@',Email)) 'Email' from Students

Select lower(Name) 'Lower Name',lower(Surname) 'Lower Lastname' from Students

alter table Students
add Address nvarchar(200)

select * from Students

select Email from Students
where Email Like '%code%'

select * from Students
where Address is null

select distinct Address from Students where Address is not null


select Name,Surname from Students
where Id in(
	select Id from Students where Address is null
)

drop table Students

create table Groups(
	Id int primary key identity,
	[Name] nvarchar(50) not null
)

create table Student(
	Id int primary key identity,
	Firstname nvarchar(100) not null,
	Surname nvarchar(100),
	GroupId int references Groups(Id)
)

select Firstname,Surname,Groups.Name 'Group' from Student
join Groups 
on Student.GroupId=Groups.Id