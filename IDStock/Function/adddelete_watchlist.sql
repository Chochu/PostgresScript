-- FUNCTION: public.adddelete_watchlist(character varying, integer, character varying)

-- DROP FUNCTION public.adddelete_watchlist(character varying, integer, character varying);

CREATE OR REPLACE FUNCTION public.adddelete_watchlist(
	psymbol character varying,
	puserid integer,
	actiontype character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
AS $BODY$
   DECLARE
      ReturnCode varchar(255);
   BEGIN
		IF ActionType = 'A' THEN
			--Add
			IF (SELECT COUNT(*) FROM "WatchList" WHERE "UserID" = puserid AND "Symbol" = psymbol) = 0 THEN
				INSERT INTO "WatchList"("UserID" , "Symbol")
				VALUES (puserid , psymbol );
				ReturnCode := 'A';
			END IF;
		--Delete
		ELSIF ActionType = 'D' THEN
			DELETE FROM "WatchList"
			WHERE "UserID" = puserid AND "Symbol" = psymbol;
			ReturnCode := 'D';
		ELSE
		  	ReturnCode := 'E';
		END IF;

      RETURN ReturnCode;
   END;
$BODY$;

ALTER FUNCTION public.adddelete_watchlist(character varying, integer, character varying)
    OWNER TO postgres;
