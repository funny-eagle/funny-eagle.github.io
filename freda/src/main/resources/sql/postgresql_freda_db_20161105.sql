-- table: public.archive

-- drop table public.archive;

create table public.archive
(
    id character varying(32) collate pg_catalog.default not null,
    title character varying(100) collate pg_catalog.default,
    author character varying(50) collate pg_catalog.default,
    preview character varying(200) collate pg_catalog.default,
    md_content text collate pg_catalog.default,
    html_content text collate pg_catalog.default,
    tag character varying(50) collate pg_catalog.default,
    type character varying(50) collate pg_catalog.default,
    source_link character varying(300) collate pg_catalog.default,
    state character varying(50) collate pg_catalog.default,
    create_time timestamp with time zone,
    update_time timestamp with time zone,
    constraint archive_pkey primary key (id)
)
with (
    oids = false
)
tablespace pg_default;

alter table public.archive
    owner to postgres;
comment on table public.archive
    is '文档表';

-- 20170714 修改state字段类型为integer
ALTER TABLE public.archive ALTER state TYPE integer USING state::integer;

-- table: public.user

-- drop table public.user;

create table public.user
(
    id character varying(32) collate pg_catalog.default not null,
    username character varying(50) collate pg_catalog.default,
    password character varying(100) collate pg_catalog.default,
    create_time timestamp with time zone,
    last_login_time timestamp with time zone,
    last_login_ip character varying(50) collate pg_catalog.default,
    constraint user_pkey primary key (id)
)
with (
    oids = false
)
tablespace pg_default;

alter table public.user
    owner to postgres;
comment on table public.user
    is '用户表';