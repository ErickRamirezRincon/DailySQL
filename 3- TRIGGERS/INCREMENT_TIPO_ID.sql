create or replace TRIGGER ORCLAPPQA.INCREMENT_TIPO_ID 
   before insert on "ORCLAPPQA"."CAT_ACTIVIDAD_TIPO" 
   for each row
begin  
   if inserting then 
      if :NEW."ACTIVIDAD_TIPO_ID" is null then 
         select OFCS_CAT_ID.nextval into :NEW."ACTIVIDAD_TIPO_ID" from dual; 
      end if; 
   end if; 
end;