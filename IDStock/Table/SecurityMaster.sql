-- Table: public."SecurityMaster"

-- DROP TABLE public."SecurityMaster";

CREATE TABLE public."SecurityMaster"
(
    "SecurityName" character varying COLLATE pg_catalog."default",
    "Region" character varying COLLATE pg_catalog."default",
    "Startdate" date,
    "Symbol" character varying COLLATE pg_catalog."default" NOT NULL,
    "iexID" character varying COLLATE pg_catalog."default" NOT NULL,
    "StockType" character varying COLLATE pg_catalog."default",
    exchange character varying COLLATE pg_catalog."default",
    currency character varying COLLATE pg_catalog."default",
    "isEnabled" boolean,
    CONSTRAINT "SecurityMaster_pkey" PRIMARY KEY ("iexID", "Symbol")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."SecurityMaster"
    OWNER to postgres;