CREATE TABLE archive (
id int PRIMARY KEY NOT NULL,
title text ,
author text ,
md_content text ,
html_content text ,
preview text ,
tag text ,
type text ,
source_link text ,
state text,
create_time text,
update_time text
);


CREATE TABLE comment (
id int PRIMARY KEY NOT NULL,
archive_id text ,
comment_username text ,
comment_user_email text ,
comment_user_ip_address text ,
comment_content text ,
create_time text,
pid int
);


CREATE TABLE user (
id int PRIMARY KEY NOT NULL,
username text ,
password text ,
create_time text,
last_login_time text,
last_login_ip text
);