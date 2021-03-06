create or replace TRIGGER ORCLAPPQA.INCREMENT_RECURSO_STATUS_ID 
   before insert on "ORCLAPPQA"."CAT_RESOURCE_STATUS" 
   for each row
begin  
   if inserting then 
      if :NEW."RECURSO_STATUS_ID" is null then 
         select OFCS_CAT_ID.nextval into :NEW."RECURSO_STATUS_ID" from dual; 
      end if; 
   end if; 
end;