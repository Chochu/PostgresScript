
CREATE OR REPLACE FUNCTION public.get_watchlist(
	puserid int
)
    RETURNS TABLE
	(
		"Symbol" character varying,
		"iexId" character varying,
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
    LANGUAGE 'plpgsql'
AS $BODY$
    BEGIN

		RETURN QUERY
		WITH LaststSummary AS (
			SELECT "iexId", MAX("effectiveDate") AS effectiveDate
			FROM Summary
			GROUP BY "iexId"
     	)
		SELECT  WL.Symbol, S.*
		FROM WatchList as WL
		LEFT JOIN SecurityMaster as SM on SM."Symbol" = WL.Symbol
		LEFT JOIN Summary as S on SM."iexID" = S."iexId"
		INNER JOIN LaststSummary as LS on S."iexId" = LS."iexId"
			AND S."effectiveDate" = LS.effectiveDate
		WHERE WL.UserID = puserid;

    END;
$BODY$;
