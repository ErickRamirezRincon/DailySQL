create or replace PACKAGE ORCLAPPQA.MIDDLEWARE_OFCS AS

    PROCEDURE add_ejecutivo (
        recurso_id_in        IN VARCHAR2 DEFAULT '-',
        nombre_in            IN VARCHAR2 DEFAULT'-',
        parent_id_in          IN VARCHAR2 DEFAULT'-',
        e_mail_in            IN VARCHAR2 DEFAULT'-',
        status_in            IN VARCHAR2 DEFAULT'-',
        tipo_in              IN VARCHAR2 DEFAULT'-'
    );
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
        numeroCredito_in    IN VARCHAR2 DEFAULT '-',
        numeroSolicitud_in  IN VARCHAR2 DEFAULT '-',
        numeroCliente_in    IN VARCHAR2 DEFAULT '-',
        lugarGestion_in     IN VARCHAR2 DEFAULT '-',
        coordenada_x_in     IN VARCHAR2 DEFAULT '-',
        coordenada_y_in     IN VARCHAR2 DEFAULT '-'
        );

END MIDDLEWARE_OFCS;