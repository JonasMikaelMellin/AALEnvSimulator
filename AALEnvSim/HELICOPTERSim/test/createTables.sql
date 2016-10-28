create database simtest;
use simtest;
drop table intData;
drop table doubleData;
drop table log ;

drop table eventType;
drop database simtest; 


create table eventType(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(64),
UNIQUE INDEX eventType_index(name),
details VARCHAR(256)) DATA DIRECTORY = 'D:\DBS';

create table log(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
t timestamp NOT NULL,
eid INTEGER NOT NULL,
UNIQUE INDEX eidTime_index(eid,t),
INDEX eid_index(eid),
FOREIGN KEY(eid)
	references eventType(id)
    on delete cascade,
information VARCHAR(256)
) DATA DIRECTORY = 'D:\DBS';

create table doubleData(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
lid INTEGER NOT NULL,
INDEX lid_index(lid),
foreign key(lid) 
	references log(id)
    on delete cascade,
name VARCHAR(32),
INDEX doubleData_index(name),
UNIQUE INDEX lidAndName_index(lid,name),
data DOUBLE) DATA DIRECTORY= 'D:\DBS';

create table intData(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
lid INTEGER NOT NULL,
INDEX lid_index(lid),
foreign key(lid) 
	references log(id)
    on delete cascade,
name VARCHAR(32),
INDEX intData_index(name),
UNIQUE INDEX lidAndName_index(lid,name),
data INTEGER) DATA DIRECTORY= 'D:\DBS';

grant select, insert, update, delete on eventType to access@localhost;
grant select, insert, update, delete on log to access@localhost;
grant select, insert, update, delete on doubleData to access@localhost;
grant select, insert, update, delete on intData to access@localhost;
select * from log;
select log.t,eventtype.name,eventType.details,doubleData.name,doubleData.data from log inner join eventtype on log.eid=eventtype.id left join doubleData on log.id=doubleData.lid;
select * from eventType;
describe eventtype;
select * from doubleData;
delete from log where id>0;
desc tablespace;