create or replace TRIGGER ORCLAPPQA.INCREMENTO_ID 
   before insert on "ORCLAPPQA"."CAT_ACTIVIDAD_PRIORIDAD" 
   for each row
begin  
   if inserting then 
      if :NEW."PRIORIDAD_ID" is null then 
         select OFCS_CAT_ID.nextval into :NEW."PRIORIDAD_ID" from dual; 
      end if; 
   end if; 
end;