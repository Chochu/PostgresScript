-- Table: public."ExchangeMaster"

-- DROP TABLE public."ExchangeMaster";

CREATE TABLE public."ExchangeMaster"
(
    exchange character varying COLLATE pg_catalog."default" NOT NULL,
    region character varying COLLATE pg_catalog."default",
    description character varying COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."ExchangeMaster"
    OWNER to postgres;