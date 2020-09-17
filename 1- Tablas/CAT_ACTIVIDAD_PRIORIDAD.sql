CREATE TABLE "ORCLAPPQA"."CAT_ACTIVIDAD_PRIORIDAD" 
    (	"PRIORIDAD_ID" NUMBER NOT NULL ENABLE, 
		"PRIORIDAD" VARCHAR2(20 BYTE) NOT NULL ENABLE
  	)
 	TABLESPACE "ORCLAPPQA_DATA_DAT"

CREATE UNIQUE INDEX ORCLAPPQA.IDX_PRIORIDAD_PK ON ORCLAPPQA.CAT_ACTIVIDAD_PRIORIDAD (PRIORIDAD_ID) TABLESPACE ORCLAPPQA_DATA_IDX NOLOGGIN
ALTER TABLE ORCLAPPQA.CAT_ACTIVIDAD_PRIORIDAD ADD (CONSTRAINT CAT_ACTIVIDAD_PRIORIDAD_PK PRIMARY KEY (PRIORIDAD_ID) USING INDEX)	