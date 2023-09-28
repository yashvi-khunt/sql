---user defined types

use MOVIES_W3

create type actorType as table(firstName varchar(50),lastName varchar(50),age int)

create procedure readActors
@a actorType readonly
as
select * from @a
return 0;

declare @act as actorType
insert into @act
select act_fname,act_lname,10 from actor
EXEC readActors @ACT	

