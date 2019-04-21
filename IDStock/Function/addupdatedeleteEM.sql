-- FUNCTION: public.addupdatedeletesm(character varying, character varying, character varying, date, character varying, character varying, character varying, character varying, boolean, character varying)

-- DROP FUNCTION public.addupdatedeletesm(character varying, character varying, character varying, date, character varying, character varying, character varying, character varying, boolean, character varying);

CREATE OR REPLACE FUNCTION public.addupdatedeleteEM(
	pexchange character varying,
	pregion character varying,
	pdescription character varying,	
	actiontype character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
   DECLARE      
      ReturnCode varchar(255);
   BEGIN
		IF ActionType = 'A' or ActionType = 'U' THEN
			--Add
			IF (SELECT COUNT(*) FROM "ExchangeMaster" where "exchange" = pexchange) = 0 THEN
				INSERT INTO "ExchangeMaster"("exchange"
											 , "Region"
											 , "description"									
											)
				values (pexchange 
						,pRegion 
						,pdescription
					   );
				ReturnCode := 'A';						
			--Update
			ELSE 
				Update "ExchangeMaster"
				SET "exchange" = pexchange
					,"Region" = pRegion
					,"description" = pdescription		
				WHERE "exchange" = pexchange;
				ReturnCode := 'U';
			END IF;
		--Delete
		ELSIF ActionType = 'D' THEN
			DELETE FROM "ExchangeMaster"
			WHERE "exchange" = pexchange;
			ReturnCode := 'D';	 
		ELSE
		  	ReturnCode := 'E';	 
		END IF;	
	       
      RETURN ReturnCode;
   END; 
$BODY$;

ALTER FUNCTION public.addupdatedeleteEM(character varying, character varying, character varying, character varying)
    OWNER TO postgres;
