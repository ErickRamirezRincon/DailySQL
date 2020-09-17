CREATE TABLE "ORCLAPPQA"."CAT_RESOURCE_TIPO" 
   (	"RECURSO_TIPO_ID" NUMBER NOT NULL ENABLE, 
		"TIPO" VARCHAR2(20 BYTE) NOT NULL ENABLE
   )
   TABLESPACE "ORCLAPPQA_DATA_DAT"

CREATE UNIQUE INDEX ORCLAPPQA.IDX_RESOURCE_TIPO_PK ON ORCLAPPQA.CAT_RESOURCE_TIPO (RECURSO_TIPO_ID) TABLESPACE ORCLAPPQA_DATA_IDX NOLOGGIN
ALTER TABLE ORCLAPPQA.CAT_RESOURCE_TIPO ADD (CONSTRAINT CAT_RESOURCE_TIPO_PK PRIMARY KEY (RECURSO_TIPO_ID) USING INDEX)