create or replace TRIGGER ORCLAPPQA.INCREMENT_ETIQUETA_ID 
   before insert on "ORCLAPPQA"."CAT_ETIQUETA" 
   for each row
begin  
   if inserting then 
      if :NEW."ETIQUETA_ID" is null then 
         select OFCS_CAT_ID.nextval into :NEW."ETIQUETA_ID" from dual; 
      end if; 
   end if; 
end;