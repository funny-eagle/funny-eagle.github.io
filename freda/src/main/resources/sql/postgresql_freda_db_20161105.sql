-- Table: public."ARCHIVE"

-- DROP TABLE public."ARCHIVE";

CREATE TABLE public."ARCHIVE"
(
    "ID" character varying(32) COLLATE pg_catalog."default" NOT NULL,
    "TITLE" character varying(100) COLLATE pg_catalog."default",
    "AUTHOR" character varying(50) COLLATE pg_catalog."default",
    "MD_CONTENT" text COLLATE pg_catalog."default",
    "HTML_CONTENT" text COLLATE pg_catalog."default",
    "TAG" character varying(50) COLLATE pg_catalog."default",
    "TYPE" character varying(50) COLLATE pg_catalog."default",
    "SOURCE_LINK" character varying(300) COLLATE pg_catalog."default",
    "STATE" character varying(50) COLLATE pg_catalog."default",
    "CREATE_TIME" timestamp with time zone,
    "UPDATE_TIME" timestamp with time zone,
    CONSTRAINT "ARCHIVE_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."ARCHIVE"
    OWNER to postgres;
COMMENT ON TABLE public."ARCHIVE"
    IS '文档表';
    

-- Table: public."USER"

-- DROP TABLE public."USER";

CREATE TABLE public."USER"
(
    "ID" character varying(32) COLLATE pg_catalog."default" NOT NULL,
    "USERNAME" character varying(50) COLLATE pg_catalog."default",
    "PASSWORD" character varying(100) COLLATE pg_catalog."default",
    "CREATE_TIME" timestamp with time zone,
    "LAST_LOGIN_TIME" timestamp with time zone,
    "LAST_LOGIN_IP" character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT "USER_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."USER"
    OWNER to postgres;
COMMENT ON TABLE public."USER"
    IS '用户表';