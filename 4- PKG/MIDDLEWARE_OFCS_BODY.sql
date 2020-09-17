create or replace PACKAGE BODY ORCLAPPQA.MIDDLEWARE_OFCS AS
        count_recurso_tipo_id number;
        count_recurso_status_id number;
        count_recurso_id number;
        count_status_id number;
        log_text varchar(32766);
        count_prioridad_id number; 
        count_etiqueta_id number;
        count_actividad_tipo_id number;
        count_actividad_id number; 
        count_sucursal_id number;
  PROCEDURE add_ejecutivo (
        recurso_id_in        IN VARCHAR2 DEFAULT '-',
        nombre_in            IN VARCHAR2 DEFAULT'-',
        parent_id_in          IN VARCHAR2 DEFAULT'-',
        e_mail_in            IN VARCHAR2 DEFAULT'-',
        status_in            IN VARCHAR2 DEFAULT'-',
        tipo_in              IN VARCHAR2 DEFAULT'-'    
    ) AS
    BEGIN 
    DBMS_OUTPUT.PUT_LINE ('------ iniciando procedimiento -----------');
    if tipo_in='zona' then
        select count(1) into count_sucursal_id 
            from cat_sucursal where(sucursal_id = recurso_id_in) and rownum = 1;
        if count_sucursal_id = 0 then      
            Insert into ORCLAPPQA.cat_sucursal(
            sucursal_id,
            sucursal
            )values(
            recurso_id_in,
            nombre_in);end if;    
    else
        select count(1) into count_recurso_status_id 
            from cat_resource_status where(status = status_in) and rownum = 1;
            DBMS_OUTPUT.PUT_LINE ('status_in: ' || status_in);
            if count_recurso_status_id = 0 then
                Insert into ORCLAPPQA.cat_resource_status(
                status
                )values(
                status_in
                );elsif count_recurso_status_id = 1 then
                select recurso_status_id into count_recurso_status_id 
                from cat_resource_status where(status = status_in);
            end if;   

            select count(1) into count_recurso_tipo_id 
            from cat_resource_tipo where(tipo = tipo_in) and rownum = 1;
            if count_recurso_tipo_id = 0 then
                Insert into ORCLAPPQA.cat_resource_tipo(
                tipo
                )values(
                tipo_in
                );elsif count_recurso_tipo_id = 1 then
                select recurso_tipo_id into count_recurso_tipo_id 
                from cat_resource_tipo where(tipo = tipo_in);                
            end if;            
            select count(1) into count_recurso_id
            from ejecutivo where(recurso_id=recurso_id_in) and rownum=1;
            if count_recurso_id = 0 then
                select recurso_status_id into count_recurso_status_id
                from cat_resource_status where Status=status_in;                                        
                select recurso_tipo_id into count_recurso_tipo_id
                from cat_resource_tipo where TIPO=tipo_in;                                       
                INSERT INTO ORCLAPPQA.ejecutivo (
                    recurso_id,                
                    nombre,          
                    parent_id,       
                    e_mail,        
                    status,          
                    tipo
                ) VALUES (
                    recurso_id_in,                
                    nombre_in,         
                    parent_id_in,      
                    e_mail_in,        
                    count_recurso_status_id,
                    count_recurso_tipo_id
                );elsif count_recurso_id = 1 then
                UPDATE ORCLAPPQA.ejecutivo
                    set nombre = nombre_in
                    where recurso_id = recurso_id_in;
                UPDATE ORCLAPPQA.ejecutivo
                    set parent_id = parent_id_in
                    where recurso_id = recurso_id_in;
                UPDATE ORCLAPPQA.ejecutivo
                    set e_mail = e_mail_in
                    where recurso_id = recurso_id_in;                    
                UPDATE ORCLAPPQA.ejecutivo
                    set status = count_recurso_status_id
                    where recurso_id = recurso_id_in;
                UPDATE ORCLAPPQA.ejecutivo
                    set tipo = count_recurso_tipo_id
                    where recurso_id = recurso_id_in;
            end if;
        end if;    
  END add_ejecutivo;
  PROCEDURE add_actividad (
        fecha_in    IN VARCHAR2 DEFAULT '-',   
        recurso_id_in    IN VARCHAR2 DEFAULT '-',
        actividad_id_in  IN NUMBER DEFAULT'-',
        prioridad_in     IN VARCHAR2 DEFAULT '-',        
        status_in       IN VARCHAR2 DEFAULT'-',
        inicio_in       IN VARCHAR2 DEFAULT'-',
        fin_in          IN VARCHAR2 DEFAULT '-',
        assignment_time_in IN VARCHAR2 DEFAULT '-',
        booking_time_in  IN VARCHAR2 DEFAULT '-',
        duracion_in      IN NUMBER DEFAULT '-',
        etiqueta_in     IN VARCHAR2 DEFAULT '-', 
        actividad_tipo_in          IN VARCHAR2 DEFAULT '-',
        Comentarios_in          IN VARCHAR2 DEFAULT '-',
        fechaCreditoOtorgamiento_in          IN VARCHAR2 DEFAULT '-',
        Fecha_Posible_Pago_in          IN VARCHAR2 DEFAULT '-',
        Fecha_Visita_a_Sucursal_in          IN VARCHAR2 DEFAULT '-',
        route_date_in          IN VARCHAR2 DEFAULT '-',
        saldoExigible_in          IN VARCHAR2 DEFAULT '-',
        totalPendiente_in          IN VARCHAR2 DEFAULT '-',
        totalAbonado_in          IN VARCHAR2 DEFAULT '-',
        idSucursal_in          IN VARCHAR2 DEFAULT '-',
        streetAddress_in          IN VARCHAR2 DEFAULT '-',
        firstManualOperationUser_in          IN VARCHAR2 DEFAULT '-',
        travelTime_in          IN VARCHAR2 DEFAULT '-',
        timeDeliveredEnd_in          IN VARCHAR2 DEFAULT '-',
        timeDeliveredStart_in          IN VARCHAR2 DEFAULT '-',
        timeSlot_in          IN VARCHAR2 DEFAULT '-',
        customerNumber_in          IN VARCHAR2 DEFAULT '-',
        apptNumber_in          IN VARCHAR2 DEFAULT '-',
        Etiquetas_in          IN VARCHAR2 DEFAULT '-',
        dictamen_in     IN VARCHAR2 DEFAULT '-',
        subdictamen_in  IN VARCHAR2 DEFAULT '-',
        numeroCredito_in   IN VARCHAR2 DEFAULT '-',
        numeroSolicitud_in IN VARCHAR2 DEFAULT '-',
        numeroCliente_in IN VARCHAR2 DEFAULT '-',
        lugarGestion_in  IN VARCHAR2 DEFAULT '-',
        coordenada_x_in  IN VARCHAR2 DEFAULT '-',
        coordenada_y_in  IN VARCHAR2 DEFAULT '-'
    ) AS
    BEGIN 

        DBMS_OUTPUT.PUT_LINE ('------inicio addactividad----------');
            select count(1) into count_prioridad_id
            from cat_actividad_prioridad where(prioridad=prioridad_in) and rownum = 1;
            if count_prioridad_id = 0 then
                Insert into ORCLAPPQA.cat_actividad_prioridad(
                prioridad
                )VALUES(
                prioridad_in
                );elsif count_prioridad_id = 1 then
                select prioridad_id into count_prioridad_id 
                from cat_actividad_prioridad where(prioridad=prioridad_in); 
            end if;    

            select count(1) into count_status_id
            from cat_actividad_status where(status=status_in) and rownum = 1;
            if count_status_id = 0 then
                Insert into ORCLAPPQA.cat_actividad_status(
                status
                )VALUES(
                status_in
                );elsif count_status_id = 1 then
                select actividad_status_id into count_status_id 
                from cat_actividad_status where(status=status_in); 
                end if;

            select count(1) into count_etiqueta_id
            from cat_etiqueta where(etiqueta = etiqueta_in) and rownum = 1;
            if count_etiqueta_id = 0 then
                Insert into ORCLAPPQA.cat_etiqueta(
                etiqueta
                )VALUES(
                etiqueta_in
                );elsif count_etiqueta_id = 1 then
                select etiqueta_id into count_etiqueta_id
                from cat_etiqueta where(etiqueta = etiqueta_in); 
                end if;

            select count(1) into count_actividad_tipo_id
            from cat_actividad_tipo where(tipo = actividad_tipo_in) and rownum = 1;
            if count_actividad_tipo_id = 0 then
                Insert into ORCLAPPQA.cat_actividad_tipo(
                tipo
                )VALUES(
                actividad_tipo_in
                );elsif count_actividad_tipo_id = 1 then
                select actividad_tipo_id into count_actividad_tipo_id
                from cat_actividad_tipo where(tipo = actividad_tipo_in);
                end if;

            select count(1) into count_actividad_id
            from actividades_ofcs where(actividad_id = actividad_id_in) and rownum = 1;
            if count_actividad_id = 0 then
                select etiqueta_id into count_etiqueta_id
                from cat_etiqueta where etiqueta=etiqueta_in;                                        
                select actividad_tipo_id into count_actividad_tipo_id
                from cat_actividad_tipo where TIPO=actividad_tipo_in;
                select prioridad_id into count_prioridad_id
                from cat_actividad_prioridad where prioridad=prioridad_in;
                select actividad_status_id into count_status_id
                from cat_actividad_status where status=status_in;

                INSERT INTO ORCLAPPQA.actividades_ofcs(
                fecha,      
                recurso_id,
                actividad_id,
                prioridad,        
                status,
                start_time,
                end_time,
                assignment_time,
                booking_time,
                duracion,
                etiqueta,
                tipo,
                Comentarios,
                fechaCreditoOtorgamiento,
                Fecha_Posible_Pago,
                Fecha_Visita_a_Sucursal,
                saldoExigible,
                totalPendiente,
                route_date,		
                totalAbonado,
                idSucursal,
                streetAddress,
                firstManualOperationUser,
                travelTime,
                timeDeliveredEnd,
                timeDeliveredStart,	
                timeSlot,
                customerNumber,
                apptNumber,
                Etiquetas,
                DICTAMEN,
                SUBDICTAMEN,
                NUMERO_CREDITO,
                NUMERO_SOLICITUD,
                NUMERO_CLIENTE,
                LUGAR_GESTION,
                COORDENADA_X,
                COORDENADA_Y
             )VALUES (
                fecha_in,   
                recurso_id_in,
                actividad_id_in,
                count_prioridad_id,        
                count_status_id,
                inicio_in,
                fin_in,
                assignment_time_in,
                booking_time_in,
                duracion_in,
                count_etiqueta_id,
                count_actividad_tipo_id,
                comentarios_in,
                fechaCreditoOtorgamiento_in,
                Fecha_Posible_Pago_in,
                Fecha_Visita_a_Sucursal_in,
                saldoExigible_in,
                totalPendiente_in,
                route_date_in,
                totalAbonado_in,
                idSucursal_in,
                streetAddress_in, 
                firstManualOperationUser_in,
                travelTime_in,
                timeDeliveredEnd_in,
                timeDeliveredStart_in,	
                timeSlot_in,
                customerNumber_in,
                apptNumber_in,
                Etiquetas_in,
                dictamen_in,
                subdictamen_in,
                numeroCredito_in,
                numeroSolicitud_in,
                numeroCliente_in,
                lugarGestion_in,
                coordenada_x_in,
                coordenada_y_in
            );
        elsif count_actividad_id=1 then     
            UPDATE ORCLAPPQA.actividades_ofcs
                set fecha = fecha_in
                where actividad_id = actividad_id_in;    
            UPDATE ORCLAPPQA.actividades_ofcs
                set recurso_id = recurso_id_in
                where actividad_id = actividad_id_in;    
            UPDATE ORCLAPPQA.actividades_ofcs
                set actividad_id = actividad_id_in
                where actividad_id = actividad_id_in;    
            UPDATE ORCLAPPQA.actividades_ofcs
                set prioridad= count_prioridad_id        
                where actividad_id = actividad_id_in;    
            UPDATE ORCLAPPQA.actividades_ofcs
                set status = count_status_id
                where actividad_id = actividad_id_in;    
            UPDATE ORCLAPPQA.actividades_ofcs
                set start_time=inicio_in            
                where actividad_id = actividad_id_in;    
            UPDATE ORCLAPPQA.actividades_ofcs
                set end_time=fin_in            
                where actividad_id = actividad_id_in;                    
            UPDATE ORCLAPPQA.actividades_ofcs
                set assignment_time=assignment_time_in
                where actividad_id = actividad_id_in;    
            UPDATE ORCLAPPQA.actividades_ofcs
                set booking_time=booking_time_in
                where actividad_id = actividad_id_in;    
            UPDATE ORCLAPPQA.actividades_ofcs
                set duracion=duracion_in
                where actividad_id = actividad_id_in;    
            UPDATE ORCLAPPQA.actividades_ofcs
                set etiqueta = count_etiqueta_id 
                where actividad_id = actividad_id_in;    
            UPDATE ORCLAPPQA.actividades_ofcs
                set tipo=count_actividad_tipo_id
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set Comentarios=Comentarios_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set fechaCreditoOtorgamiento=fechaCreditoOtorgamiento_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set Fecha_Posible_Pago=Fecha_Posible_Pago_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set Fecha_Visita_a_Sucursal=Fecha_Visita_a_Sucursal_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set route_date=route_date_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set saldoExigible=saldoExigible_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set totalPendiente=totalPendiente_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set totalAbonado=totalAbonado_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set idSucursal=idSucursal_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set streetAddress=streetAddress_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set firstManualOperationUser= firstManualOperationUser_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set travelTime= travelTime_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set timeDeliveredEnd= timeDeliveredEnd_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set timeDeliveredStart = timeDeliveredStart_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set timeSlot = timeSlot_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set customerNumber= customerNumber_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set apptNumber= apptNumber_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set Etiquetas = Etiquetas_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set DICTAMEN = dictamen_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set SUBDICTAMEN = subdictamen_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set NUMERO_CREDITO = numeroCredito_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set NUMERO_SOLICITUD = numeroSolicitud_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set NUMERO_CLIENTE = numeroCliente_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set LUGAR_GESTION = lugarGestion_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set COORDENADA_X = coordenada_x_in
                where actividad_id = actividad_id_in;
            UPDATE ORCLAPPQA.actividades_ofcs
                set COORDENADA_Y = coordenada_y_in
                where actividad_id = actividad_id_in;
        end if; 

  END add_actividad;
END MIDDLEWARE_OFCS;