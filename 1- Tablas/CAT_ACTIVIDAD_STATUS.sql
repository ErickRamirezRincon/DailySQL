CREATE TABLE "ORCLAPPQA"."CAT_ACTIVIDAD_STATUS" 
   (	"ACTIVIDAD_STATUS_ID" NUMBER NOT NULL ENABLE, 
		"STATUS" 			  VARCHAR2(20 BYTE) NOT NULL ENABLE
   ) 
   TABLESPACE "ORCLAPPQA_DATA_DAT"

CREATE UNIQUE INDEX ORCLAPPQA.IDX_ESTATUS_PK ON ORCLAPPQA.CAT_ACTIVIDAD_STATUS (ACTIVIDAD_STATUS_ID) TABLESPACE ORCLAPPQA_DATA_IDX NOLOGGIN
ALTER TABLE ORCLAPPQA.CAT_ACTIVIDAD_STATUS ADD (CONSTRAINT CAT_ACTIVIDAD_STATUS_PK PRIMARY KEY (ACTIVIDAD_STATUS_ID) USING INDEX)