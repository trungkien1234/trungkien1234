use `Testing_System_03`;

-- câu 1 : viết lệnh để lấy danh sách nhân viên và thông tin phòng ban của họ
select A.departmentID,D.departmentName from `Account` A left join `Department` D on A.departmentID=D.departmentID;

 -- câu 2: viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
 select * from `account` where createdate > 20/12/2010;
 
 -- câu 3: viết lệnh để lấy ra tất cả các developer
 select A.fullname, A.Email, P.positionName
 from `account` A 
 inner join Position P on A.positionID = P.PositionID
 where P.positionName = 'dev';
 
 -- câu 4: viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
 select D.departmentName, count(A.departmentID) as 'so nhan vien' 
 from `account` A
 inner join department D on A.departmentID = D.departmentID
 group by A.departmentID
 having count('so nhan vien') >3;

 -- câu 5: viết lệnh để lấy ra danh sách câu hỏi được sử dụng nhiều nhất 
 select `questionID`, count(*) as 'so luong'
 from examQuestion
 group by `questionID`
 order by count(questionID) desc limit 1;
 
 -- câu 6: thống kê mỗi category question được sử dụng trong bao nhiêu question 
 
 -- câu 7: thống kê mỗi question được sử dụng trong bao nhiêu exam
 select Q.questionID, Q.content, count(E.questionID) AS 'số lượng ' FROM examquestion E
 right join question Q ON Q.questionID = E.questionID
 group by Q.questionID;
 
 -- câu 8: lấy ra question có nhiều câu trả lời nhất

 
 -- câu 9: thống kê số lượng account mỗi group
 select G.groupID , count(A.accountID) as 'số lượng'
 from GroupAccount G
 join `group` G on A.groupID = G.groupID
 group by G.groupID;

 
 -- câu 10: tìm chức vụ có ít người nhất
 
 
 
 -- câu 11: thống kê mỗi phòng ban có bao nhiêu dev,test, scrum master, pm
 select D.departmentName, P.positionName, count(*) as 'số lượng'
 from `Account` A
 JOIN department D on A.departmentID = D.departmentID
 join Position P on A.positionID = P.positionID 
 group by D.departmentID, P.positionID;
 
 /* câu 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
 question loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, .../**/


-- câu 13: lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

-- câu 14: lấy ra group ko có account nào
select * from `group`
where groupID not in (select groupID from groupAccount);

select * from `question`
where questionID not in(select questionID from answer);

