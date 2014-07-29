show databases;
 
/* create database */
create database if not exists comments
    character set = utf8;
 
use comments;
 
/* create table */
create table if not exists t_comments (
    id int auto_increment primary key,
    topic_id char(32) not null,
    topic_title char(255) not null,
    submitter char(32) not null,
    time datetime not null,
    text text
);
 
select * from t_comments;
 
insert into t_comments (topic_id, topic_title, submitter, time, text)
    values
(
    "ABCD5822YUHJ9087NBVS9934RTEW6521",
    "http://192.168.205.1/html5/offlines.html",
    "hudamin",
    /*"2012-05-24 21:40:05",*/
    current_timestamp(),
    /*now(),*/
    "Just a test!!"
);

select * from t_comments;
 
