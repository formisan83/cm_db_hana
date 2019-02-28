SET SCHEMA "CONTRACT_MANAGEMENT";
-- Contratti legati ad un CS
CREATE VIEW "V_CONTRACT_TO_CS"
AS
	SELECT DISTINCT
	
	    C."ID_CONTRACT"                         as "IdContract",
	    C."PLANT"                               AS "Plant",
	    
		S."SUPPLIER_NAME"                      AS "SupplierName",
		S."ID_SUPPLIER"                        AS "CodFornitore",
		
		CS."NAME"                             AS "CSName",
		CS."SURNAME"                          AS "CSSurname",
		CS."ID_CONTRACT_SUPERVISORS"          AS "CSId"
		
		FROM "CONTRACT_MANAGEMENT"."CONTRACTS" as C
		
		JOIN "CONTRACT_MANAGEMENT"."SUPPLIERS" as S on S."ID_UNIQUE_SUP" = C."ID_UNIQUE_SUP"
	
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASSOCIATIONS" as CA on CA."ID_CONTRACT" = C."ID_CONTRACT"
		
		--LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASS_STATUS" as CAS on CAS."ID_CONTRACT_ASS_STATUS" = CA."ID_CONTRACT_ASS_STATUS"
		
--		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASS_STATUS_T" as CAST on CAST."ID_CONTRACT_ASS_STATUS_T" = CAS."ID_CONTRACT_ASS_STATUS_T"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASSOCIATION_DETAILS" as CAD on CAD."ID_CONTRACT_ASSOCIATION" = CA."ID_CONTRACT_ASSOCIATION"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_SUPERVISORS" as CS on CS."ID_CONTRACT_SUPERVISORS" = CAD."ID_CONTRACT_SUPERVISORS"
		
--		LEFT JOIN "CONTRACT_MANAGEMENT"."GREEN_SHEETS" as GS on C."ID_CONTRACT" = GS."ID_CONTRACT"

		WHERE CA."IS_ACTIVE_VERSION" = '1';
--Creazion View operazioni odm (view creata in vista di eventuale espansione delle tabelle odm)
CREATE VIEW "V_ODM_OPERATIONS"
AS
	SELECT DISTINCT
	    OP."ID_ODM"              AS "IdOdm",
	    OP."ID_ODM_OPERATION"    AS "IdOdmOperation",
	    OP."RECIPIENT_SCP"       AS "RecipientScp"
		FROM "CONTRACT_MANAGEMENT"."ODM_OPERATIONS" as OP;
		
/* Relatione tra CS e PLANT */
CREATE VIEW "V_REL_CONTRACT_SUPERVISORS" 
AS
	SELECT DISTINCT
	    RUA."ID_UB"                     AS "IdUb",
	    RUA."UB_DESC"                   AS "UbDesc",
	    RUA."AFNAM"                     AS "Afnam",
	    RUA."AFNAM_DESC"                AS "AfnamDesc",
	    RUA."PLANT"                     AS "Plant",
	    RUA."PLANT_DESC"                AS "PLANTDESC",
	    
	    CS."ID_CONTRACT_SUPERVISORS" AS "ID_CONTRACT_SUPERVISORS",
	    CS."NAME" AS "NAME",
	    CS."SURNAME" AS "SURNAME",
	    CS."EMAIL" AS "EMAIL",
	    CS."IS_CS" AS "IS_CS",
	    CS."IS_ASSISTANT_CS_SIC" AS "IS_ASSISTANT_CS_SIC",
	    CS."IS_ASSISTANT_CS_AMM" AS "IS_ASSISTANT_CS_AMM",
	    CS."IS_ASSISTANT_CS_MAN" AS "IS_ASSISTANT_CS_MAN"
	    
	    
		FROM "CONTRACT_MANAGEMENT"."REL_UB_TO_AFNAM" as RUA
		
		JOIN "CONTRACT_MANAGEMENT"."REL_USER_UB" as RUU on RUU."ID_UB" = RUA."ID_UB"
		
		JOIN "CONTRACT_MANAGEMENT"."CONTRACT_SUPERVISORS" as CS on CS."ID_CONTRACT_SUPERVISORS" = RUU."USERMANE";
		
/* Worker */
CREATE VIEW "V_WORKERS" 
AS
	SELECT DISTINCT
	    W."ID_WORKER"                   AS "IdWorker",
	    W."NAME"                        AS "WorkerName",
	    W."SURNAME"                     AS "WorkerSurname",
        W."DATE_BIRTH"                  AS "WorkerDateBirth",   
        W."GENDER"                      AS "WorkerGender",
        W."RESIDENCE"                   AS "WorkerResidence",
        W."CONTRACT_EXPIRED_DATE"       AS "WorkerContractExpiredDate",
        W."EU_CITIZEN"                  AS "WorkerCitizenship",
        W."DPI_III_LEVEL"               AS "WorkerDpiIIILevel",
        W."CREATED_BY"                  AS "WorkerCreatedBy",
        W."CHANGED_BY"                  AS "WorkerChangedBy",
        W."CREATED_DATE"                AS "WorkerCreatedDate",        W."CHANGED_DATE"                AS "WorkerChangedDate",
	    
	    WCT."ID_WORKER_CONTRACT_TYPE"   as "IdWorkerContractType",
	    WCTT."TEXT"                     as "WorkerContractTypeText",
	    WCTT."SPRAS"                    as "WorkerContractTypeSpras"
	    
		FROM "CONTRACT_MANAGEMENT"."WORKERS" as W
		
		JOIN "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES" as WCT on WCT."ID_WORKER_CONTRACT_TYPE" = W."ID_WORKER_CONTRACT_TYPE"
		JOIN "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES_T" as WCTT on WCTT."ID_WORKER_CONTRACT_TYPE_T" = WCT."ID_WORKER_CONTRACT_TYPE_T";
		
/* Relation between suppliers & workers */
CREATE VIEW "V_REL_SUPPLIER_WORKER" 
AS
	SELECT DISTINCT
	    W."ID_WORKER"                   AS "IdWorker",
	    W."NAME"                        AS "WorkerName",
	    W."SURNAME"                     AS "WorkerSurname",
	    W."DATE_BIRTH"                  AS "WorkerDateBirth",
	    W."GENDER"                      AS "WorkerGender",
	    W."RESIDENCE"                   AS "WorkerResidence",
	    W."CONTRACT_EXPIRED_DATE"       AS "WorkerContractExpiredDate",
	    W."CUSTOM_ROLES"                AS "WorkerCustomRoles",
	    W."CUSTOM_QUALIFICATIONS"       AS "WorkerCustomQualifications",
	    W."EU_CITIZEN"                  AS "WorkerCitizenship",
        W."DPI_III_LEVEL"               AS "WorkerDpiIIILevel",
        W."CREATED_BY"                  AS "WorkerCreatedBy",
        W."CHANGED_BY"                  AS "WorkerChangedBy",
        W."CREATED_DATE"                AS "WorkerCreatedDate",
        W."CHANGED_DATE"                AS "WorkerChangedDate",
	    
	    WCT."ID_WORKER_CONTRACT_TYPE"    as "IdWorkerContractType",
	    WCTT."TEXT"                      as "WorkerContractTypeText",
	    WCTT."SPRAS"                     as "WorkerContractTypeSpras",
	    RSW."ID_UNIQUE_SUP"              as "IdSupplier",
	    RSW."VALIDATED_BY"               as "WorkerValidatedBy",
	    RSW."STATUS"                     as "WorkerStatus",
	    ATST."TEXT"                      as "WorkerStatusText",     
	    S."SUPPLIER_NAME"                as "SupplierName",
	    MIN(A."EXPIRED_DATE")            as "minAttachmentExpiredDate"
		FROM "CONTRACT_MANAGEMENT"."WORKERS" as W
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."DOCUMENTS" as D on D."ID_WORKER" = W."ID_WORKER"
		LEFT JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES" as DT on DT."ID_DOC_TYPES" = D."ID_DOC_TYPE"
	    LEFT JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES_T" as DTT on DTT."ID_DOC_TYPES_T" = DT."ID_DOC_TYPES_T"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENTS" as A on A."ID_DOCUMENT" = D."ID_DOCUMENT"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" as AST on AST."ID_ATTACHMENT_STATUS" = A."ID_ATTACHMENT_STATUS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" as ASTT on ASTT."ID_ATTACHMENT_STATUS_T" = AST."ID_ATTACHMENT_STATUS_T"
			
		LEFT JOIN "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES" as WCT on WCT."ID_WORKER_CONTRACT_TYPE" = W."ID_WORKER_CONTRACT_TYPE"
		LEFT JOIN "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES_T" as WCTT on WCTT."ID_WORKER_CONTRACT_TYPE_T" = WCT."ID_WORKER_CONTRACT_TYPE_T"
		
		JOIN "CONTRACT_MANAGEMENT"."REL_SUPPLIER_WORKER" as RSW on RSW."ID_WORKER" = W."ID_WORKER"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" as ATS on ATS."ID_ATTACHMENT_STATUS" = RSW."STATUS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" as ATST on ATST."ID_ATTACHMENT_STATUS_T" = ATS."ID_ATTACHMENT_STATUS"
		
		JOIN "CONTRACT_MANAGEMENT"."SUPPLIERS" as S on S."ID_UNIQUE_SUP" = RSW."ID_UNIQUE_SUP"
		GROUP BY W.ID_WORKER, 
		         W.NAME, 
		         W.SURNAME,
                 W."DATE_BIRTH",     
                 W."GENDER",     
                 W."RESIDENCE",
                 W."CONTRACT_EXPIRED_DATE",
                 W."CUSTOM_ROLES",
                 W."CUSTOM_QUALIFICATIONS",
                 W."EU_CITIZEN",
                 W."DPI_III_LEVEL",
                 W."CREATED_BY",
                 W."CHANGED_BY", 
                 W."CREATED_DATE",
                 W."CHANGED_DATE",
                 WCT."ID_WORKER_CONTRACT_TYPE",
                 WCTT."TEXT",         
                 WCTT."SPRAS",          
                 RSW."ID_UNIQUE_SUP",    
                 RSW."VALIDATED_BY",
                 RSW."STATUS",
                 ATST."TEXT",
                 S."SUPPLIER_NAME";
                 
/* Relation between suplliers & vehicles */
CREATE VIEW "V_REL_SUPPLIER_VEHICLES" 
AS
	SELECT DISTINCT
	    V."ID_VEHICLES"                 AS "IdVehicles",
	    V."BRAND"                       AS "Brand",
	    V."ID_VEHICLES_TYPE"            AS "IdVehiclesType",
	    V."FILENAME_IMAGE"              AS "FileNameImageVehicle",
        V."CREATED_BY"                  AS "CreatedBy",
        V."CHANGED_BY"                  AS "ChangedBy",
        V."CREATED_DATE"                AS "CreatedDate",
        V."CHANGED_DATE"                AS "ChangedDate",

	    VTT."TEXT"                      AS "VehiclesTypeText",
	    RSV."ID_UNIQUE_SUP"             AS "IdSupplier",
	    RSV."VALIDATED_BY"              AS "VehicleValidatedBy",
	    RSV."STATUS"                    AS "VehicleStatus"
		FROM "CONTRACT_MANAGEMENT"."VEHICLES" as V
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."VEHICLES_TYPES" as VT on VT."ID_VEHICLES_TYPE" = V."ID_VEHICLES_TYPE"
		LEFT JOIN "CONTRACT_MANAGEMENT"."VEHICLES_TYPES_T" as VTT on VTT."ID_VEHICLES_TYPES_T" = VT."ID_VEHICLES_TYPES_T"
	    LEFT JOIN "CONTRACT_MANAGEMENT"."REL_SUPPLIER_VEHICLES" as RSV on RSV."ID_VEHICLES" = V."ID_VEHICLES";
		
		
/* Rel between documents & vehicle ) */		
CREATE VIEW "V_REL_VEHICLE_DOCUMENT"
AS
	SELECT DISTINCT
	    V."ID_VEHICLES" AS "IdVehicle",
	    V."BRAND" AS "VehicleBrand",
	    
	    VT."ID_VEHICLES_TYPE"            AS "IdVehicleType",
	    VTT."TEXT"                       AS "VehicleTypeText",
	    VTT."SPRAS"                      AS "VehicleTypeTextSpras",
	    
	    D."ID_DOCUMENT"                  AS "IdDocument",
	    D."ID_DOC_TYPE"                  AS "IdDocumentType",
	    D."ID_UNIQUE_SUP"                AS "IdSupplier",
	    D."TITLE"                        AS "DocumentTitle",
	    D."DESCRIPTION"                  AS "DocumentDescription",
	    D."ID_CONTRACT"                  AS "IdContract",
	    D."ID_COMMON_DOCUMENTS"          AS "IdCommonDocuments",
	    D."TYPE_OF_ADDITION"             AS "TypeOfAddition",
	    
	    DT."ID_DOC_TYPES_T"               AS "IdDocumentTypeT",
	    
	    RDRC."ID_CONTRACT"               AS "IdContractRTS",
	             
	    A."ID_ATTACHMENT"                AS "IdAttachment",
	    A."FILENAME"                     AS "AttachmentFileName",
	    A."EXPIRED_DATE"                 AS "AttachmentExpiredDate",
	    A."ID_ATTACHMENT_STATUS"         AS "IdAttachmenttatus",
	    A."APPROVAL_DATE"                AS "AttachmentApprovalDate",
	    A."APPROVAL_USER"                AS "AttachmentApprovalUser",
	    A."DOC_ON_OPENTEXT"              AS "AttachmentOnOpenText",
	    A."ID_OPEN_TEXT"                 AS "IdAttachmentOpenText",
	    
	    RDA."UPLOAD_FROM"                AS "UploadFrom",
	    RDA."ID_CONTRACT_OF_REL"         AS "IdContractOfRel",
	    RDA."NOTA_RIFIUTO"               AS "NotaRifiuto",
	    
	    ASTT."TEXT"                      AS "AttchamentStatusText"
	    
		FROM "CONTRACT_MANAGEMENT"."VEHICLES" as V
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."VEHICLES_TYPES" as VT on VT."ID_VEHICLES_TYPE" = V."ID_VEHICLES_TYPE"
		LEFT JOIN "CONTRACT_MANAGEMENT"."VEHICLES_TYPES_T" as VTT on VTT."ID_VEHICLES_TYPES_T" = VT."ID_VEHICLES_TYPES_T"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."DOCUMENTS" as D on D."ID_VEHICLE" = V."ID_VEHICLES"
		LEFT JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES" as DT on DT."ID_DOC_TYPES" = D."ID_DOC_TYPE"
	    LEFT JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES_T" as DTT on DTT."ID_DOC_TYPES_T" = DT."ID_DOC_TYPES_T"

		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_DOCUMENT_RTS_CONTRACT" as RDRC on RDRC."ID_DOCUMENT" = D."ID_DOCUMENT"
		
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENTS" as A on A."ID_DOCUMENT" = D."ID_DOCUMENT"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" as AST on AST."ID_ATTACHMENT_STATUS" = A."ID_ATTACHMENT_STATUS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" as ASTT on ASTT."ID_ATTACHMENT_STATUS_T" = AST."ID_ATTACHMENT_STATUS_T"
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_DOCUMENT_ATTACHMENTS" as RDA on (RDA."ID_DOCUMENT" = D."ID_DOCUMENT" AND RDA."ID_ATTACHMENT" = A."ID_ATTACHMENT" )OR( RDA."ID_DOCUMENT" = RDRC."ID_DOCUMENT" AND RDA."ID_ATTACHMENT" = A."ID_ATTACHMENT");
		
/* Rel between contract & workers ) */		
CREATE VIEW "V_REL_VEHICLE_CONTRACTS" 
AS
	SELECT DISTINCT
	    W."ID_VEHICLES"                 AS "IdVehicles",
	    W."BRAND"                       AS "Brand",
	    W."ID_VEHICLES_TYPE"            AS "IdVehiclesType",
	    W."FILENAME_IMAGE"              AS "FileNameImageVehicle", 
        W."CREATED_BY"                  AS "VehiclesCreatedBy",
        W."CHANGED_BY"                  AS "VehiclesChangedBy",
        W."CREATED_DATE"                AS "VehiclesCreatedDate",
        W."CHANGED_DATE"                AS "VehiclesChangedDate",
	    
	    VTT."TEXT"                       AS "VehicleTypeText",
	    VTT."SPRAS"                      AS "VehicleTypeTextSpras",
	    
	    RCW."ID_STATUS"                  AS "VehicleStatus",
	    RCW."ID_UNIQUE_SUP"              AS "RelationIdSupplier",
	    RCW."APPROVAL_DATE"              AS "ApprovalDate",
	    RCW."APPROVAL_USER"              AS "ApprovalUser",
	    
	    ASTT."TEXT"                      AS "VehicleStatusText", 
	    
	    C."ID_CONTRACT"                  as "IdContract",
	    C."PERIMETER"                    as "ContractPerimeter",
	    C."SUBJECT"                      as "ContractSubject",
	    C."START_VALIDITY_DATE"          as "ContractStartValidityDate",
	    C."END_VALIDITY_DATE"            as "ContractEndValidityDate",
	    C."TOTAL_CONTRACT"               as "ContractTotal",
	    C."RES_CONTRACT"                 as "ContractRes",
	    C."DOC_DATE"                     as "ContractDocDate",
	    C."PERFECTION_DATE"              as "ContractPerfectionDate",
	    C."ID_UNIQUE_SUP"                  as "ContractSupplier"
	    
		FROM "CONTRACT_MANAGEMENT"."VEHICLES" as W
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_CONTRACT_VEHICLE" as RCW on RCW."ID_VEHICLE" = W."ID_VEHICLES"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."VEHICLES_TYPES" as VT on VT."ID_VEHICLES_TYPE" = W."ID_VEHICLES_TYPE"
		LEFT JOIN "CONTRACT_MANAGEMENT"."VEHICLES_TYPES_T" as VTT on VTT."ID_VEHICLES_TYPES_T" = VT."ID_VEHICLES_TYPES_T"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACTS" as C on C."ID_CONTRACT" = RCW."ID_CONTRACT" and C."ID_UNIQUE_SUP" = RCW."ID_UNIQUE_SUP"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" as ATS on ATS."ID_ATTACHMENT_STATUS" = RCW."ID_STATUS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" as ASTT on ASTT."ID_ATTACHMENT_STATUS_T" = ATS."ID_ATTACHMENT_STATUS_T";
		
/* V_QUALIFICATIONS*/
CREATE VIEW "V_QUALIFICATIONS" 
AS
	SELECT DISTINCT
	    Q."ID_QUALIFICATION"             AS "qualificaKey",
	    Q."ID_QUALIFICATION_T"           AS "IdQualificaText",
	    QT."SPRAS"                       AS "spras",
	    QT."TEXT"                        AS "qualifica"
		FROM "CONTRACT_MANAGEMENT"."QUALIFICATIONS" as Q
		LEFT JOIN "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" as QT on QT."ID_QUALIFICATION_T" = Q."ID_QUALIFICATION_T";
		
/* V_QUALIFICATIONS*/
CREATE VIEW "V_WORKER_ROLES" 
AS
	SELECT DISTINCT
	    R."ID_WORKER_ROLE"             AS "ruoloKey",
	    R."ID_WORKER_ROLE_T"           AS "IdRuoloText",
	    RT."SPRAS"                     AS "spras",
	    RT."TEXT"                      AS "ruolo"
		FROM "CONTRACT_MANAGEMENT"."WORKER_ROLES" as R
		LEFT JOIN "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" as RT on RT."ID_WORKER_ROLE_T" = R."ID_WORKER_ROLE_T";
		
/* Relation between suppliers & equipment */
CREATE VIEW "V_REL_SUPPLIER_EQUIPMENT" 
AS
	SELECT DISTINCT
	    E."ID_EQUIPMENT"                 AS "IdEquipment",
	    E."DESCRIPTION"                  AS "DescriptionEquipment",
	    E."MANUFACTURER"                 AS "ManufacturerEquipment",
	    E."MODEL"                        AS "EquipmentModel",
	    E."YEAR_OF_COSTRUCTION"          AS "YoCEquipment",
	    E."EDUCATION_BOOKLET"            AS "EducationBookletEquipment",
	    E."MAINTENANCE_BOOKLET"          AS "MaintenanceBookletEquipment",
	    E."MATRICULAR_BOOKLET"           AS "MatricularBookletEquipment",
	    E."CE_BRAND"                     AS "CEBrandEquipment",
	    E."DECLARATION_OF_CONFORMITY"    AS "DeclarationOfConfEquipment",
	    E."ASL_SERIAL"                   AS "AslSerialEquipment",
	    E."EXTERNAL_VERIFICATION"        AS "ExternalVerificationEquipment",
        E."CREATED_BY"                   AS "CreatedBy",
        E."CHANGED_BY"                   AS "ChangedBy",
        E."CREATED_DATE"                 AS "CreatedDate",
        E."CHANGED_DATE"                 AS "ChangedDate",
	    
	    RSE."ID_UNIQUE_SUP"              AS "IdSupplier",
	    RSE."VALIDATED_BY"               AS "EquipmentValidatedBy",
	    RSE."STATUS"                     AS "EquipmentStatus"
		FROM "CONTRACT_MANAGEMENT"."EQUIPMENT" as E
		
		
	    LEFT JOIN "CONTRACT_MANAGEMENT"."REL_SUPPLIER_EQUIPMENT" as RSE on RSE."ID_EQUIPMENT" = E."ID_EQUIPMENT";
		
/* Rel between documents & equipment ) */		
CREATE VIEW "V_REL_EQUIPMENT_DOCUMENT" 
AS
	SELECT DISTINCT
	    E."ID_EQUIPMENT"                 AS "IdEquipment",
	    
	    D."ID_DOCUMENT"                  AS "IdDocument",
	    D."ID_DOC_TYPE"                  AS "IdDocumentType",
	    D."ID_UNIQUE_SUP"                AS "IdSupplier",
	    D."TITLE"                        AS "DocumentTitle",
	    D."DESCRIPTION"                  AS "DocumentDescription",
	    D."ID_CONTRACT"                  AS "IdContract",
	    D."ID_COMMON_DOCUMENTS"          AS "IdCommonDocuments",
	    D."TYPE_OF_ADDITION"             AS "TypeOfAddition",
	    
	    DT."ID_DOC_TYPES_T"              AS "IdDocumentTypeT",
	    
	    RDRC."ID_CONTRACT"               AS "IdContractRTS",
	    RDRC."ID_UNIQUE_SUP"             AS "RelationIdSupplier",

	             
	    A."ID_ATTACHMENT"                AS "IdAttachment",
	    A."FILENAME"                     AS "AttachmentFileName",
	    A."EXPIRED_DATE"                 AS "AttachmentExpiredDate",
	    A."ID_ATTACHMENT_STATUS"         AS "IdAttachmenttatus",
	    A."APPROVAL_DATE"                AS "AttachmentApprovalDate",
	    A."APPROVAL_USER"                AS "AttachmentApprovalUser",
	    A."DOC_ON_OPENTEXT"              AS "AttachmentOnOpenText",
	    A."ID_OPEN_TEXT"                 AS "IdAttachmentOpenText",
	    
	    RDA."UPLOAD_FROM"                AS "UploadFrom",
	    RDA."ID_CONTRACT_OF_REL"         AS "IdContractOfRel",
	    RDA."NOTA_RIFIUTO"               AS "NotaRifiuto",
	    
	    ASTT."TEXT"                      AS "AttchamentStatusText"
	    
		FROM "CONTRACT_MANAGEMENT"."EQUIPMENT" as E
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."DOCUMENTS" as D on D."ID_EQUIPMENT" = E."ID_EQUIPMENT"
		LEFT JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES" as DT on DT."ID_DOC_TYPES" = D."ID_DOC_TYPE"
	    LEFT JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES_T" as DTT on DTT."ID_DOC_TYPES_T" = DT."ID_DOC_TYPES_T"

		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_DOCUMENT_RTS_CONTRACT" as RDRC on RDRC."ID_DOCUMENT" = D."ID_DOCUMENT"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENTS" as A on A."ID_DOCUMENT" = D."ID_DOCUMENT"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" as AST on AST."ID_ATTACHMENT_STATUS" = A."ID_ATTACHMENT_STATUS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" as ASTT on ASTT."ID_ATTACHMENT_STATUS_T" = AST."ID_ATTACHMENT_STATUS_T"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_DOCUMENT_ATTACHMENTS" as RDA on (RDA."ID_DOCUMENT" = D."ID_DOCUMENT" AND RDA."ID_ATTACHMENT" = A."ID_ATTACHMENT" )OR( RDA."ID_DOCUMENT" = RDRC."ID_DOCUMENT" AND RDA."ID_ATTACHMENT" = A."ID_ATTACHMENT");
		
/* Rel between contract & equipment ) */		
CREATE VIEW "V_REL_EQUIPMENT_CONTRACTS" 
AS
	SELECT DISTINCT
	    E."ID_EQUIPMENT"                 AS "IdEquipment",
	    E."DESCRIPTION"                  AS "DescriptionEquipment",
	    E."MANUFACTURER"                 AS "ManufacturerEquipment",
	    E."MODEL"                        AS "EquipmentModel",
	    E."YEAR_OF_COSTRUCTION"          AS "YoCEquipment",
	    E."EDUCATION_BOOKLET"            AS "EducationBookletEquipment",
	    E."MAINTENANCE_BOOKLET"          AS "MaintenanceBookletEquipment",
	    E."MATRICULAR_BOOKLET"           AS "MatricularBookletEquipment",
	    E."CE_BRAND"                     AS "CEBrandEquipment",
	    E."DECLARATION_OF_CONFORMITY"    AS "DeclarationOfConfEquipment",
	    E."ASL_SERIAL"                   AS "AslSerialEquipment",
	    E."EXTERNAL_VERIFICATION"        AS "ExternalVerificationEquipment",
        E."CREATED_BY"                   AS "CreatedBy",
        E."CHANGED_BY"                   AS "ChangedBy",
        E."CREATED_DATE"                 AS "CreatedDate",
        E."CHANGED_DATE"                 AS "ChangedDate",
        
	    RCE."ID_STATUS"                  AS "EquipmentStatus",
	    ASTT."TEXT"                      AS "EquipmentStatusText",
	    
        RCE."ID_UNIQUE_SUP"              AS "RelationIdSupplier",
	    RCE."APPROVAL_DATE"              AS "ApprovalDate",
	    RCE."APPROVAL_USER"              AS "ApprovalUser",

	    C."ID_CONTRACT"                  as "IdContract",
	    C."PERIMETER"                    as "ContractPerimeter",
	    C."SUBJECT"                      as "ContractSubject",
	    C."START_VALIDITY_DATE"          as "ContractStartValidityDate",
	    C."END_VALIDITY_DATE"            as "ContractEndValidityDate",
	    C."TOTAL_CONTRACT"               as "ContractTotal",
	    C."RES_CONTRACT"                 as "ContractRes",
	    C."DOC_DATE"                     as "ContractDocDate",
	    C."PERFECTION_DATE"              as "ContractPerfectionDate",
	    C."ID_UNIQUE_SUP"                as "ContractSupplier"
	    
		FROM "CONTRACT_MANAGEMENT"."EQUIPMENT" as E
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_CONTRACT_EQUIPMENT" as RCE on RCE."ID_EQUIPMENT" = E."ID_EQUIPMENT"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACTS" as C on C."ID_CONTRACT" = RCE."ID_CONTRACT" and C."ID_UNIQUE_SUP" = RCE."ID_UNIQUE_SUP"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" as AST on RCE."ID_STATUS" = AST."ID_ATTACHMENT_STATUS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" as ASTT on ASTT."ID_ATTACHMENT_STATUS_T" = AST."ID_ATTACHMENT_STATUS_T";
		
/* Relation between suppliers & documents (with attachments) */		
CREATE VIEW "V_REL_SUPPLIER_DOCUMENT"   
AS
	SELECT DISTINCT
	    D."ID_DOCUMENT"            AS "IdDocument",
	    D."ID_DOC_TYPE"            AS "IdDocumentType",
	    D."ID_COMMON_DOCUMENTS"    AS "IdCommonDocuments",
	    D."ID_UNIQUE_SUP"          AS "IdSupplier",
	    D."TITLE"                  AS "DocumentTitle",
	    D."DESCRIPTION"            AS "DocumentDescription",
	    D."TYPE_OF_ADDITION"       AS "TypeOfAddition",
	    D."VISIBLE_IN_AC"          AS "VisibleInAc",
	    D."ID_CONTRACT"            AS "IdContract",
	    
	    S."SUPPLIER_NAME"          AS "SupplierName",
	    
	    DTT."TEXT"                 AS "DocmentTypeText",
	    
	    RDRC."ID_CONTRACT"         AS "IdContractRTS",
	    
	    RMD."MAXIMAL_RCT"          AS "MaximalRct",
	    RMD."MAXIMAL_RCO"          AS "MaximalRco",
	    RMD."UPLOAD_FROM"          AS "MaximalUploadFrom",
	    
	    A."ID_ATTACHMENT"          AS "IdAttachment",
	    A."FILENAME"               AS "AttachmentFileName",
	    A."EXPIRED_DATE"           AS "AttachmentExpiredDate",
	    A."ID_ATTACHMENT_STATUS"   AS "IdAttachmenttatus",
	    A."APPROVAL_USER"          AS "AttachmentApprovalUser",
	    A."DOC_ON_OPENTEXT"        AS "AttachmentOnOpenText",
	    A."ID_OPEN_TEXT"           AS "IdAttachmentOpenText",
	    
	    RDA."UPLOAD_FROM"          AS "UploadFrom",
	    RDA."ID_CONTRACT_OF_REL"   AS "IdContractOfRel",
	    RDA."NOTA_RIFIUTO"         AS "NotaRifiuto",
	    
	    ASTT."TEXT"                AS "AttachmentStatusText"
	    
		FROM "CONTRACT_MANAGEMENT"."DOCUMENTS" as D
		JOIN "CONTRACT_MANAGEMENT"."SUPPLIERS" as S on S."ID_UNIQUE_SUP" = D."ID_UNIQUE_SUP"
		JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES" as DT on DT."ID_DOC_TYPES" = D."ID_DOC_TYPE"
		JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES_T" as DTT on DTT."ID_DOC_TYPES_T" = DT."ID_DOC_TYPES_T"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_DOCUMENT_RTS_CONTRACT" as RDRC on RDRC."ID_DOCUMENT" = D."ID_DOCUMENT"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_DOCUMENT_ATTACHMENTS" as RDA on RDA."ID_DOCUMENT" = D."ID_DOCUMENT" OR RDA."ID_DOCUMENT" = RDRC."ID_DOCUMENT"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENTS" as A on A."ID_ATTACHMENT" = RDA."ID_ATTACHMENT"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" as AST on AST."ID_ATTACHMENT_STATUS" = A."ID_ATTACHMENT_STATUS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" as ASTT on ASTT."ID_ATTACHMENT_STATUS_T" = AST."ID_ATTACHMENT_STATUS_T"
		
			LEFT JOIN "CONTRACT_MANAGEMENT"."REL_MAXIMAL_DOCUMENT" as RMD on RMD."ID_DOCUMENT" = D."ID_DOCUMENT" AND RMD."ID_ATTACHMENT" = A."ID_ATTACHMENT"
		
        WHERE D."ID_DOC_TYPE" = 1 OR
        D."ID_DOC_TYPE" = 2 OR
        D."ID_DOC_TYPE" = 3 OR
        D."ID_DOC_TYPE" = 5 OR
        D."ID_DOC_TYPE" = 6;
		
/* Relation between contract & documents (with attachments) */		
CREATE VIEW "V_REL_CONTRACT_DOCUMENTS" 
AS
	SELECT DISTINCT
	    D."ID_DOCUMENT"            AS "IdDocument",
	    D."ID_DOC_TYPE"            AS "IdDocumentType",
	    D."ID_COMMON_DOCUMENTS"    AS "IdCommonDocuments",
	    D."ID_UNIQUE_SUP"          AS "IdSupplier",
	    D."TITLE"                  AS "DocumentTitle",
	    D."DESCRIPTION"            AS "DocumentDescription",
	    D."TYPE_OF_ADDITION"       AS "TypeOfAddition",
	    
	    C."ID_CONTRACT"            AS "IdContract",
	    
	    DTT."TEXT"                 AS "DocmentTypeText",
	    
	    A."ID_ATTACHMENT"          AS "IdAttachment",
	    A."FILENAME"               AS "AttachmentFileName",
	    A."EXPIRED_DATE"           AS "AttachmentExpiredDate",
	    A."ID_ATTACHMENT_STATUS"   AS "IdAttachmenttatus",
	    A."IS_ACTIVE_AF"           AS "IsActiveAf",
	    A."IS_ACTIVE_AC"           AS "IsActiveAc",
	    A."DOC_ON_OPENTEXT"        AS "AttachmentOnOpenText",
	    A."ID_OPEN_TEXT"           AS "IdAttachmentOpenText",
	    
	    RDA."NOTA_RIFIUTO"         AS "NotaRifiuto"
	  
	    
		FROM "CONTRACT_MANAGEMENT"."CONTRACTS" as C
		JOIN "CONTRACT_MANAGEMENT"."DOCUMENTS" as D on D."ID_CONTRACT" = C."ID_CONTRACT"
		JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES" as DT on DT."ID_DOC_TYPES" = D."ID_DOC_TYPE"
		JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES_T" as DTT on DTT."ID_DOC_TYPES_T" = DT."ID_DOC_TYPES_T"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_DOCUMENT_ATTACHMENTS" as RDA on RDA."ID_DOCUMENT" = D."ID_DOCUMENT"

		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENTS" as A on A."ID_ATTACHMENT" = RDA."ID_ATTACHMENT"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" as AST on AST."ID_ATTACHMENT_STATUS" = A."ID_ATTACHMENT_STATUS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" as ASTT on ASTT."ID_ATTACHMENT_STATUS_T" = AST."ID_ATTACHMENT_STATUS_T"
        WHERE A."IS_ACTIVE_AC" = 1;
        
        
/* Rel between contract & workers ) */		
CREATE VIEW "V_REL_WORKER_CONTRACTS" 
AS
	SELECT DISTINCT
	    W."ID_WORKER"                   AS "IdWorker",
	    W."NAME"                        AS "WorkerName",
	    W."SURNAME"                     AS "WorkerSurname",
	    W."DATE_BIRTH"                  AS "WorkerDateBirth",
	    W."GENDER"                      AS "WorkerGender",
	    W."RESIDENCE"                   AS "WorkerResidence",
	    W."CONTRACT_EXPIRED_DATE"       AS "WorkerContractExpiredDate",
	    W."CUSTOM_ROLES"                AS "WorkerCustomRoles",
	    W."CUSTOM_QUALIFICATIONS"       AS "WorkerCustomQualifications",
	    W."EU_CITIZEN"                  AS "WorkerCitizenship",
        W."DPI_III_LEVEL"               AS "WorkerDpiIIILevel",
        W."CREATED_BY"                  AS "CreatedBy",
        W."CHANGED_BY"                  AS "ChangedBy",
        W."CREATED_DATE"                AS "CreatedDate",
        W."CHANGED_DATE"                AS "ChangedDate",
	    
	    
	    RCW."ID_UNIQUE_SUP"             AS "RelationIdSupplier",
	    RCW."APPROVAL_DATE"             AS "ApprovalDate",
	    RCW."APPROVAL_USER"             AS "ApprovalUser",
	    
	    WCT."ID_WORKER_CONTRACT_TYPE"    as "IdWorkerContractType",
	    WCTT."TEXT"                      as "WorkerContractTypeText",
	    WCTT."SPRAS"                     as "WorkerContractTypeSpras",
	    
	    C."ID_CONTRACT"                  as "IdContract",
	    C."PERIMETER"                    as "ContractPerimeter",
	    C."SUBJECT"                      as "ContractSubject",
	    C."START_VALIDITY_DATE"          as "ContractStartValidityDate",
	    C."END_VALIDITY_DATE"            as "ContractEndValidityDate",
	    C."TOTAL_CONTRACT"               as "ContractTotal",
	    C."RES_CONTRACT"                 as "ContractRes",
	    C."DOC_DATE"                     as "ContractDocDate",
	    C."PERFECTION_DATE"              as "ContractPerfectionDate",
	    C."ID_UNIQUE_SUP"                as "ContractSupplier",
	    
	    ATST."TEXT"                      as "ContractWorkerStatus",
	    RCW."ID_STATUS"                  as "ContractWorkerStatusId"
	    
	    
	    
		FROM "CONTRACT_MANAGEMENT"."WORKERS" as W
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES" as WCT on WCT."ID_WORKER_CONTRACT_TYPE" = W."ID_WORKER_CONTRACT_TYPE"
		LEFT JOIN "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES_T" as WCTT on WCTT."ID_WORKER_CONTRACT_TYPE_T" = WCT."ID_WORKER_CONTRACT_TYPE_T"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_CONTRACT_WORKER" as RCW on RCW."ID_WORKER" = W."ID_WORKER"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACTS" as C on C."ID_CONTRACT" = RCW."ID_CONTRACT" and C."ID_UNIQUE_SUP" = RCW."ID_UNIQUE_SUP"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" as ATS on ATS."ID_ATTACHMENT_STATUS" = RCW."ID_STATUS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" as ATST on ATST."ID_ATTACHMENT_STATUS_T" = ATS."ID_ATTACHMENT_STATUS";
		
/* Rel between documents & worker ) */		
CREATE VIEW "V_REL_WORKER_DOCUMENTS" 
AS
	SELECT DISTINCT
	    W."ID_WORKER" AS "IdWorker",
	    W."NAME" AS "WorkerName",
	    W."SURNAME" AS "WorkerSurname",
	    
	    WCT."ID_WORKER_CONTRACT_TYPE"    as "IdWorkerContractType",
	    WCTT."TEXT"                      as "WorkerContractTypeText",
	    WCTT."SPRAS"                     as "WorkerContractTypeSpras",
	    
	    D."ID_DOCUMENT"                  AS "IdDocument",
	    D."ID_DOC_TYPE"                  AS "IdDocumentType",
	    D."ID_UNIQUE_SUP"                AS "IdSupplier",
	    D."TITLE"                        AS "DocumentTitle",
	    D."DESCRIPTION"                  AS "DocumentDescription",
	    D."ID_CONTRACT"                  AS "IdContract",
	    D."ID_COMMON_DOCUMENTS"          AS "IdCommonDocuments",
	    D."TYPE_OF_ADDITION"             AS "TypeOfAddition",
	    
	    RDRC."ID_CONTRACT"               AS "IdContractRTS",

	    RDA."UPLOAD_FROM"                AS "UploadFrom",
	    RDA."ID_CONTRACT_OF_REL"         AS "IdContractOfRel",
	    RDA."NOTA_RIFIUTO"               AS "NotaRifiuto",
	             
	    A."ID_ATTACHMENT"                AS "IdAttachment",
	    A."FILENAME"                     AS "AttachmentFileName",
	    A."EXPIRED_DATE"                 AS "AttachmentExpiredDate",
	    A."ID_ATTACHMENT_STATUS"         AS "IdAttachmenttatus",
	    A."APPROVAL_DATE"                AS "AttachmentApprovalDate",
	    A."APPROVAL_USER"                AS "AttachmentApprovalUser",
	    A."DOC_ON_OPENTEXT"              AS "AttachmentOnOpenText",
	    A."ID_OPEN_TEXT"                 AS "IdAttachmentOpenText",
	    
	    ASTT."TEXT"                      AS "AttchamentStatusText"
	    
	    
		FROM "CONTRACT_MANAGEMENT"."WORKERS" as W
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES" as WCT on WCT."ID_WORKER_CONTRACT_TYPE" = W."ID_WORKER_CONTRACT_TYPE"
		LEFT JOIN "CONTRACT_MANAGEMENT"."WORKER_CONTRACT_TYPES_T" as WCTT on WCTT."ID_WORKER_CONTRACT_TYPE_T" = WCT."ID_WORKER_CONTRACT_TYPE_T"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."DOCUMENTS" as D on D."ID_WORKER" = W."ID_WORKER"
		LEFT JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES" as DT on DT."ID_DOC_TYPES" = D."ID_DOC_TYPE"
	    LEFT JOIN "CONTRACT_MANAGEMENT"."DOC_TYPES_T" as DTT on DTT."ID_DOC_TYPES_T" = DT."ID_DOC_TYPES_T"
	    
	    LEFT JOIN "CONTRACT_MANAGEMENT"."REL_DOCUMENT_RTS_CONTRACT" as RDRC on RDRC."ID_DOCUMENT" = D."ID_DOCUMENT"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENTS" as A on A."ID_DOCUMENT" = D."ID_DOCUMENT" 
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS" as AST on AST."ID_ATTACHMENT_STATUS" = A."ID_ATTACHMENT_STATUS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."ATTACHMENT_STATUS_T" as ASTT on ASTT."ID_ATTACHMENT_STATUS_T" = AST."ID_ATTACHMENT_STATUS_T"

	    LEFT JOIN "CONTRACT_MANAGEMENT"."REL_DOCUMENT_ATTACHMENTS" as RDA on (RDA."ID_DOCUMENT" = D."ID_DOCUMENT" AND RDA."ID_ATTACHMENT" = A."ID_ATTACHMENT" )OR( RDA."ID_DOCUMENT" = RDRC."ID_DOCUMENT" AND RDA."ID_ATTACHMENT" = A."ID_ATTACHMENT");
/* Rel between contract & Cs ) */		
CREATE VIEW "V_REL_CONTRACTS" 
AS
	SELECT DISTINCT
	    
	    C."ID_CONTRACT"                        as "IdContract",
	    C."PERIMETER"                          as "ContractPerimeter",
	    C."SUBJECT"                            as "ContractSubject",
	    C."START_VALIDITY_DATE"                as "ContractStartValidityDate",
	    C."END_VALIDITY_DATE"                  as "ContractEndValidityDate",
	    C."TOTAL_CONTRACT"                     as "ContractTotal",
	    C."RES_CONTRACT"                       as "ContractRes",
	    C."DOC_DATE"                           as "ContractDocDate",
	    C."PERFECTION_DATE"                    as "ContractPerfectionDate",
	    C."ID_UNIQUE_SUP"                      as "IdSupplier",
	    
		S."SUPPLIER_NAME"                      AS "SupplierName",
		
		CA."ID_CONTRACT_ASSOCIATION"           AS "IdContractAssociation",
		CA."ID_CONTRACT_PDF_ATTACHMENT"        AS "IdContractAssociationPdfAttach",
		CA."START_ASS_DATE"                    AS "ContractStartAssociationDate",
		CA."END_ASS_DATE"                      AS "ContractEndAssociationDate",
		CA."ID_CONTRACT_ASS_STATUS"            AS "IdContractAssociationStatus",
	    CA."IS_ACTIVE_VERSION"                 AS "ContractAssIsActiveVersion",
	    CA."VERSION"                           AS "ContractActiveAssVersion",
	    CA."NAME_4TITLE"                       as "Name4Title",
	    CA."SURNAME_4TITLE"                    as "Surname4Title",
	    CA."EMAIL_4TITLE"                      as "Mail4Title",
		CAST."ID_CONTRACT_ASS_STATUS_T"        AS "ContractAssociationStatusText",
		
		CAD."ID_CONTRACT_ASSOCIATION_DETAIL"  AS "IdContractAssociationDetail",
		CAD."ID_CONTRACT_SUPERVISORS"         AS "IdContractSupervisor",
		CAD."ID_CS_ROLE"                      AS "IdCsRole",
		CAD."START_ASS_DATE"                  AS "CSStartAssociationDate",
		CAD."END_ASS_DATE"                    AS "CSEndAssociationDate",
		CAD."IS_CS_MAIN"                      AS "IsCSMain",
		CAD."INACTIVE_ASSOCIATION"            AS "InactiveCSAssociation",
		
		CS."NAME"                             AS "CSName",
		CS."SURNAME"                          AS "CSSurname",
		CS."EMAIL"                            AS "CSEmail",
		CS."IS_CS"                            AS "CSIsCs",
		CS."IS_ASSISTANT_CS_SIC"              AS "CSIsAssistantCsSic",
		CS."IS_ASSISTANT_CS_AMM"              AS "CSIsAssistantCsAmm",
		CS."IS_ASSISTANT_CS_MAN"              AS "CSIsAssistantCsMan",
		
		CSRT."TEXT"                           AS "CsRoleText"
		
		FROM "CONTRACT_MANAGEMENT"."CONTRACTS" as C
		JOIN "CONTRACT_MANAGEMENT"."SUPPLIERS" as S on S."ID_UNIQUE_SUP" = C."ID_UNIQUE_SUP"
	
		JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASSOCIATIONS" as CA on CA."ID_CONTRACT" = C."ID_CONTRACT"
		
		JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASS_STATUS" as CAS on CAS."ID_CONTRACT_ASS_STATUS" = CA."ID_CONTRACT_ASS_STATUS"
		
		JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASS_STATUS_T" as CAST on CAST."ID_CONTRACT_ASS_STATUS_T" = CAS."ID_CONTRACT_ASS_STATUS_T"
		
		JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASSOCIATION_DETAILS" as CAD on CAD."ID_CONTRACT_ASSOCIATION" = CA."ID_CONTRACT_ASSOCIATION"
		
		JOIN "CONTRACT_MANAGEMENT"."CONTRACT_SUPERVISORS" as CS on CS."ID_CONTRACT_SUPERVISORS" = CAD."ID_CONTRACT_SUPERVISORS"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CS_ROLES" as CSR on CAD."ID_CS_ROLE" = CSR."ID_CS_ROLE"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CS_ROLES_T" as CSRT on CSR."ID_CS_ROLE_T" = CSRT."ID_CS_ROLE_T";
		

/* Rel between contract & supplier & Cs  ) */		
CREATE VIEW "V_REL_CONTRACTS_SUPPLIERS_CS1" 
AS
	SELECT DISTINCT
	    
	    C."ID_CONTRACT"                         as "IdContract",
	    C."PERIMETER"                           as "ContractPerimeter",
	    C."SUBJECT"                             as "ContractSubject",
	    C."START_VALIDITY_DATE"                 as "ContractStartValidityDate",
	    C."END_VALIDITY_DATE"                   as "ContractEndValidityDate",
	    C."TOTAL_CONTRACT"                      as "ContractTotal",
	    C."RES_CONTRACT"                        as "ContractRes",
	    C."DOC_DATE"                            as "ContractDocDate",
	    C."TYPE_OF_CONTRACT"                    as "ContractType",
	    C."PERFECTION_DATE"                     as "ContractPerfectionDate",
	    C."ID_UNIQUE_SUP"                       as "IdSupplier",
	    C."POS_INAIL"                           as "PosizioneInail",
        C."POS_INPS"                            as "PosizioneInps", 
        C."CONSTRUCTION_WORKER_SOCIAL_SECURITY" as "CassaEdile", 
        C."ROLE_RSPP"                           as "Rspp", 
        C."ROLE_RLS"                            as "Rls", 
        C."ROLE_RESPONSIBLE"                    as "Preposto", 
        C."ROLE_CONSTRUCTION_FOREMAN"           as "CapoCantiere",
        C."ROLE_FIRE_PREVENTION"                as "PrevenzioneIncendi", 
        C."ROLE_FIRST_AID"                      as "PrimoSoccorso", 
        C."ROLE_COMPETENT_DOCTOR"               as "MedicoCompetente", 
        C.CONTACT_NAME                          as "ContactName",
        C.CONTACT_SURNAME                       as "ContactSurname",
        C.CONTACT_TELEPHONE                     as "ContactTelephone",
        C.CONTACT_EMAIL                         as "ContactEmail",
	    
		S."SUPPLIER_NAME"                      AS "SupplierName",
		S."ID_SUPPLIER"                        AS "CodFornitore",
		S."CUI"                                AS "CuiFornitore",
		
		CA."ID_CONTRACT_ASSOCIATION"           AS "IdContractAssociation",
		CA."ID_CONTRACT_ASS_STATUS"            AS "IdContractAssociationStatus",
		CA."ID_CONTRACT_PDF_ATTACHMENT"        AS "IdContractAssociationPdfAttachment",
		CAST."ID_CONTRACT_ASS_STATUS_T"        AS "ContractAssociationStatusText",
		
		CAD."ID_CONTRACT_ASSOCIATION_DETAIL"  AS "IdContractAssociationDetail",
		CAD."IS_CS_MAIN"                      AS "IsCSMain",
		CAD."INACTIVE_ASSOCIATION"            AS "InactiveCSAssociation",
		
		CS."NAME"                             AS "CSName",
		CS."SURNAME"                          AS "CSSurname",
		CS."ID_CONTRACT_SUPERVISORS"          AS "CSId",
		
		GS."ID_GREEN_SHEET"                   AS "IdGreenSheet",
		GS."MODIFIED_DOC"                     AS "GreenSheetModifiedDoc"
		
		FROM "CONTRACT_MANAGEMENT"."CONTRACTS" as C
		JOIN "CONTRACT_MANAGEMENT"."SUPPLIERS" as S on S."ID_UNIQUE_SUP" = C."ID_UNIQUE_SUP"
	
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASSOCIATIONS" as CA on CA."ID_CONTRACT" = C."ID_CONTRACT"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASS_STATUS" as CAS on CAS."ID_CONTRACT_ASS_STATUS" = CA."ID_CONTRACT_ASS_STATUS"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASS_STATUS_T" as CAST on CAST."ID_CONTRACT_ASS_STATUS_T" = CAS."ID_CONTRACT_ASS_STATUS_T"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASSOCIATION_DETAILS" as CAD on CAD."ID_CONTRACT_ASSOCIATION" = CA."ID_CONTRACT_ASSOCIATION"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_SUPERVISORS" as CS on CS."ID_CONTRACT_SUPERVISORS" = CAD."ID_CONTRACT_SUPERVISORS"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."GREEN_SHEETS" as GS on C."ID_CONTRACT" = GS."ID_CONTRACT"

		WHERE 
		( 
		    CA."ID_CONTRACT_ASSOCIATION" IS NULL OR
 	        ( 
 	            NOT CA."ID_CONTRACT_ASSOCIATION" IS NULL AND 
 	            CAD."INACTIVE_ASSOCIATION" = '0' AND 
 	            CAD."IS_CS_MAIN" = '1' AND 
 	            CA."IS_ACTIVE_VERSION" = '1'
 	        ) 
		) AND (
		    GS."ID_GREEN_SHEET" IS NULL OR 
		    ( 
		        NOT GS."ID_GREEN_SHEET" IS NULL AND
		        GS."IS_ACTIVE_VERSION" = '1'AND
		        C."ID_UNIQUE_SUP" = GS."ID_UNIQUE_SUP"
		    )
 	      );


/* Rel between worker & qualifications ) */	
CREATE VIEW "V_REL_WORKER_QUALIFICATIONS" 
AS
	SELECT DISTINCT
	    W."ID_WORKER" AS "IdWorker",
	    Q."ID_QUALIFICATION" AS "IdQualification",
	    QT."TEXT" AS "QualificationText"
	    
		FROM "CONTRACT_MANAGEMENT"."WORKERS" as W
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_WORKER_QUALIFICATIONS" as RWQ on RWQ."ID_WORKER" = W."ID_WORKER"
		LEFT JOIN "CONTRACT_MANAGEMENT"."QUALIFICATIONS" as Q on Q."ID_QUALIFICATION" = RWQ."ID_QUALIFICATION"
		LEFT JOIN "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" as QT on QT."ID_QUALIFICATION_T" = Q."ID_QUALIFICATION_T";
		
/* Rel between worker & roles ) */		
CREATE VIEW "V_REL_WORKER_ROLES" 
AS
	SELECT DISTINCT
	    W."ID_WORKER" AS "IdWorker",
	    RWR."ID_WORKER_ROLES" AS "IdWorkerRoles",
	    WRT."TEXT" AS "WorkerRoleText"
	    
		FROM "CONTRACT_MANAGEMENT"."WORKERS" as W
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_WORKER_ROLES" as RWR on RWR."ID_WORKER" = W."ID_WORKER"
		LEFT JOIN "CONTRACT_MANAGEMENT"."WORKER_ROLES" as WR on WR."ID_WORKER_ROLE" = RWR."ID_WORKER_ROLES"
		LEFT JOIN "CONTRACT_MANAGEMENT"."WORKER_ROLES_T" as WRT on WRT."ID_WORKER_ROLE_T" = WR."ID_WORKER_ROLE_T";
		
/* Relation between suppliers & documents (with attachments) */		        
CREATE VIEW "V_REL_CONTRACT_MAXIMAL"    
AS
	SELECT DISTINCT
	    D."ID_DOCUMENT"            AS "IdDocument",
	    
	    S."SUPPLIER_NAME"          AS "SupplierName", 
	    
	    RMD."MAXIMAL_RCT"          AS "MaximalRct", 
	    RMD."MAXIMAL_RCO"          AS "MaximalRco",
	    RMD."UPLOAD_FROM"          AS "MaximalUploadFrom",
	    RMD."ID_CONTRACT"          AS "IdContract",
	    RMD."ID_UNIQUE_SUP"        AS "IdSupplier"
	    
		FROM "CONTRACT_MANAGEMENT"."DOCUMENTS" as D
		JOIN "CONTRACT_MANAGEMENT"."SUPPLIERS" as S on S."ID_UNIQUE_SUP" = D."ID_UNIQUE_SUP"
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_MAXIMAL_DOCUMENT" as RMD on RMD."ID_DOCUMENT" = D."ID_DOCUMENT";
		
/* Relation beetween logged user and related ub*/
CREATE VIEW "V_REL_USER_TO_UB_TO_AFNAM"    
AS
	SELECT DISTINCT
	    H."USERMANE"   AS "Username",
	    H."ID_UB"      AS "IdUb",
	    
        P."UB_DESC" AS "UbDesc",
	    P."AFNAM" AS "Afnam",
        P."AFNAM_DESC" AS "AfnamDesc",
        P."PLANT" AS "Plant",
        P."PLANT_DESC" AS "PlantDesc"
	   
		FROM "CONTRACT_MANAGEMENT"."REL_USER_UB" as H
		JOIN "CONTRACT_MANAGEMENT"."REL_UB_TO_AFNAM" as P on H."ID_UB" = P."ID_UB";
		
/* Relation beetween common document and related plant*/
CREATE VIEW "V_REL_PLANT_COMMON_DOC"    
AS
	SELECT DISTINCT
	    CD."ID_COMMON_DOCUMENTS"   AS "IdCommonDocument",
	    CD."ID_DOC_TYPES"   AS "IdDocType",
	    CD."TITLE"   AS "Title",
	    CD."DESCRIPTION"   AS "Description",
	     
	    RPCD."PLANT"  AS "Plant"
	   
		FROM "CONTRACT_MANAGEMENT"."REL_PLANT_COMMON_DOC2" as RPCD
		JOIN "CONTRACT_MANAGEMENT"."COMMON_DOCUMENTS" as CD on RPCD."ID_COMMON_DOCUMENTS" = CD."ID_COMMON_DOCUMENTS";

------------- APP GROUP MANAGEMENT ----------------		

/* Relatione tra CS e GROUP */
CREATE VIEW "V_REL_GROUP_SUPERVISORS" 
AS
SELECT DISTINCT
	    G."PLANT"                     AS "Plant",
	  
	    CS."ID_CONTRACT_SUPERVISORS"    AS "ID_CONTRACT_SUPERVISORS",
	    CS."NAME"                       AS "NAME",
	    CS."SURNAME"                    AS "SURNAME",
	    CS."IS_CS"                      AS "IS_CS",
	    CS."IS_ASSISTANT_CS_SIC"        AS "IS_ASSISTANT_CS_SIC",
	    CS."IS_ASSISTANT_CS_AMM"        AS "IS_ASSISTANT_CS_AMM",
	    CS."IS_ASSISTANT_CS_MAN"        AS "IS_ASSISTANT_CS_MAN",
	    
	    RGC."ID_GROUP"                    AS "IdGroup",
	    G."NAME"                         AS "GroupName",
	    G."DESCRIPTION"                   AS "GroupDescription",
	    G."WORK_CENTER"                   AS "WorkerCenter",
	    
	    RGC.IS_TEAM_LEADER              AS "TeamLeader"
	    
		FROM "CONTRACT_MANAGEMENT"."GROUPS" as G
		JOIN "CONTRACT_MANAGEMENT"."REL_GROUPS_CS" as RGC on RGC."ID_GROUP" = G."ID_GROUP"
		JOIN "CONTRACT_MANAGEMENT"."CONTRACT_SUPERVISORS" as CS on CS."ID_CONTRACT_SUPERVISORS" = RGC."ID_CS";

/* Relatione tra CS e PLANT con CS = 1 */
CREATE VIEW "V_REL_CONTRACT_SUPERVISORS_FOR_MANAGE_GDL" 
AS
	SELECT DISTINCT
	    RUA."ID_UB"                     AS "IdUb",
	    RUA."UB_DESC"                   AS "UbDesc",
	    RUA."AFNAM"                     AS "Afnam",
	    RUA."AFNAM_DESC"                AS "AfnamDesc",
	    RUA."PLANT"                     AS "Plant",
	    RUA."PLANT_DESC"                AS "PLANTDESC",
	    
	    CS."ID_CONTRACT_SUPERVISORS" AS "ID_CONTRACT_SUPERVISORS",
	    CS."NAME" AS "NAME",
	    CS."SURNAME" AS "SURNAME",
	    CS."EMAIL" AS "EMAIL",
	    CS."IS_CS" AS "IS_CS",
	    CS."IS_ASSISTANT_CS_SIC" AS "IS_ASSISTANT_CS_SIC",
	    CS."IS_ASSISTANT_CS_AMM" AS "IS_ASSISTANT_CS_AMM",
	    CS."IS_ASSISTANT_CS_MAN" AS "IS_ASSISTANT_CS_MAN"
	    
	    
		FROM "CONTRACT_MANAGEMENT"."REL_UB_TO_AFNAM" as RUA
		
		JOIN "CONTRACT_MANAGEMENT"."REL_USER_UB" as RUU on RUU."ID_UB" = RUA."ID_UB"
		
		JOIN "CONTRACT_MANAGEMENT"."CONTRACT_SUPERVISORS" as CS on CS."ID_CONTRACT_SUPERVISORS" = RUU."USERMANE"
		WHERE  CS."IS_CS" = 1;
		
-- Creazione view ra daily detail
CREATE VIEW "V_RA_DAILY_DETAIL"    
AS
	SELECT DISTINCT
	    RDH."UUID_RA_DAILY_HEAD" AS "UuidRaDailyHead",
	    RDH."CS_DESCRIPTION" AS "CsDescription",
	    RDH."ODA" AS "OdA",
	    RDH."ID_CONTRACT" AS "IdContract",
	    RDH."PLANT" AS "Plant",
	    RDH."DATE" AS "Date",
	    RDH."DOCUMENT_NAME" AS "DocumentName",
	    RDH."ID_RA_DAILY_STATE" AS "IdRaDailyState",
		
	    RDH."SAVE_AND_SEND_BY" AS "SaveAndSendBy",
	    RDH."SAVE_AND_SEND_AT" AS "SaveAndSendAt",
	    RDH."IS_SUPPLIER_RA" AS "IsSupplierRa",
		RDH."UUID_SUPPLIER_RA_HEAD" AS "ExtendedUuidRaDailyHead",
	    RDH."UUID_GDL" AS "UuidGdL",
	    RDH."CREATED_BY" AS "RaHeadCreatedBy",
	    RDH."CREATED_AT" AS "RaHeadCreatedAt",
		
	    RDST."TEXT" AS "RaDailyStateDesc",
	    RDST."SPRAS" AS "RaDailyStateSpras",
	    
	    RDD."UUID_RA_DAILY_DETAIL" AS "UuidRaDailyDetail",
	    RDD."UUID_SUPPLIER_RA_DETAIL" AS "ExtendedUuidRaDailyDetail",
	    RDD."ID_ODM" AS "IdOdM",
	    RDD."ID_ODM_OPERATION" AS "IdOdMOperation",
	    RDD."CREATED_BY" AS "CreatedBy",
	    RDD."CREATED_AT" AS "CreatedAt",
	    RDD."ID_RA_DAILY_ODMOP_STATES" AS "IdOdMOperationStatus",
	    RDD."TOTAL_ACCOUNTING" AS "TotalAccounting",
	    RDD."CURRENCY_TOT" AS "TotalCurrency",
	    RDD."ACCEPT_NOTE" AS "AcceptNote",
	    RDOST."TEXT" AS "OdMOperationStatusDesc",
	    RDOST."SPRAS" AS "OdMOperationStatusSpras",
	    
	    ROOC."ODM_DESCRIPTION" AS "OdMDescription",
	    ROOC."OPERATION_DESCRIPTION" AS "OdMOperationDescription"

		FROM "CONTRACT_MANAGEMENT"."RA_DAILY_HEAD" as RDH
		LEFT JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_STATES_T" as RDST on RDH."ID_RA_DAILY_STATE" = RDST."ID_RA_DAILY_STATE"
		LEFT JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_DETAILS" as RDD on RDH."UUID_RA_DAILY_HEAD" = RDD."UUID_RA_DAILY_HEAD"
		LEFT JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_ODMOP_STATES_T" as RDOST on RDD."ID_RA_DAILY_ODMOP_STATES" = RDOST."ID_RA_DAILY_ODMOP_STATES"
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_ODM_ODA_CONTRACT" as ROOC on ROOC."ID_ODM" = RDD."ID_ODM" AND ROOC."ID_ODM_OPERATION" = RDD."ID_ODM_OPERATION";
		
-- Creazione view ra daily detail attach
CREATE VIEW "V_RA_DAILY_DETAIL_ATTACH"    
AS
	SELECT DISTINCT
	    RDD."UUID_RA_DAILY_DETAIL" AS "UuidRaDailyDetail",
	    RDD."ID_ODM" AS "IdOdM",
	    RDD."ID_ODM_OPERATION" AS "IdOdMOperation",
	    RDD."CS_DESCRIPTION" AS "CsDescription",

	    RDDA."UUID_RA_DAILY_DETAIL_ATTACH" AS "UuidRaDailyDetailAttach",
	    RDDA."DOCUMENTAL_FILENAME" AS "DocumentalFilename",
	    RDDA."FILE_LOCATION" AS "FileLocation",
	    RDDA."FILENAME" AS "Filename",
	    RDDA."UPLOADED_BY" AS "UploadedBy",
	    RDDA."UPLOADED_AT" AS "UploadedAt",
	    RDDA."IS_DELETED" AS "IsDeleted",
	    RDDA."UUID_SUPPLIER_RA_DETAIL_ATTACH" AS "UuidSupplierRaDetailAttach"

		FROM "CONTRACT_MANAGEMENT"."RA_DAILY_DETAILS" as RDD
		JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_DETAIL_ATTACH" as RDDA on RDD."UUID_RA_DAILY_DETAIL" = RDDA."UUID_RA_DAILY_DETAIL";
		
-- Creazione view ra daily detail notes
CREATE VIEW "V_RA_DAILY_DETAIL_NOTES"    
AS
	SELECT DISTINCT
	    RDD."UUID_RA_DAILY_DETAIL" AS "UuidRaDailyDetail",
	    RDD."ID_ODM" AS "IdOdM",
	    RDD."ID_ODM_OPERATION" AS "IdOdMOperation",
	    RDD."CS_DESCRIPTION" AS "CsDescription",

	    RDDN."UUID_RA_DAILY_DETAIL_NOTE" AS "UuidRaDailyDetailNote",
	    RDDN."TEXT" AS "Text",
	    RDDN."CREATED_BY" AS "CreatedBy",
	    RDDN."CREATED_AT" AS "CreatedAt",
		RDDN."IS_DELETED" AS "IsDeleted"

		FROM "CONTRACT_MANAGEMENT"."RA_DAILY_DETAILS" as RDD
		JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_DETAIL_NOTES" as RDDN on RDD."UUID_RA_DAILY_DETAIL" = RDDN."UUID_RA_DAILY_DETAIL";		
		
-- Creazione view ra daily detail workers
CREATE VIEW "V_RA_DAILY_DETAIL_WORKERS"    
AS
	SELECT DISTINCT
	    RDD."UUID_RA_DAILY_DETAIL" AS "UuidRaDailyDetail",
	    RDD."ID_ODM" AS "IdOdM",
	    RDD."ID_ODM_OPERATION" AS "IdOdMOperation",
	    RDD."CS_DESCRIPTION" AS "CsDescription",

	    RDDW."UUID_RA_DAILY_DETAIL_WORKER" AS "UuidRaDailyDetailWorker",
	    RDDW."ID_WORKER" AS "IdWorker",
	    RDDW."TIME1_BEG" AS "Time1Beg",
	    RDDW."TIME1_END" AS "Time1End",
	    RDDW."TIME2_BEG" AS "Time2Beg",
	    RDDW."TIME2_END" AS "Time2End",
	    RDDW."TIME_BREAK" AS "TimeBreak",
	    RDDW."TOTAL_HOURS" AS "TotalHours",
	    RDDW."CREATED_AT" AS "CreatedAt",
	    RDDW."CREATED_BY" AS "CreatedBy",
		RDDW."IS_DELETED" AS "IsDeleted",

	    W."NAME" AS "name",
	    W."SURNAME" AS "surname",
	    W."CONTRACT_EXPIRED_DATE" AS "contractExpiredDate",
	    
	    QT.TEXT AS "Qualifition"

		FROM "CONTRACT_MANAGEMENT"."RA_DAILY_DETAILS" as RDD
		JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_DETAIL_WORKER" as RDDW on RDD."UUID_RA_DAILY_DETAIL" = RDDW."UUID_RA_DAILY_DETAIL"
		JOIN "CONTRACT_MANAGEMENT"."WORKERS" as W on RDDW."ID_WORKER" = W."ID_WORKER"
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_WORKER_QUALIFICATIONS" as RWQ on RWQ."ID_WORKER" = W."ID_WORKER"
		LEFT JOIN "CONTRACT_MANAGEMENT"."QUALIFICATIONS" as Q on Q."ID_QUALIFICATION" = RWQ."ID_QUALIFICATION"
		LEFT JOIN "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" as QT on QT."ID_QUALIFICATION_T" = Q."ID_QUALIFICATION_T";
		
		
-- Creazione view ra daily detail vehicle
CREATE VIEW "V_RA_DAILY_DETAIL_VEHICLE"    
AS
	SELECT DISTINCT
	    RDD."UUID_RA_DAILY_DETAIL" AS "UuidRaDailyDetail",
	    RDD."ID_ODM" AS "IdOdM",
	    RDD."ID_ODM_OPERATION" AS "IdOdMOperation",
	    RDD."CS_DESCRIPTION" AS "CsDescription",

	    RDDV."UUID_RA_DAILY_DETAIL_VEHICLE" AS "UuidRaDailyDetailVehicle",
	    RDDV."ID_VEHICLE" AS "IdVehicle",
	    RDDV."TIME1_BEG" AS "Time1Beg",
	    RDDV."TIME1_END" AS "Time1End",
	    RDDV."TIME2_BEG" AS "Time2Beg",
	    RDDV."TIME2_END" AS "Time2End",
	    RDDV."TIME_BREAK" AS "TimeBreak",
	    RDDV."TOTAL_HOURS" AS "TotalHours",
	    RDDV."CREATED_AT" AS "CreatedAt",
	    RDDV."CREATED_BY" AS "CreatedBy",
		RDDV."IS_DELETED" AS "IsDeleted",
		
	    V."BRAND" AS "Brand",
	    
	    VTT."TEXT" AS "TypeText"
	    
		
		FROM "CONTRACT_MANAGEMENT"."RA_DAILY_DETAILS" as RDD
		JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_DETAIL_VEHICLE" as RDDV on RDD."UUID_RA_DAILY_DETAIL" = RDDV."UUID_RA_DAILY_DETAIL"
		JOIN "CONTRACT_MANAGEMENT"."VEHICLES" as V on RDDV."ID_VEHICLE" = V."ID_VEHICLES"
		LEFT JOIN "CONTRACT_MANAGEMENT"."VEHICLES_TYPES" as VT on VT."ID_VEHICLES_TYPE" = V."ID_VEHICLES_TYPE"	
		JOIN "CONTRACT_MANAGEMENT"."VEHICLES_TYPES_T" as VTT on VTT."ID_VEHICLES_TYPES_T" = VT."ID_VEHICLES_TYPES_T" WHERE (VTT."SPRAS" = 'IT');
		
-- Creazione view ra daily detail equipment
CREATE VIEW "V_RA_DAILY_DETAIL_EQUIPMENT"    
AS
	SELECT DISTINCT
	    RDD."UUID_RA_DAILY_DETAIL" AS "UuidRaDailyDetail",
	    RDD."ID_ODM" AS "IdOdM",
	    RDD."ID_ODM_OPERATION" AS "IdOdMOperation",
	    RDD."CS_DESCRIPTION" AS "CsDescription",

	    RDDE."UUID_RA_DAILY_DETAIL_EQUIPMENT" AS "UuidRaDailyDetailEquipment",
	    RDDE."ID_EQUIPMENT" AS "IdEquipment",
	    RDDE."TIME1_BEG" AS "Time1Beg",
	    RDDE."TIME1_END" AS "Time1End",
	    RDDE."TIME2_BEG" AS "Time2Beg",
	    RDDE."TIME2_END" AS "Time2End",
	    RDDE."TIME_BREAK" AS "TimeBreak",
	    RDDE."TOTAL_HOURS" AS "TotalHours",
	    RDDE."CREATED_AT" AS "CreatedAt",
	    RDDE."CREATED_BY" AS "CreatedBy",
		RDDE."IS_DELETED" AS "IsDeleted",
	    E."DESCRIPTION" AS "Description",
	    E."MANUFACTURER" AS "Manufacturer",
	    E."MODEL" AS "Model"
		
		FROM "CONTRACT_MANAGEMENT"."RA_DAILY_DETAILS" as RDD
		JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_DETAIL_EQUIPMENT" as RDDE on RDD."UUID_RA_DAILY_DETAIL" = RDDE."UUID_RA_DAILY_DETAIL"
		JOIN "CONTRACT_MANAGEMENT"."EQUIPMENT" as E on RDDE."ID_EQUIPMENT" = E."ID_EQUIPMENT";


-- Creazione view per estrazione dati contratto relativi ad un CS (view apposita per GdL)
CREATE VIEW "V_CONTRACT_TO_CS_FOR_GDL"
AS
	SELECT DISTINCT
	
	    C."ID_CONTRACT"                       AS "IdContract",
	    C."ID_UNIQUE_SUP"                     AS "IdUniqueSupplier",
	    C."SUBJECT"                           AS "ContractSubject",
	    C."PLANT"                             AS "Plant",
	    
		S."SUPPLIER_NAME"                     AS "SupplierName",
		S."ID_SUPPLIER"                       AS "CodFornitore",
		
-- 		CS."NAME"                             AS "CSName",
-- 		CS."SURNAME"                          AS "CSSurname",
-- 		CS."ID_CONTRACT_SUPERVISORS"          AS "CSId",
-- 		CS."IS_CS"         					  AS "CSIsCSMain",
		
		GS."ID_GREEN_SHEET"                   AS "IdGreenSheet",
		GS."MODIFIED_DOC"                     AS "GreenSheetModifiedDoc",
		
		ROOC."ODA"                            AS "Oda",
		ROOC."ODA_DESCRIPTION"                AS "OdaDescription",
		ROOC."CS_DESCRIPTION"                 AS "RelOdMOdAContractCsDescription"
		
		FROM "CONTRACT_MANAGEMENT"."CONTRACTS" as C
		
		JOIN "CONTRACT_MANAGEMENT"."SUPPLIERS" as S on S."ID_UNIQUE_SUP" = C."ID_UNIQUE_SUP"
	
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASSOCIATIONS" as CA on CA."ID_CONTRACT" = C."ID_CONTRACT"
		
-- 		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASSOCIATION_DETAILS" as CAD on CAD."ID_CONTRACT_ASSOCIATION" = CA."ID_CONTRACT_ASSOCIATION"
		
-- 		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_SUPERVISORS" as CS on CS."ID_CONTRACT_SUPERVISORS" = CAD."ID_CONTRACT_SUPERVISORS"

		LEFT JOIN "CONTRACT_MANAGEMENT"."GREEN_SHEETS" as GS on C."ID_CONTRACT" = GS."ID_CONTRACT"
		
		JOIN "CONTRACT_MANAGEMENT"."REL_ODM_ODA_CONTRACT" as ROOC on C."ID_CONTRACT" = ROOC."ID_CONTRACT"

		WHERE S."ID_SUPPLIER" = ROOC."SUPPLIER" AND
		    CA."IS_ACTIVE_VERSION" = '1' AND (
		    GS."ID_GREEN_SHEET" IS NULL OR 
		    ( 
		        NOT GS."ID_GREEN_SHEET" IS NULL AND
		        GS."IS_ACTIVE_VERSION" = '1'AND
		        C."ID_UNIQUE_SUP" = GS."ID_UNIQUE_SUP"
		    )
 	      );	
 	      
-- Creazione view ra non core worker
CREATE VIEW "V_RA_DAILY_DETAIL_WORKER_NONCORE"    
AS
	SELECT DISTINCT
	    RDDWNS."UUID_RA_DAILY_HEAD_WORKER" AS "UUID_RA_DAILY_HEAD_WORKER",
	    RDDWNS."UUID_RA_DAILY_HEAD" AS "UUID_RA_DAILY_HEAD",
	    RDDWNS."ID_WORKER" AS "ID_WORKER",
	    RDDWNS."TIME1_BEG" AS "TIME1_BEG",
	    RDDWNS."TIME1_END" AS "TIME1_END",
	    RDDWNS."TIME2_BEG" AS "TIME2_BEG",
	    RDDWNS."TIME2_END" AS "TIME2_END",
	    RDDWNS."TIME_BREAK" AS "TIME_BREAK",
	    RDDWNS."CREATED_AT" AS "CREATED_AT",
	    RDDWNS."CREATED_BY" AS "CREATED_BY",
		RDDWNS."IS_DELETED" AS "IsDeleted",
		RDDWNS.TOTAL_HOURS  AS "TOTAL_HOURS", 
	    
	    W."NAME" AS "NAME",
	    W."SURNAME" AS "SURNAME",

	    W."NAME" AS "name",
	    W."SURNAME" AS "surname",
	    W."CONTRACT_EXPIRED_DATE" AS "contractExpiredDate",
	    
	    QT.TEXT AS "Qualifition"

		FROM "CONTRACT_MANAGEMENT"."RA_DAILY_DETAIL_WORKER_NONCORE_SERVICES" as RDDWNS
		JOIN "CONTRACT_MANAGEMENT"."WORKERS" as W on RDDWNS."ID_WORKER" = W."ID_WORKER"
		LEFT JOIN "CONTRACT_MANAGEMENT"."REL_WORKER_QUALIFICATIONS" as RWQ on RWQ."ID_WORKER" = W."ID_WORKER"
		LEFT JOIN "CONTRACT_MANAGEMENT"."QUALIFICATIONS" as Q on Q."ID_QUALIFICATION" = RWQ."ID_QUALIFICATION"
		LEFT JOIN "CONTRACT_MANAGEMENT"."QUALIFICATIONS_T" as QT on QT."ID_QUALIFICATION_T" = Q."ID_QUALIFICATION_T";
		
-- Creazione view ra non core vehicle
CREATE VIEW "V_RA_DAILY_DETAIL_VEHICLE_NONCORE"    
AS
	SELECT DISTINCT
	    RDDVNS."UUID_RA_DAILY_HEAD_VEHICLE" AS "UUID_RA_DAILY_HEAD_VEHICLE",
	    RDDVNS."UUID_RA_DAILY_HEAD" AS "UUID_RA_DAILY_HEAD",
	    RDDVNS."ID_VEHICLE" AS "ID_VEHICLE",
	    RDDVNS."TIME1_BEG" AS "TIME1_BEG",
	    RDDVNS."TIME1_END" AS "TIME1_END",
	    RDDVNS."TIME2_BEG" AS "TIME2_BEG",
	    RDDVNS."TIME2_END" AS "TIME2_END",
	    RDDVNS."TIME_BREAK" AS "TIME_BREAK",
	    RDDVNS."CREATED_AT" AS "CREATED_AT",
	    RDDVNS."CREATED_BY" AS "CREATED_BY",
		RDDVNS."IS_DELETED" AS "IsDeleted",
		RDDVNS.TOTAL_HOURS  AS "TOTAL_HOURS", 
	    
	    V."BRAND" AS "BRAND",
	    
	    VTT."TEXT" AS "TypeText"
	    

		FROM "CONTRACT_MANAGEMENT"."RA_DAILY_DETAIL_VEHICLE_NONCORE_SERVICES" as RDDVNS
		JOIN "CONTRACT_MANAGEMENT"."VEHICLES" as V on RDDVNS."ID_VEHICLE" = V."ID_VEHICLES"
		LEFT JOIN "CONTRACT_MANAGEMENT"."VEHICLES_TYPES" as VT on VT."ID_VEHICLES_TYPE" = V."ID_VEHICLES_TYPE"	
		JOIN "CONTRACT_MANAGEMENT"."VEHICLES_TYPES_T" as VTT on VTT."ID_VEHICLES_TYPES_T" = VT."ID_VEHICLES_TYPES_T" WHERE (VTT."SPRAS" = 'IT');

-- Creazione view ra non core equipment
CREATE VIEW "V_RA_DAILY_DETAIL_EQUIPMENT_NONCORE"    
AS
	SELECT DISTINCT
	    RDDENS."UUID_RA_DAILY_HEAD_EQUIPMENT" AS "UUID_RA_DAILY_HEAD_EQUIPMENT",
	    RDDENS."UUID_RA_DAILY_HEAD" AS "UUID_RA_DAILY_HEAD",
	    RDDENS."ID_EQUIPMENT" AS "ID_EQUIPMENT",
	    RDDENS."TIME1_BEG" AS "TIME1_BEG",
	    RDDENS."TIME1_END" AS "TIME1_END",
	    RDDENS."TIME2_BEG" AS "TIME2_BEG",
	    RDDENS."TIME2_END" AS "TIME2_END",
	    RDDENS."TIME_BREAK" AS "TIME_BREAK",
	    RDDENS."CREATED_AT" AS "CREATED_AT",
	    RDDENS."CREATED_BY" AS "CREATED_BY",
		RDDENS."IS_DELETED" AS "IsDeleted",
		RDDENS.TOTAL_HOURS  AS "TOTAL_HOURS", 
	    
	    E."DESCRIPTION" AS "DESCRIPTION",
	    E."MANUFACTURER" AS "MANUFACTURER",
	    E."MODEL" AS "MODEL"

		FROM "CONTRACT_MANAGEMENT"."RA_DAILY_DETAIL_EQUIPMENT_NONCORE_SERVICES" as RDDENS
		JOIN "CONTRACT_MANAGEMENT"."EQUIPMENT" as E on RDDENS."ID_EQUIPMENT" = E."ID_EQUIPMENT"; 	
		
CREATE VIEW "V_RA_DAILY_HEAD_FOR_CALENDAR_GDL"    
AS
	SELECT DISTINCT
        RDH."UUID_RA_DAILY_HEAD" AS "UUID_RA_DAILY_HEAD",
        RDH."CS_DESCRIPTION" AS "CS_DESCRIPTION",
        RDH."ODA" AS "ODA",
        RDH."ID_CONTRACT" AS "ID_CONTRACT",
        RDH."PLANT" AS "PLANT",
        RDH."ID_SUPPLIER" AS "ID_SUPPLIER",
        RDH."DATE" AS "DATE",
        RDH."DOCUMENT_NAME" AS "DOCUMENT_NAME",
        RDH."ID_RA_DAILY_STATE" AS "ID_RA_DAILY_STATE",
        RDH."SAVE_AND_SEND_BY" AS "SAVE_AND_SEND_BY",
        RDH."SAVE_AND_SEND_AT" AS "SAVE_AND_SEND_AT",
        RDH."IS_SUPPLIER_RA" AS "IS_SUPPLIER_RA",
        RDH."UUID_SUPPLIER_RA_HEAD" AS "UUID_SUPPLIER_RA_HEAD",
        RDH."CREATED_BY" AS "CREATED_BY",
        RDH."CREATED_AT" AS "CREATED_AT",
        RDH."UUID_GDL" AS "UUID_GDL",
        
        GDL."CREATED_BY" as "GDL_CREATED_BY",
        GDL."CREATED_AT" as "GDL_CREATED_AT",
        GDL."DOCUMENT_NAME" as "GDL_DOCUMENT_NAME",
        GDL."ID_GDL_STATUS" as "ID_GDL_STATUS",
        GDL."FILENAME" as "FILENAME",
        
        GDLST."ID_GDL_STATUS_T" as "ID_GDL_STATUS_T",
        GDLST."TEXT" as "GDL_STATUS_TEXT",
        GDLST."SPRAS" as "GDL_STATUS_SPRAS"
        
		FROM "CONTRACT_MANAGEMENT"."RA_DAILY_HEAD" as RDH
		LEFT JOIN "CONTRACT_MANAGEMENT"."GDL" as GDL on RDH."UUID_GDL" = GDL."UUID_GDL"
		LEFT JOIN "CONTRACT_MANAGEMENT"."GDL_STATUS" as GDLS on GDL."ID_GDL_STATUS" = GDLS."ID_GDL_STATUS"		
		LEFT JOIN "CONTRACT_MANAGEMENT"."GDL_STATUS_T" as GDLST on GDLS."ID_GDL_STATUS_T" = GDLST."ID_GDL_STATUS_T"
		WHERE GDL."IS_ACTIVE_VERSION" = '1' 
		OR (RDH."UUID_GDL" IS NULL OR RDH."UUID_GDL" = '');
		
CREATE VIEW "V_GDL_FOR_CALENDAR_GDL"    
AS
	SELECT DISTINCT
        GDL."UUID_GDL" AS "UUID_GDL",
        GDL."ID_GDL_STATUS" AS "ID_GDL_STATUS",
        GDL."START_DATE" AS "START_DATE",
        GDL."END_DATE" AS "END_DATE",
        GDL."CREATED_BY" AS "CREATED_BY",
        GDL."CREATED_AT" AS "CREATED_AT",
        GDL."DOCUMENT_NAME" AS "DOCUMENT_NAME",
        GDL."ID_CONTRACT" AS "ID_CONTRACT",
        GDL."ODA" AS "ODA",
        GDL."IS_SUPPLIER_VERSION" AS "IS_SUPPLIER_VERSION",
        GDL."FILENAME" AS "FILENAME",
        GDL."VERSION" AS "VERSION",
        GDL."IS_ACTIVE_VERSION" AS "IS_ACTIVE_VERSION",
        GDLST."ID_GDL_STATUS_T" as "ID_GDL_STATUS_T",
        GDLST."TEXT" as "GDL_STATUS_TEXT",
        GDLST."SPRAS" as "GDL_STATUS_SPRAS"
        
		FROM  "CONTRACT_MANAGEMENT"."GDL" as GDL
		LEFT JOIN "CONTRACT_MANAGEMENT"."GDL_STATUS" as GDLS on GDL."ID_GDL_STATUS" = GDLS."ID_GDL_STATUS"		
		LEFT JOIN "CONTRACT_MANAGEMENT"."GDL_STATUS_T" as GDLST on GDLS."ID_GDL_STATUS_T" = GDLST."ID_GDL_STATUS_T";	
		
CREATE VIEW "V_REL_ODMOPERATIONS_OF_GDL_ANNOTATIONS" 
AS
	SELECT DISTINCT
	    GDL."UUID_GDL"                  AS "UuidGdL",
	    GDL."DOCUMENT_NAME"             AS "GdLName",
	    GDL."ID_GDL_STATUS"             AS "GdLStatusId",
	    GDL."FILENAME"                  AS "GdLRepositoryFilename", 
		
	    GST."TEXT"             			AS "GdLStatusText",
	    GST."SPRAS"            			AS "GdLStatusSpras",
		
	    RDH."UUID_RA_DAILY_HEAD"        AS "UuidRaDailyHead",
	    RDH."DATE"                      AS "OperationDate",
	    
	    RDD."UUID_RA_DAILY_DETAIL"      AS "UuidOdmOperation",
	    RDD."ID_ODM" 					AS "Odm",
	    RDD."ID_ODM_OPERATION" 			AS "OdmOperation",
	    RDD."ACCEPT_NOTE" 			    AS "OdmOperationAcceptNote",
	    OO."ODM_DESCRIPTION"            AS "OdmDesc",
	    OO."OPERATION_DESCRIPTION"      AS "OdmOperationDesc",
	    
	    RDD."ID_RA_DAILY_ODMOP_STATES"  AS "IdOdMOperationStatus",
		
		RDOST."TEXT" 					AS "OdMOperationStatusDesc",
	    RDOST."SPRAS" 					AS "OdMOperationStatusSpras"
	    
		FROM "CONTRACT_MANAGEMENT"."GDL" as GDL
		
		JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_HEAD" as RDH on RDH."UUID_GDL" = GDL."UUID_GDL"
		JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_DETAILS" as RDD on RDD."UUID_RA_DAILY_HEAD" = RDH."UUID_RA_DAILY_HEAD"
		JOIN "CONTRACT_MANAGEMENT"."ODM_OPERATIONS" as OO on OO."ID_ODM_OPERATION" = RDD."ID_ODM_OPERATION" AND OO."ID_ODM" = RDD."ID_ODM"
		LEFT JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_ODMOP_STATES_T" as RDOST on RDD."ID_RA_DAILY_ODMOP_STATES" = RDOST."ID_RA_DAILY_ODMOP_STATES"
		LEFT JOIN "CONTRACT_MANAGEMENT"."GDL_STATUS" as GS on GDL."ID_GDL_STATUS" = GS."ID_GDL_STATUS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."GDL_STATUS_T" as GST on GDL."ID_GDL_STATUS" = GST."ID_GDL_STATUS_T"
		WHERE GDL."IS_ACTIVE_VERSION" = '1';
		
CREATE VIEW "V_CONTRACT_TO_CS_FOR_GDL_SUPPLIER_SIDE"
AS
	SELECT DISTINCT
	
	    C."ID_CONTRACT"                       AS "IdContract",
	    C."SUBJECT"                           AS "ContractSubject",
	    C."PLANT"                             AS "Plant",
	    
		S."SUPPLIER_NAME"                     AS "SupplierName",
		S."ID_SUPPLIER"                       AS "CodFornitore",
		
		CS."NAME"                             AS "CSName",
		CS."SURNAME"                          AS "CSSurname",
		CS."ID_CONTRACT_SUPERVISORS"          AS "CSId",
		CAD."IS_CS_MAIN"   					  AS "CSIsCSMain",
		
		GS."ID_GREEN_SHEET"                   AS "IdGreenSheet",
		GS."MODIFIED_DOC"                     AS "GreenSheetModifiedDoc",
		
		ROOC."ODA"                            AS "Oda",
		ROOC."ODA_DESCRIPTION"                AS "OdaDescription",
		ROOC."CS_DESCRIPTION"                 AS "RelOdMOdAContractCsDescription",
		
		RDH."IS_SUPPLIER_RA"                  AS "IsSupplierRa",
		RDH."UUID_RA_DAILY_HEAD"              AS "UuidRaDailyHead",
		RDH."ID_APPROVAL_STATUS"              AS "IdApprovalStatus",
		RDH."APPROVAL_NOTE"                   AS "ApprovalNote",
		
		GDL."UUID_GDL"                        AS "IdGdL",
		GDL."ID_GDL_STATUS"                   AS "IdGdLStatus",
		GDL."IS_SUPPLIER_VERSION"             AS "IsGdLSupplierVersion",
		GDL."IS_ACTIVE_VERSION"               AS "IsGdLActiveVersion"
		
		FROM "CONTRACT_MANAGEMENT"."CONTRACTS" as C
		JOIN "CONTRACT_MANAGEMENT"."SUPPLIERS" as S on S."ID_UNIQUE_SUP" = C."ID_UNIQUE_SUP"
		
		JOIN "CONTRACT_MANAGEMENT"."REL_ODM_ODA_CONTRACT" as ROOC on C."ID_CONTRACT" = ROOC."ID_CONTRACT" AND ROOC."SUPPLIER" = S."ID_SUPPLIER"
		JOIN "CONTRACT_MANAGEMENT"."GDL" as GDL on GDL."ID_CONTRACT" = ROOC."ID_CONTRACT" AND GDL."ODA" = ROOC."ODA"
		JOIN "CONTRACT_MANAGEMENT"."RA_DAILY_HEAD" as RDH on RDH."UUID_GDL" = GDL."UUID_GDL"
		
		
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASSOCIATIONS" as CA on CA."ID_CONTRACT" = C."ID_CONTRACT"
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_ASSOCIATION_DETAILS" as CAD on CAD."ID_CONTRACT_ASSOCIATION" = CA."ID_CONTRACT_ASSOCIATION"
		LEFT JOIN "CONTRACT_MANAGEMENT"."CONTRACT_SUPERVISORS" as CS on CS."ID_CONTRACT_SUPERVISORS" = CAD."ID_CONTRACT_SUPERVISORS"
		LEFT JOIN "CONTRACT_MANAGEMENT"."GREEN_SHEETS" as GS on C."ID_CONTRACT" = GS."ID_CONTRACT"
		

		WHERE CA."IS_ACTIVE_VERSION" = '1' AND (
		    GS."ID_GREEN_SHEET" IS NULL OR 
		    ( 
		        NOT GS."ID_GREEN_SHEET" IS NULL AND
		        GS."IS_ACTIVE_VERSION" = '1'AND
		        C."ID_UNIQUE_SUP" = GS."ID_UNIQUE_SUP"
		    )
 	      );		
 	      
CREATE VIEW "V_RA_DAILY_HEAD_FOR_CALENDAR_GDL_SUPPLIER_SIDE"    
AS
	SELECT DISTINCT
        RDH."UUID_RA_DAILY_HEAD" AS "UUID_RA_DAILY_HEAD",
        RDH."CS_DESCRIPTION" AS "CS_DESCRIPTION",
        RDH."ODA" AS "ODA",
        RDH."ID_CONTRACT" AS "ID_CONTRACT", 
        RDH."PLANT" AS "PLANT",
        RDH."ID_SUPPLIER" AS "ID_SUPPLIER",
        RDH."DATE" AS "DATE",
        RDH."DOCUMENT_NAME" AS "DOCUMENT_NAME",
        RDH."ID_RA_DAILY_STATE" AS "ID_RA_DAILY_STATE",
        RDH."SAVE_AND_SEND_BY" AS "SAVE_AND_SEND_BY",
        RDH."SAVE_AND_SEND_AT" AS "SAVE_AND_SEND_AT",
        RDH."IS_SUPPLIER_RA" AS "IS_SUPPLIER_RA",
        RDH."UUID_SUPPLIER_RA_HEAD" AS "UUID_SUPPLIER_RA_HEAD",
        RDH."CREATED_BY" AS "CREATED_BY",
        RDH."CREATED_AT" AS "CREATED_AT",
        RDH."UUID_GDL" AS "UUID_GDL",
        RDH."ID_APPROVAL_STATUS" AS "ID_APPROVAL_STATUS_RA",
        
        GDL."CREATED_BY" as "GDL_CREATED_BY",
        GDL."CREATED_AT" as "GDL_CREATED_AT",
        GDL."DOCUMENT_NAME" as "GDL_DOCUMENT_NAME",
        GDL."START_DATE" as "GDL_START_DATE",
        GDL."END_DATE" as "GDL_END_DATE",
        GDL."IS_SUPPLIER_VERSION" as "GDL_IS_SUPPLIER_VERSION", 
        GDL."VERSION" as "GDL_VERSION",
        GDL."IS_ACTIVE_VERSION" as "GDL_IS_ACTIVE_VERSION",
        GDL."ID_GDL_STATUS" as "ID_GDL_STATUS",
        GDL."FILENAME" as "FILENAME",
		
        GDLST."ID_GDL_STATUS_T" as "ID_GDL_STATUS_T",
		
        GDLST."TEXT" as "GDL_STATUS_TEXT",
        GDLST."SPRAS" as "GDL_STATUS_SPRAS"
        
		FROM "CONTRACT_MANAGEMENT"."RA_DAILY_HEAD" as RDH
		LEFT JOIN "CONTRACT_MANAGEMENT"."GDL" as GDL on RDH."UUID_GDL" = GDL."UUID_GDL"
		LEFT JOIN "CONTRACT_MANAGEMENT"."GDL_STATUS" as GDLS on GDL."ID_GDL_STATUS" = GDLS."ID_GDL_STATUS"		
		LEFT JOIN "CONTRACT_MANAGEMENT"."GDL_STATUS_T" as GDLST on GDLS."ID_GDL_STATUS_T" = GDLST."ID_GDL_STATUS_T"