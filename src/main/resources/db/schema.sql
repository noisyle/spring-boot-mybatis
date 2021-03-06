create table sys_user
(
   id integer not null COMMENT '唯一标识',
   username varchar(255) not null COMMENT '登录名',
   password varchar(255) not null COMMENT '密码',
   mobile varchar(255) COMMENT '手机号',
   salary varchar(255) COMMENT '收入',
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
   createtime timestamp not null default sysdate,
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

create sequence seq_forum_comment
   START WITH 1000
   INCREMENT BY 1
   NOCACHE
   NOCYCLE;
