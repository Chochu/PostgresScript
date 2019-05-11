-- Table: public.watchlist

-- DROP TABLE public.watchlist;

CREATE TABLE public.watchlist
(
    symbol character varying COLLATE pg_catalog."default" NOT NULL,
    userid character varying COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.watchlist
    OWNER to postgres;
