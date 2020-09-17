create or replace TRIGGER ORCLAPPQA.INCREMENT_ID 
   before insert on "ORCLAPPQA"."CAT_ACTIVIDAD_STATUS" 
   for each row
begin  
   if inserting then 
      if :NEW."ACTIVIDAD_STATUS_ID" is null then 
         select OFCS_CAT_ID.nextval into :NEW."ACTIVIDAD_STATUS_ID" from dual; 
      end if; 
   end if; 
end;