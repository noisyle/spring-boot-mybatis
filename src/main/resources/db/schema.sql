create table sys_user
(
   id integer not null,
   username varchar(255) not null,
   password varchar(255) not null,
   mobile varchar(255),
   primary key(id)
);

create table sys_role
(
   id integer not null,
   rolename varchar(255) not null,
   primary key(id)
);

create table sys_r_user_role
(
   id integer not null,
   userid integer not null,
   roleid integer not null,
   primary key(id)
);

create table forum_topic
(
   id integer not null,
   userid integer not null,
   title varchar(4000) not null,
   content varchar(4000) not null,
   primary key(id)
);

create table forum_comment
(
   id integer not null,
   userid integer not null,
   topicid integer not null,
   content varchar(4000) not null,
   primary key(id)
);