CREATE VIEW "CONTRACT_MANAGEMENT"."V_CONTATTO_MAIL"
AS
	SELECT  "CONTRACT_MANAGEMENT"."CONTRACTS"."ID_CONTRACT", 
	"CONTRACT_MANAGEMENT"."CONTRACTS"."ID_UNIQUE_SUP", 
	"CONTRACT_MANAGEMENT"."CONTRACTS"."CONTACT_EMAIL", 
	"CONTRACT_MANAGEMENT"."SUPPLIERS"."CUI"
		FROM "CONTRACT_MANAGEMENT"."CONTRACTS"
			INNER JOIN "CONTRACT_MANAGEMENT"."SUPPLIERS"
			ON "CONTRACT_MANAGEMENT"."CONTRACTS"."ID_UNIQUE_SUP" = "CONTRACT_MANAGEMENT"."SUPPLIERS"."ID_UNIQUE_SUP"