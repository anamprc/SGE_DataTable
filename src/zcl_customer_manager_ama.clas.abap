CLASS zcl_customer_manager_ama DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      add_customer
        IMPORTING
          iv_id      TYPE ztcustomer_ama-customer_id
          iv_name    TYPE ztcustomer_ama-customer_name
          iv_activo  TYPE ztcustomer_ama-customer_activo
        EXPORTING
          ev_check   TYPE sy-subrc,
      update_customer
        IMPORTING
          iv_id      TYPE ztcustomer_ama-customer_id
          iv_name    TYPE ztcustomer_ama-customer_name
          iv_activo  TYPE ztcustomer_ama-customer_activo
        EXPORTING
          ev_check   TYPE sy-subrc,
      delete_customer
        IMPORTING
          iv_id      TYPE ztcustomer_ama-customer_id
        EXPORTING
          ev_check   TYPE sy-subrc.
ENDCLASS.

CLASS zcl_customer_manager_ama IMPLEMENTATION.

  METHOD add_customer.
    DATA(ls_customer) = VALUE ztcustomer_ama(
      customer_id = iv_id
      customer_name = iv_name
      customer_activo = iv_activo ).

    INSERT INTO ztcustomer_ama VALUES @ls_customer.
    ev_check = sy-subrc.
  ENDMETHOD.

  METHOD update_customer.
    UPDATE ztcustomer_ama
      SET customer_name = @iv_name,
          customer_activo = @iv_activo
      WHERE customer_id = @iv_id.
    ev_check = sy-subrc.
  ENDMETHOD.

  METHOD delete_customer.
    DELETE FROM ztcustomer_ama WHERE customer_id = @iv_id.
    ev_check = sy-subrc.
  ENDMETHOD.

ENDCLASS.


