select * from  `Position`;

drop table if exists `Account`;
create table `Account`(
accountID tinyint primary key auto_increment,
email varchar(50) unique key,
userName varchar(50) check(length(userName)>=6),
fullName nvarchar(50) not null,
departmentID tinyint,
foreign key(departmentID) references Department(deprtmentID),
positionID tinyint,
foreign key(positionID) references `Position`(positionID),
createDate datetime default now()
);

insert into `Account`(email,userName,fullName,departmentID,positionID,accountID,createDate) values
							('nam12342gmail.com','văn nam','nguyễn văn nam',1,1,'vti1','2021-06-28'),
							('phongle@gmail.com','hồng phong','lê hồng phong',2,2,'vti2','2021-05-28'),
                            ('linhthuy@gmail.com','thùy linh','nguyễn thùy linh',3,3,'vti3','2021-04-28'),
                            ('maichi@gmail.com','maichi','trần thị mai chi',4,4,'vti4','2021-06-15'),
                            ('longdaica@gmail.com','vũ long','trần vũ long',5,4,'vti5','2021-05-15'),
                            ('thinh123@gmail.com','xuân thịnh','phạm xuân thịnh',6,3,'vti6','2021-04-15');
select * from `Account`;

drop table if exists `Group`;
create table `Group`(
groupID tinyint primary key auto_increment,
groupName nvarchar(50),
creatorID tinyint,
foreign key(creatorID) references `Account`(accountID),
createDate datetime default now()
);

insert into `Group` (groupID,groupName,creatorID)values
							('na','nhóm a',1),
                            ('nb','nhóm b',2),
                            ('nc','nhóm c',3),
                            ('nd','nhóm d',4),
                            ('ne','nhóm e',5),
                            ('nf','nhóm f',6);
                            
select * from `Group`;

drop table if exists GroupAccout;
create table GroupAccount(
groupID tinyint,
accountID tinyint,
primary key(groupID, accountID),
foreign key(groupID) references `Group`(groupID),
foreign key(accountID) references `Account`(accountID),
joinDate datetime default now()
);

insert into groupAccount(groupID, accountID,joinDate) values
										('na','vti1','2021-01-07'),
                                        ('nb','vti2','2021-01-07'),
                                        ('nc','vti3','2021-01-07'),
                                        ('nc','vti4','2021-01-07'),
                                        ('nd','vti5','2021-01-07'),
                                        ('ne','vti6','2021-01-07'),
                                        ('nf','vti7','2021-01-07');
															
select * from groupAccount;

select departmentName from department;

select departmentID,departmentname from department where departmentname = 'quản trị';

-- cách 1
select * from  `Account` where character_length(fullName) =
(select max(character_length(fullName)) from `Account`);
-- cách 2
select * from `Account` where character_length(fullName)= 
(select character_length(fullName) as 'dodai' from `Account` order by dodai desc limit 1);

select fullName from `Accout` where character_length(fullName) = (select max(character_length(fullName)) from `Acount` where departmentID = 1);

select groupName from `Group` where createDate > '2021-05-15';