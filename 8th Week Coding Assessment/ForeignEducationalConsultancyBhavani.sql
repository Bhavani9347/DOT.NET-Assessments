Create Database ForeignEducationalConsultingSystem
go


--Craeting student tabel
Create Table Student(StudentId int Primary Key not null,StudentName varchar(20) not null,Address varchar(40) not null,StudentPhoneno varchar(10) not null,StudentEmail varchar(50) not null,Qualification varchar(40) not null)
go

---Inserting data into student atbel---
Insert into Student(StudentId,StudentName,Address,StudentPhoneno,StudentEmail,Qualification)Values(401,'Rohit','Bengal',6300504672,'Rohit@gmail.com','Post Graduated');
go
Insert into Student(StudentId,StudentName,Address,StudentPhoneno,StudentEmail,Qualification)Values(402,'Sowmya','Pune',6378504672,'Sowmya1@gmail.com','Post BE Graduate');
go
Insert into Student(StudentId,StudentName,Address,StudentPhoneno,StudentEmail,Qualification)Values(403,'Romika','Chennai',9300504612,'Romika517@gmail.com','Post MSC Graduated');
go


--Create University Tbale---
Create Table University(UniversityId int Primary key not null,UName varchar(30) not null,UAddress varchar(20) not null,State varchar(10) not null,Country varchar(20) not null,UPhoneno varchar(10) not null,UEmail varchar(30) not null)
go

--Inserting data into the universoty table--
Insert into University(UniversityId,UName,UAddress,State,Country,UPhoneno,UEmail)Values(701,'StanfordUniversity','StanfordCAUSA','California','UnitedState',8122229121,'sanforduniversity@gmail.com');
go
Insert into University(UniversityId,UName,UAddress,State,Country,UPhoneno,UEmail)Values(702,'UniversityOfchicago','ChicagoILUSA','Illinois','US',8122329121,'universityofchicago@gmail.com');
go
Insert into University(UniversityId,UName,UAddress,State,Country,UPhoneno,UEmail)Values(703,'HarvardUniversity','Cambridge','Massachusetts','America',9122329121,'universityofharvad@gmail.com');
go


---Creating Course Table---
Create Table Course(CourseId int Primary Key not null,Title varchar(30) not null,Description varchar(40) not null,YearlyFees Float not null,UniversityId int Foreign key References University(UniversityId),Credits int not null)
go

---Enrolemnt Tabel--
create table enrolment(eid int primary key not null,CourseId int foreign key references Course(CourseId),StudentId int foreign key references Student(StudentId),
UniversityId int foreign key references University(UniversityId),
StartDate datetime not null);
go

-------------INserting sp0--------------------

---Sp for student---
CREATE procedure usp_insertStudents(@stdid int, @stdname varchar(50), @stdaddress varchar(100), @stdphone varchar(100), @stdemail varchar(50), @stdqualify varchar(50))
as
begin
insert into Student(StudentId,StudentName, Address, StudentPhoneno,StudentEmail, Qualification) values (@stdid, @stdname, @stdaddress, @stdphone, @stdemail, @stdqualify);
end
go
 
 ---Sp for University table--

 create procedure usp_insertUniversities(@unid int, @uname varchar(100), @uaddress varchar(100), @ustate varchar(100), @ucountry varchar(100), @uphone varchar(50), @uemail varchar(100))
as
begin
insert into University(UniversityId,UName,UAddress,State,Country,UPhoneno,UEmail) values (@unid,@uname, @uaddress, @ustate, @ucountry, @uphone, @uemail)
end 
go

--sp for course table---
create procedure usp_insertCourses(@courseid int, @cname varchar(50), @cdpn varchar(100), @cfee decimal, @uid int, @credits int)
as
begin
insert into Course(CourseId,Title,Description,YearlyFees,UniversityId,Credits) values (@courseid,@cname, @cdpn,@cfee, @uid, @credits)
end 
go

---sp fpr enrolement---
create procedure usp_insertEnrolments(@enid int, @cid int, @sid int, @uid int, @stdate datetime)
as
begin
insert into Enrolment(eid,CourseId,StudentId,UniversityId,StartDate) values (@enid, @cid, @sid, @uid, @stdate)
end
go
 



 -----Updation----------
 ---student table---
CREATE procedure usp_UpdateStudents(@stdid int,@stdemail varchar(50), @stdname varchar(50), @stdaddress varchar(100), @stdqualifiy varchar(50))
as
begin
update Student
set StudentName = @stdname, StudentEmail = @stdemail, Address = @stdaddress,Qualification = @stdqualifiy
where StudentId = @stdid
end
go

---Courses----------
CREATE procedure usp_UpdateCourses(@cuid int, @ctitle varchar(100), @cfee decimal, @ccredits int)
as
begin
update Course
set Title= @ctitle,YearlyFees= @cfee,Credits=@ccredits
where CourseId = @cuid
end
go


---Universities---
CREATE procedure usp_UpdateUniversities(@uuid int,@uname varchar(100), @uaddress varchar(100), @uphone varchar(50) )
as
begin
update University
set UName= @uname, UAddress= @uaddress, UPhoneno= @uphone
where UniversityId = @uuid
end
go

----Enrolements--------
CREATE procedure usp_UpdateEnrolments(@euid int, @udate datetime)
as
begin
update Enrolment
set StartDate = @udate
where eid = @euid
end
go



----Delete sp for studnet table---
create procedure usp_deleteStudents(@stdid int)
as
begin
delete from Student
where StudentId = @stdid
end
go


----Deleete sp for Course table---
create procedure usp_deleteCourse(@cdit int)
as
begin
delete from Course
where CourseId = @cdit
end
go

----Deleete sp for University table---
create procedure usp_deleteUniversities(@udit int)
as
begin
delete from University
where UniversityId = @udit
end