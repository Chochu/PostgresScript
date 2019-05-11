-- Table: public.summary

-- DROP TABLE public.summary;

CREATE TABLE public.summary
(
    "iexId" character varying COLLATE pg_catalog."default",
    "effectiveDate" date,
    "MarketCap" double precision,
    "PreviousClose" double precision,
    "Open" double precision,
    "Bid" double precision,
    "BidVolumne" integer,
    "Ask" double precision,
    "AskVolumne" integer,
    "DayRangeLow" double precision,
    "DayRangeHigh" double precision,
    "WeekRange52Low" double precision,
    "WeekRange52High" double precision,
    "Volume" bigint,
    "AvgVolume" bigint
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.summary
    OWNER to postgres;
