CLASS zcl_main_ama DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
        INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_main_ama IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
     out->write( 'Hello world!' ).

    " Declarar las variables necesarias
    DATA: lo_customer_manager TYPE REF TO zcl_customer_manager_ama,
          lv_check TYPE sy-subrc,
          lt_customers TYPE TABLE OF ztcustomer_ama.

    " Crear la instancia del objeto customer_manager
    lo_customer_manager = NEW zcl_customer_manager_ama( ).

    " Añadir clientes
    lo_customer_manager->add_customer( iv_id = 'C001' iv_name = 'Alice' iv_activo = 'Y' ).
      out->write( |Cliente añadido: ID = C001, Name = Alice, Activo = Y| ).
    lo_customer_manager->add_customer( iv_id = 'C002' iv_name = 'Bob' iv_activo = 'N' ).
      out->write( |Cliente añadido: ID = C002, Name = Bob, Activo = N| ).
    lo_customer_manager->add_customer( iv_id = 'C003' iv_name = 'Charlie' iv_activo = 'Y' ).
      out->write( |Cliente añadido: ID = C003, Name = Charlie, Activo = Y| ).
    lo_customer_manager->add_customer( iv_id = 'C004' iv_name = 'Diana' iv_activo = 'Y' ).
      out->write( |Cliente añadido: ID = C004, Name = Diana, Activo = Y| ).

    " Actualizar cliente
    lo_customer_manager->update_customer( iv_id = 'C002' iv_name = 'Robert' iv_activo = 'Y' ).
      out->write( |Cliente actualizado: ID = C002, New Name = Robert, Activo = Y| ).

    " Eliminar cliente
    lo_customer_manager->delete_customer( iv_id = 'C003' ).
      out->write( |Cliente eliminado: ID = C003| ).

    " Consultar la tabla y almacenar el resultado en la tabla interna
    SELECT * FROM ztcustomer_ama INTO TABLE @lt_customers.

  ENDMETHOD.

ENDCLASS.




