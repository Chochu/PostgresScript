-- FUNCTION: public.uf_getsecuritymasterlike(character varying)

-- DROP FUNCTION public.uf_getsecuritymasterlike(character varying);

CREATE OR REPLACE FUNCTION public.uf_getsecuritymasterlike(
	psecurity character varying)
    RETURNS TABLE("SecurityName" character varying, "Region" character varying, "Startdate" date, "Symbol" character varying, "iexID" character varying, "StockType" character varying, exchange character varying, currency character varying, "isEnabled" boolean)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$
DECLARE var_search character varying;
BEGIN

	var_search  :=  '%' || pSecurity || '%';

	RETURN QUERY
	SELECT  SecurityMaster."SecurityName",
			SecurityMaster."Region",
			SecurityMaster."Startdate",
			SecurityMaster."Symbol",
			SecurityMaster."iexID",
			SecurityMaster."StockType",
			SecurityMaster.exchange,
			SecurityMaster.currency,
			SecurityMaster."isEnabled"
	FROM public.SecurityMaster
	WHERE lower(SecurityMaster."SecurityName") LIKE lower(var_search)
		OR lower(SecurityMaster."Symbol") LIKE lower(var_search);

END;
$BODY$;

ALTER FUNCTION public.uf_getsecuritymasterlike(character varying)
    OWNER TO postgres;
