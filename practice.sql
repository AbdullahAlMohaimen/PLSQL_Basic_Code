clear scree;
set verify off;
set serveroutput on;

select * from dual;

drop table UserAccount;

create table UserAccount(
	id int,
	name varchar2(20),
	gender varchar2(10),
	age number,
	amount number
);

insert into UserAccount values(1,'Mohaimen','Male',23,25000);
insert into UserAccount values(2,'Abdullah','Male',24,22000);
insert into UserAccount values(3,'Saleh','Male',21,23000);
insert into UserAccount values(4,'Hasan','Male',23,24000);
insert into UserAccount values(5,'Joty','Female',22,21000);
insert into UserAccount values(6,'Salma','Female',25,26000);
insert into UserAccount values(7,'Raihan','Male',24,24000);
insert into UserAccount values(8,'Munni','Female',26,23000);
insert into UserAccount values(9,'Azizul','Male',21,28000);
insert into UserAccount values(10,'Tasnim','Female',22,25000);
insert into UserAccount values(11,'Rafi','Male',24,21000);
insert into UserAccount values(12,'Samira','Female',23,23000);

select amount from UserAccount 
where id=(select id from UserAccount where name='Mohaimen');

--VIEW--
create or replace view UserAccountView(NAME,USERAGE,AMOUNT) as
select name,age,amount from UserAccount;

create or replace view UserAmount(N,A) as
select name,amount from UserAccount;

--UNION--
select name from UserAccount
union
select Name from UserAccountView;

select amount from UserAccount
union 
Select AMOUNT from UserAccountView;


--BEGIN END--
Begin
	DBMS_OUTPUT.PUT_LINE('Ahsanullah University of Science and Technology');
end;
/

select * from UserAccount;

Begin 
	insert into UserAccount values(13,'Sumaia','Female',22,25000);
	insert into UserAccount values(14,'Rayan','Male',25,24000);
END;
/


Begin
	Select name,amount from UserAccount;
end;
/


Declare
	uName varchar2(20);
	uGender varchar2(20);
	uAge int;
	uAmount int;
Begin
	Select name,age,gender,amount into uName,uAge,uGender,uAmount 
	from UserAccount where id=2;
	
	DBMS_OUTPUT.PUT_LINE(uName);
	DBMS_OUTPUT.PUT_LINE(uAge);
	DBMS_OUTPUT.PUT_LINE(uGender);
	DBMS_OUTPUT.PUT_LINE(uAmount);
end;
/


Declare
	uName UserAccount.name%type;
	uGender UserAccount.gender%type;
	uAge UserAccount.age%type;
	uAmount UserAccount.amount%type;
Begin
	Select name,age,gender,amount into uName,uAge,uGender,uAmount 
	from UserAccount where id=2;
	
	DBMS_OUTPUT.PUT_LINE(uName);
	DBMS_OUTPUT.PUT_LINE(uAge);
	DBMS_OUTPUT.PUT_LINE(uGender);
	DBMS_OUTPUT.PUT_LINE(uAmount);
end;
/


Declare
	uAmount UserAccount.amount%type;
	
	uName UserAccount.name%type;
	uGender UserAccount.gender%type;
	uAge UserAccount.age%type;
Begin
	uAmount:=25000;
	
	update UserAccount set amount=uAmount where id=10;
	
	Select name,age,gender,amount into uName,uAge,uGender,uAmount 
	from UserAccount where id=10;
	
	DBMS_OUTPUT.PUT_LINE(uName);
	DBMS_OUTPUT.PUT_LINE(uAge);
	DBMS_OUTPUT.PUT_LINE(uGender);
	DBMS_OUTPUT.PUT_LINE(uAmount);
end;
/


Declare
	uAmount UserAccount.amount%type:=23000;
	
	uName UserAccount.name%type;
	uGender UserAccount.gender%type;
	uAge UserAccount.age%type;
	uAmountt UserAccount.amount%type;
Begin
	
	update UserAccount set amount=uAmount where id=10;
	
	Select name,age,gender,amount into uName,uAge,uGender,uAmountt 
	from UserAccount where id=10;
	
	DBMS_OUTPUT.PUT_LINE(uName);
	DBMS_OUTPUT.PUT_LINE(uAge);
	DBMS_OUTPUT.PUT_LINE(uGender);
	DBMS_OUTPUT.PUT_LINE(uAmountt);
end;
/


--IF ELSE--
Declare
	uAmount UserAccount.amount%type;
Begin
	select amount into uAmount from userAccount where id =13;
	
	if mod(uAmount,2)=0 then
		DBMS_OUTPUT.PUT_LINE('EVEN');
		DBMS_OUTPUT.PUT_LINE(uAmount);
	else
		DBMS_OUTPUT.PUT_LINE('ODD');
		DBMS_OUTPUT.PUT_LINE(uAmount);
	end if;
end;
/



DECLARE
	userAmount UserAccount.amount%type;
	userName UserAccount.name%type;
Begin
	select amount into userAmount from UserAccount where id=1;
	
	if mod(userAmount,2)=0 then
		DBMS_OUTPUT.PUT_LINE(userAmount);
		DBMS_OUTPUT.PUT_LINE('EVEN');
		userAmount:=userAmount+1;
		
		update UserAccount set amount=userAmount where  id =1;
		
		select name,amount into userName,userAmount from UserAccount where id =1;
		DBMS_OUTPUT.PUT_LINE(userName);
		DBMS_OUTPUT.PUT_LINE(userAmount);
		DBMS_OUTPUT.PUT_LINE('Now this is ODD');
	else
		DBMS_OUTPUT.PUT_LINE(userAmount);
		DBMS_OUTPUT.PUT_LINE('ODD');
		userAmount:=userAmount+1;
		
		update UserAccount set amount=userAmount where  id =1;
		
		select name,amount into userName,userAmount from UserAccount where id =1;
		DBMS_OUTPUT.PUT_LINE(userName);
		DBMS_OUTPUT.PUT_LINE(userAmount);
		DBMS_OUTPUT.PUT_LINE('Now this is EVEN');
	end if;
end;
/



DECLARE 
	NUM int:=6;
BEGIN
	if MOD(NUM,3)=0 THEN
		DBMS_OUTPUT.PUT_LINE('Zero');
	elsif MOD(NUM,3)=1 then 
		DBMS_OUTPUT.PUT_LINE('ONE');
	else
		DBMS_OUTPUT.PUT_LINE('TWo');
	end if;
END;
/



DECLARE 
	userA UserAccount.amount%type;
BEGIN
	select amount into userA
	from UserAccount where id=1;
	if MOD(userA,3)=0 THEN
		DBMS_OUTPUT.PUT_LINE('Zero');
	elsif MOD(userA,3)=1 then 
		DBMS_OUTPUT.PUT_LINE('ONE');
	else
		DBMS_OUTPUT.PUT_LINE('TWo');
	end if;
END;
/


--CASE--

declare
	money UserAccount.amount%type;
begin
	select amount into money from UserAccount
	where id=5;
	case
		when mod(money,3)=0 then
			DBMS_OUTPUT.PUT_LINE(money);
			money:=money+100;
			update UserAccount set amount=money where id=5;
			select amount into money from UserAccount where id =5;
			DBMS_OUTPUT.PUT_LINE(money);
		when mod(money,3)=1 then
			DBMS_OUTPUT.PUT_LINE(money);
			money:=money+200;
			update UserAccount set amount=money where id=5;
			select amount into money from UserAccount where id =5;
			DBMS_OUTPUT.PUT_LINE(money);
		else
			DBMS_OUTPUT.PUT_LINE(money);
			money:=money+300;
			update UserAccount set amount=money where id=5;
			select amount into money from UserAccount where id =5;
			DBMS_OUTPUT.PUT_LINE(money);
	end case;
		
end;
/



declare
	money UserAccount.amount%type;
begin
	select amount into money from UserAccount
	where id=6;
	case mod(money,3)
		when 0 then
			DBMS_OUTPUT.PUT_LINE(money);
			money:=money+100;
			update UserAccount set amount=money where id=6;
			select amount into money from UserAccount where id =6;
			DBMS_OUTPUT.PUT_LINE(money);
		when 1 then
			DBMS_OUTPUT.PUT_LINE(money);
			money:=money+200;
			update UserAccount set amount=money where id=6;
			select amount into money from UserAccount where id =6;
			DBMS_OUTPUT.PUT_LINE(money);
		else
			DBMS_OUTPUT.PUT_LINE(money);
			money:=money+300;
			update UserAccount set amount=money where id=6;
			select amount into money from UserAccount where id =6;
			DBMS_OUTPUT.PUT_LINE(money);
	end case;
		
end;
/



--LOOP--

--(Print a sum of Sequence)--
Declare
	x int:=0;
Begin
	loop
		DBMS_OUTPUT.PUT_LINE(x);
		x:=x+10;
		if (x>100) then
			exit;
		end if;
	end loop;
end;
/



Declare
	taka UserAccount.amount%type;
	n UserAccount.name%type;
Begin
	select amount into taka from UserAccount where id=6;
	loop
		taka:=taka+100;
		DBMS_OUTPUT.PUT_LINE(taka);
		if (taka=27000) then
			update UserAccount set amount=taka where id=6;
			select name,amount into n,taka from UserAccount where id=6;
			DBMS_OUTPUT.PUT_LINE('');
			DBMS_OUTPUT.PUT_LINE('Name: '||n);
			DBMS_OUTPUT.PUT_LINE('Amount: '||taka);
			exit;
		end if;
	end loop;

end;
/



DECLARE 
	NUM int:=0;
BEGIN
	loop
		NUM:=NUM+10;
		DBMS_OUTPUT.PUT_LINE(NUM);
		exit when NUM=100;
	end loop;
END;
/



declare
	a UserAccount.name%type;
	b userAccount.amount%type;
begin
	select amount into b from UserAccount where id=10;
	
	loop
		b:=b+100;
		DBMS_OUTPUT.PUT_LINE(b);
		exit when b=26000;
	end loop;
	
	update UserAccount set amount=b where id=10;
	
	select name,amount into a,b from UserAccount where id=10;
	DBMS_OUTPUT.PUT_LINE('Name: ' ||a);
	DBMS_OUTPUT.PUT_LINE('Amount: ' ||b);
end;
/



--WHILE LOOP--
declare
	x int:=0;
begin
	while x<100 loop
		x:=x+10;
		DBMS_OUTPUT.PUT_LINE(x);
	end loop;
end;
/


declare
	x UserAccount.name%type;
	y UserAccount.amount%type;
begin
	select amount into y from UserAccount where id=4;
	
	while y<25000 loop
		y:=y+100;
		DBMS_OUTPUT.PUT_LINE(y);
	end loop;
	update UserAccount set amount=y where id =4;
	select name,amount into x,y from UserAccount where id=4;
	DBMS_OUTPUT.PUT_LINE('Name: '||x);
	DBMS_OUTPUT.PUT_LINE('Amount: '||y);
end;
/



--FOR LOOP--
begin
	for i in 1..10 loop
		DBMS_OUTPUT.PUT_LINE(i);
	end loop;
end;
/



declare
	y int:=0;
begin
	for x in 1..30 loop
		y:=y+x;
		DBMS_OUTPUT.PUT_LINE(y);
	end loop;
end;
/


declare
	a int:=0;
	b int:=15;
	c int:=0;
begin
	for d in a..b loop
		c:=c+d;
		DBMS_OUTPUT.PUT_LINE(c);
	end loop;
end;
/


declare
	a UserAccount.id%type;
	b UserAccount.amount%type;
	c UserAccount.age%type;
begin
	select count(id) into a from UserAccount;
	
	for i in 1..a loop
		select amount,age into b,c from UserAccount where id=a;
		a:=a+1;
		b:=b+100;
		if mod(a,2)=0 then
			c:=c+1;
			insert into UserAccount 
			values(a,'aamh','Male',c,b);
		elsif mod(a,2)=1 then
			c:=c+2;
			insert into UserAccount 
			values(a,'jab','Female',c,b);
		else
			DBMS_OUTPUT.PUT_LINE('Something Problem');
		end if;
	end loop;
end;
/



--USER INPUT--
declare
	a int:=&x;
	b int:=&y;
begin
	DBMS_OUTPUT.PUT_LINE(a+b);
end;
/


declare
begin
	DBMS_OUTPUT.PUT_LINE(&x+&y);
end;
/


declare
	a varchar2(20):='&name';
	b varchar2(20):='&address';
begin
	DBMS_OUTPUT.PUT_LINE(a||'   -   '||b);
end;
/


drop table EmployeeInfo;
create table EmployeeInfo(
	emp_id int,
	emp_salary int
);


declare
	total_emp EmployeeInfo.emp_id%type:=&total_employee;
	emp_salary EmployeeInfo.emp_salary%type:=&starting_salary;
begin
	for id in 1..total_emp loop
		emp_salary:=emp_salary+500;
		insert into EmployeeInfo values(id,emp_salary);
	end loop;
end;
/


declare
	totalEmp EmployeeInfo.emp_id%type;
	totaljoin EmployeeInfo.emp_id%type:=&totaljoin;
	emp_salary EmployeeInfo.emp_salary%type;
begin
	select count(emp_id) into totalEmp
	from EmployeeInfo;
	
	select emp_salary into emp_salary from EmployeeInfo
	where emp_id=totalEmp;
	
	for id in totalEmp+1..totalEmp+totaljoin loop
		emp_salary:=emp_salary+500;
		insert into EmployeeInfo values(id,emp_salary);
	end loop;
end;
/


Accept x number prompt "Enter Your ID:";

declare
	a number;
	b int;
begin
	a:=&x;
	b:=0;
	
	begin
		b:=mod(a,2);
		
		if b=0 then
			DBMS_OUTPUT.PUT_Line('Even');
		else
			DBMS_OUTPUT.PUT_Line('Odd');
		end if;
	end;
end;
/

Accept s char prompt "Enter your name:";

DECLARE
	c varchar2(10);
BEGIN
	c:='&N';
	DBMS_OUTPUT.PUT_LINE(c);
END;
/



declare
	a UserAccount.id%type;
	b UserAccount.name%type;
	c UserAccount.age%type;
	d UserAccount.gender%type;
	e UserAccount.amount%type;
begin
	select count(id) into a from UserAccount;
	
	for i in 1..a loop
		select name,age,gender,amount into b,c,d,e 
		from UserAccount where id=i;
		DBMS_OUTPUT.PUT_LINE(b||'  '||c||'  '||d||'  '||e);
	end loop;
end;
/



declare
	a UserAccount.id%type;
	b UserAccount.name%type;
	c UserAccount.age%type;
	d UserAccount.gender%type;
	e UserAccount.amount%type;
begin
	for i in (select id,name,age,gender,amount from UserAccount) loop
		a:=i.id;
		b:=i.name;
		c:=i.age;
		d:=i.gender;
		e:=i.amount;
		
		DBMS_OUTPUT.PUT_LINE('ID: '||a||'    '||'Name: '||b||'    '||'Age: '||c||'    '||'Gender: '||d||'    '||'Amount: '||e);
		
		if mod(e,2)=0 then 
			DBMS_OUTPUT.PUT_LINE('Salry '||e||' is EVEN');
		else
			DBMS_OUTPUT.PUT_LINE('Salry '||e||' is ODD');
		end if;
	end loop;
end;
/


--PROCEDURE--

create or replace procedure CheckIn is
Begin
	DBMS_OUTPUT.PUT_LINE('AUST');
end CheckIn;
/

Begin
	CheckIn;
end;
/

exec CheckIn;


--PROCEDURE IN Parameter--

create or replace procedure inParameter(A in UserAccount.amount%type)
is

begin
	DBMS_OUTPUT.PUT_LINE(A);
end inParameter;
/

exec inParameter(25000);

declare
	a userAccount.amount%type;
begin
	select amount into a from UserAccount where id=1;
	inParameter(a);
end;
/


--Procedure OUT Parameter--

CREATE OR REPLACE PROCEDURE outParam(A IN money.id%TYPE,B OUT money.id%TYPE)
IS

BEGIN
	B:= 10;
	DBMS_OUTPUT.PUT_LINE(A);

END outParam;
/

DECLARE
	NUM money.id%TYPE;
BEGIN
	outParam(2,NUM);
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/


create or replace procedure outParameter(a in UserAccount.id%type,b out UserAccount.name%type)
is
	x UserAccount.amount%type;
begin
	DBMS_OUTPUT.PUT_LINE('ID: '||a);
	select amount into x from UserAccount where id=a;
	if mod(x,2)=0 then
		b:='Even';
	else
		b:='Odd';
	end if;
end outParameter;
/

Accept n char prompt "Enter Name:";
declare
	b UserAccount.id%type;
	c UserAccount.name%type;
begin
	select id into b from UserAccount where name='&n';
	outParameter(b,c);
	DBMS_OUTPUT.PUT_LINE(c);
end;
/



--PROCEDURE IN OUT Parameter--

CREATE OR REPLACE PROCEDURE inOutParam(A IN OUT money.id%TYPE)
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);
	A := 10;
END inOutParam;
/


DECLARE
	NUM money.id%TYPE;
BEGIN
	NUM := 2;
	inOutParam(NUM);
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/


create or replace procedure inOutParameter(a in out UserAccount.amount%type)
is
	x UserAccount.amount%type;
begin
	DBMS_OUTPUT.PUT_LINE('ID: '||a);
	select amount into x from UserAccount where id=a;
	a:=x;
end inOutParameter;
/

Accept n char prompt "Enter Name:";
declare
	c UserAccount.amount%type;
begin
	select id into c from UserAccount where name='&n';
	inOutParameter(c);
	DBMS_OUTPUT.PUT_LINE('Salary: '||c);
end;
/


--FUNCION--

create or replace function simpleFunction
return number
is
	
begin
	DBMS_OUTPUT.PUT_LINE('AUST');
	return 100;
end simpleFunction;
/

declare
	a number;
begin
	a:=simpleFunction;
	DBMS_OUTPUT.PUT_LINE(a);
end;
/


--IN PARAMETER FUNCTION--

CREATE OR REPLACE FUNCTION inParamFunction(A IN money.id%TYPE)
RETURN NUMBER
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);
	return A+10; 
END inParamFunction;
/

DECLARE
	NUM NUMBER;
BEGIN
	NUM:=inParamFunction(5);
	DBMS_OUTPUT.PUT_LINE(num);
END;
/


create or replace function inParameterFunction(a in UserAccount.id%type)
return number
is
	f UserAccount.amount%type;
begin
	select amount into f from UserAccount where id=a;
	
	if mod(f,2)=0 then
		DBMS_OUTPUT.PUT_LINE('Even');
	else
		DBMS_OUTPUT.PUT_LINE('Odd');
	end if;
	return f;
end inParameterFunction;
/


declare
	a UserAccount.id%type;
	b userAccount.name%type;
	c UserAccount.age%type;
	d UserAccount.gender%type;
	e UserAccount.amount%type;
	x userAccount.name%type;
begin
	select id into a from UserAccount where name='&x';
	e:=inParameterFunction(a);
	DBMS_OUTPUT.PUT_LINE(e);
end;
/


--IN OUT PARAMETER FUNCTION--

create or replace function inOutFunction(x in UserAccount.id%type,y out UserAccount.amount%type)
return number
is
	b userAccount.name%type;
	c UserAccount.age%type;
	d UserAccount.gender%type;
	e UserAccount.amount%type;
Begin
	select name,age,gender,amount into b,c,d,e from UserAccount where id=x;
	DBMS_OUTPUT.PUT_LINE('Name: '|| b);
	DBMS_OUTPUT.PUT_LINE('Gender: '|| d);
	y:=c;
	return e;
end;
/


declare
	a UserAccount.id%type;
	b userAccount.name%type;
	c UserAccount.age%type;
	d UserAccount.gender%type;
	e UserAccount.amount%type;
	x userAccount.name%type;
begin
	c:=inOutFunction(1,e);
	--c:=inOutFunction(&x,e);
	DBMS_OUTPUT.PUT_LINE('Age: '|| c);
	DBMS_OUTPUT.PUT_LINE('Salary: '|| e);
end;
/



--EXECUTING FUNCTION WITH DUAL--

create or replace function dualFunction(a in UserAccount.id%type)
return NUMBER
is
	c userAccount.name%type;
	d UserAccount.amount%type;
begin
	select name,amount into c,d from UserAccount where id=a;
	DBMS_OUTPUT.PUT_LINE('Name: '|| c);
	return d;
end;
/

select dualFunction(4) from dual;



--DECLARING FUNCTION WITH VARIABLE--

create or replace function simplefunction
Return UserAccount.amount%type
is
	a UserAccount.id%type;
	b UserAccount.name%type;
	c UserAccount.gender%type;
	d UserAccount.age%type;
	e UserAccount.amount%type;
	f UserAccount.amount%type:=0;
begin
	for i in (select id,name,gender,age,amount from UserAccount) loop
		a:=i.id;
		b:=i.name;
		c:=i.gender;
		d:=i.age;
		e:=i.amount;
		f:=f+e;
		DBMS_OUTPUT.PUT_LINE('ID: '||a);
		DBMS_OUTPUT.PUT_LINE('Name: '||b);
		DBMS_OUTPUT.PUT_LINE('Gender: '||c);
		DBMS_OUTPUT.PUT_LINE('Age: '||d);
		DBMS_OUTPUT.PUT_LINE('Salary: '||e);
		DBMS_OUTPUT.PUT_LINE('-------------------');
	end loop;
	return f;
end;
/


declare
	x UserAccount.amount%type;
begin
	x:=simplefunction;
	DBMS_OUTPUT.PUT_LINE('Total Salary: '||x);
end;
/





--DECLARING PROCEDURE WITH VARIABLE--

create or replace procedure simpleprocedure
is
	a UserAccount.id%type;
	b UserAccount.name%type;
	c UserAccount.gender%type;
	d UserAccount.age%type;
	e UserAccount.amount%type;
	f UserAccount.amount%type:=0;
begin
	for i in (select id,name,gender,age,amount from UserAccount) loop
		a:=i.id;
		b:=i.name;
		c:=i.gender;
		d:=i.age;
		e:=i.amount;
		f:=f+e;
		DBMS_OUTPUT.PUT_LINE('ID: '||a);
		DBMS_OUTPUT.PUT_LINE('Name: '||b);
		DBMS_OUTPUT.PUT_LINE('Gender: '||c);
		DBMS_OUTPUT.PUT_LINE('Age: '||d);
		DBMS_OUTPUT.PUT_LINE('Salary: '||e);
		DBMS_OUTPUT.PUT_LINE('-------------------');
	end loop;
	DBMS_OUTPUT.PUT_LINE('Total Salary: '||f);
end;
/


declare
begin
	simpleprocedure;
	
end;
/





--EXCEPTION--

declare
	a UserAccount.amount%type;
begin
	select amount into a from UserAccount;
	
	exception
		when TOO_MANY_ROWS then
			DBMS_OUTPUT.PUT_LINE('MANY ROWS DETECTED');
end;
/


declare
	a UserAccount.amount%type;
begin
	select amount into a from UserAccount where id=100;
	DBMS_OUTPUT.PUT_LINE(a);
	
	exception
		when TOO_MANY_ROWS then
			DBMS_OUTPUT.PUT_LINE('Many row detected');
		when NO_DATA_FOUND then
			DBMS_OUTPUT.PUT_LINE('No data found');
end;
/



declare
	a UserAccount.amount%type;
	b number:=0;
	res number;
begin
	select amount into a from UserAccount where id=10;
	res:=a/b;
	DBMS_OUTPUT.PUT_LINE(res);
	
	exception 
		when TOO_MANY_ROWS then
			DBMS_OUTPUT.PUT_LINE('Many row detected');
		when NO_DATA_FOUND then
			DBMS_OUTPUT.PUT_LINE('No data found');
		when ZERO_DIVIDE then
			DBMS_OUTPUT.PUT_LINE('Cannot divide by zero');
		when others then
			DBMS_OUTPUT.PUT_LINE('Other error found');
end;
/


--ERROR RAISE--
declare
	a UserAccount.id%type;
	b UserAccount.name%type;
	c UserAccount.amount%type;
	d number:=&s;
	e UserAccount.amount%type;
	
	--user defind function(x)--
	x EXCEPTION;
begin
	select amount into c from UserAccount where id=10;
	
	if d<0 then
		raise x;
	end if;
	
	e:=c/d;
	DBMS_OUTPUT.PUT_LINE(e);
	
	exception
		when x then
			DBMS_OUTPUT.PUT_LINE('Negative number');
		when TOO_MANY_ROWS then
			DBMS_OUTPUT.PUT_LINE('Many row detected');
		when NO_DATA_FOUND then
			DBMS_OUTPUT.PUT_LINE('No data found');
		when ZERO_DIVIDE then
			DBMS_OUTPUT.PUT_LINE('Cannot divide by zero');
		when others then
			DBMS_OUTPUT.PUT_LINE('Other error found');
end;
/



declare
	a UserAccount.id%type;
	b UserAccount.amount%type;
	c UserAccount.amount%type:=&x;
	d UserAccount.amount%type;
	
	e exception;
begin
	select amount into b from UserAccount where id=10;
	
	if c<0 then
		 raise e;
	end if;
	
	d:=b/c;
	DBMS_OUTPUT.PUT_LINE(d);
	
	exception
		when e then
			DBMS_OUTPUT.PUT_LINE('This is Negative number');
			c:=c*(-1);
			d:=b/c;
			DBMS_OUTPUT.PUT_LINE(d);
		when TOO_MANY_ROWS then
			DBMS_OUTPUT.PUT_LINE('Many row detected');
		when NO_DATA_FOUND then
			DBMS_OUTPUT.PUT_LINE('No data found');
		when ZERO_DIVIDE then
			DBMS_OUTPUT.PUT_LINE('Cannot divide by zero');
		when others then
			DBMS_OUTPUT.PUT_LINE('Other error found');
end;
/




--PACKAGE DECLARE--
create or replace package myPackage as
	function myFunction(a in UserAccount.id%type)
	return number;
	
	procedure myProcedure(b in UserAccount.id%type);
end myPackage;
/

--IMPLEMENTING THE BODY OF A PACKAGE--
create or replace package body myPackage as
	function myFunction(a in UserAccount.id%type)
	return number
	is
	
	begin
		if mod(a,2)=0 then
			return 1;
		else
			return 0;
		end if;
	end myFunction;
	
	
	procedure myProcedure(b in UserAccount.id%type)
	is
	
	begin
		if mod(b,2)=0 then
			DBMS_OUTPUT.PUT_LINE('EVEN');
		else
			DBMS_OUTPUT.PUT_LINE('ODD');
		end if;
	end myProcedure;
end myPackage;
/

--CALL FUNCTION OR PROCEDRE IN PACKAGE--
select myPackage.myFunction(100) as res from dual;
exec myPackage.myProcedure(51);

declare
	a UserAccount.id%type:=&x;
	b UserAccount.amount%type;
	c number;
begin
	select amount into b from UserAccount where id=a;
	c:=myPackage.myFunction(b);
	DBMS_OUTPUT.PUT_LINE(c);
	myPackage.myProcedure(b);
end;
/



--TRIGER--
create or replace trigger hellow
after insert 
on userAccount
declare

begin
	DBMS_OUTPUT.PUT_LINE('AUST');
end;
/


insert into UserAccount values(29,'Sultana','Female',25,24000);
insert into UserAccount values(30,'Samad','Male',29,26000);


create or replace trigger ax
after insert or delete
on userAccount
declare
	
begin
	DBMS_OUTPUT.PUT_LINE('User Account');
end;
/

delete from UserAccount where id=30;


create or replace trigger updatetable
after update
of amount on  UserAccount
declare

begin
	DBMS_OUTPUT.PUT_LINE('Successfully Update');
end;
/

update UserAccount set amount=27000 where id=30;



--ROW LEVEL TRIGGER--
CREATE OR REPLACE TRIGGER HELLO5 
AFTER UPDATE 
OF TAKA
ON MONEY
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('HELLO5');
END;
/

UPDATE MONEY SET TAKA=900 WHERE ID=5;
UPDATE MONEY SET TAKA=1200;
SELECT * FROM MONEY;


CREATE OR REPLACE TRIGGER HELLO6 
BEFORE UPDATE 
OF taka
ON money
FOR EACH ROW
DECLARE
	A money.id%TYPE;
	B money.name%TYPE;
	C money.taka%TYPE;
BEGIN
	A := :OLD.ID;
	B := :OLD.NAME;
	C := :OLD.TAKA;
	INSERT INTO money1 VALUES(A, B, C);
END;
/

UPDATE MONEY SET TAKA=2000 WHERE ID=1;


clear scree;
set verify off;
set serveroutput on;


commit;
















