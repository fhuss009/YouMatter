drop database if exists You_Matter;

/*
if database is existing and you don't want to drop it here is the code
for droping the tables, triggers, and procedures of this database

drop table if exists Story;
drop table if exists ReplyTo;
drop table if exists Reply;
drop table if exists Counselors;
drop trigger if exists delStrory;
drop procedure if exists cleanStories;
*/

create database You_Matter;
use You_Matter;

create table Counselor (
 firstName varchar(20) not null,
 lastName varchar(20) not null,
 middleInitial char(1),
 sex char(1) not null,
 email varchar(30) not null,
 phoneNumber decimal(10) not null,
 specialty varchar(100) not null,
 bio varchar(5000),
 password varchar(50),
 primary key (email));

create table Story (
 ID int auto_increment not null,
 time timestamp default current_timestamp,
 story varchar(10000) not null,
 primary key (ID));

create table Reply (
 ID int auto_increment not null,
 reply varchar(10000) not null,
 likes int default 0,
 primary key (ID));

create table ReplyTo (
 storyID int not null,
 replyID int not null,
 foreign key (storyID)
 references Story(ID),
 foreign key (replyID)
 references Reply(ID));

delimiter :D

create procedure cleanStories ()
 begin
  delete Story.*
  from Story
  where Story.time < date_sub(now(), interval 7 day);
 end
:D

create trigger delStory
before delete on Story
for each row
 begin
  declare story int default old.ID;
  declare reply int default (select ReplyTo.replyID
                             from ReplyTo
                             where ReplyTo.storyID = old.ID);

  delete ReplyTo.*
  from ReplyTo
  where replyID = reply;

  delete Reply.*
  from Reply
  where Reply.ID = reply;
 end
:D

delimiter ;
