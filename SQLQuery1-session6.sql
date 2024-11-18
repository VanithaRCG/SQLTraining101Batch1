

-- User Table
create table Users(
UserID INT Primary key,
FirstName varchar(50),
LastName varchar(50),
Country varchar(20),
PostalCode varchar(20)
)

--- Useremail table

create table UserEmails(
EmailID int primary key,
UserID int not null,
EmailAddress varchar(100),
Foreign key (UserID) references Users(UserID)
)

--UserPhones table

create table UserPhones(
PhoneID int primary key,
UserID int not null,
PhoneNumber varchar(15),
Foreign key (UserID) references Users(UserID)
)


--Engagement logs table

create table EngagementLogs(
LogID int primary key,
UserID int not null,
ActivityType ENUM('login','view','like') not null,
Timestamp datetime,
EngagementData text,
Foreign key (UserID) references Users(UserID)
)
