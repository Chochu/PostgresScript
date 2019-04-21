-- FUNCTION: public.addupdatedeletesm(character varying, character varying, character varying, date, character varying, character varying, character varying, character varying, boolean, character varying)

-- DROP FUNCTION public.addupdatedeletesm(character varying, character varying, character varying, date, character varying, character varying, character varying, character varying, boolean, character varying);

CREATE OR REPLACE FUNCTION public.addupdatedeletesm(
	psymbol character varying,
	pexchange character varying,
	psecurityname character varying,
	pstartdate date,
	pstocktype character varying,
	piexid character varying,
	pregion character varying,
	pcurrency character varying,
	pisenabled boolean,
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
			IF (SELECT COUNT(*) FROM "SecurityMaster" where "iexID" = piexID) = 0 THEN
				INSERT INTO "SecurityMaster"("SecurityName"
											 , "Region"
											 , "Startdate"
											 , "Symbol"
											 , "iexID"
											 , "StockType"
											 , "exchange"
											 , "currency"
											 , "isEnabled"										
											)
				values (pSecurityName 
						,pRegion 
						,pStartdate
						,pSymbol 
						,piexID 
						,pStockType
						,pexchange
						,pcurrency 
						,pisEnabled
					   );
				ReturnCode := 'A';						
			--Update
			ELSE 
				Update "SecurityMaster"
				SET "SecurityName" = pSecurityName
					,"Region" = pRegion
					,"Startdate" = pStartdate					
					,"Symbol" = pSymbol
					,"StockType" = pStockType
					,"exchange" =  pexchange
					,"currency" = pcurrency
					,"isEnabled" = pisEnabled
				WHERE "iexID" = piexID;
				ReturnCode := 'U';
			END IF;
		--Delete
		ELSIF ActionType = 'D' THEN
			DELETE FROM "SecurityMaster"
			WHERE "iexID" = piexID;
			ReturnCode := 'D';	 
		ELSE
		  	ReturnCode := 'E';	 
		END IF;	
	       
      RETURN ReturnCode;
   END; 
$BODY$;

ALTER FUNCTION public.addupdatedeletesm(character varying, character varying, character varying, date, character varying, character varying, character varying, character varying, boolean, character varying)
    OWNER TO postgres;
