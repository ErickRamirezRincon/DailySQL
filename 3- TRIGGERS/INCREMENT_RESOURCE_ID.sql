create or replace TRIGGER ORCLAPPQA.INCREMENT_RESOURCE_ID 
   before insert on "ORCLAPPQA"."CAT_RESOURCE_TIPO" 
   for each row
begin  
   if inserting then 
      if :NEW."RECURSO_TIPO_ID" is null then 
         select OFCS_CAT_ID.nextval into :NEW."RECURSO_TIPO_ID" from dual; 
      end if; 
   end if; 
end;