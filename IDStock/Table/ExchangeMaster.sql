-- Table: public.exchangemaster

-- DROP TABLE public.exchangemaster;

CREATE TABLE public.exchangemaster
(
    exchange character varying COLLATE pg_catalog."default" NOT NULL,
    region character varying COLLATE pg_catalog."default",
    description character varying COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.exchangemaster
    OWNER to postgres;
