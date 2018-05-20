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
   userid varchar(255) not null,
   roleid varchar(255) not null,
   primary key(id)
);