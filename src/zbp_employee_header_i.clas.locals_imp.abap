CLASS lhc_employee DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR employee RESULT result.
    METHODS copyemployee FOR MODIFY
      IMPORTING keys FOR ACTION employee~copyemployee.
    METHODS createemployee FOR MODIFY
      IMPORTING keys FOR ACTION employee~createemployee.
ENDCLASS.

CLASS lhc_employee IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD copyemployee.
*    DATA: lt_employee TYPE TABLE FOR CREATE zemployee_header_i.
*    " Reading selected data from front end
*    READ ENTITIES OF zemployee_header_i IN LOCAL MODE
*      ENTITY employee
*      ALL FIELDS WITH CORRESPONDING #( keys )
*      RESULT DATA(employee)
*      FAILED failed.
*
*    LOOP AT employee ASSIGNING FIELD-SYMBOL(<lfs_employee>).
*      APPEND VALUE #( %cid = keys[ KEY entity %key = <lfs_employee>-%key ]-%cid
*                      %data = CORRESPONDING #( <lfs_employee> EXCEPT id )
*
*       )  TO lt_employee ASSIGNING FIELD-SYMBOL(<lfs_newemployee>).
*    ENDLOOP.
*
*    "Create BO Instance by COpy
*
*    MODIFY ENTITIES OF zemployee_header_i IN LOCAL MODE
*    ENTITY Employee
*    CREATE FIELDS ( Firstname Lastname Age Role Division )
*    WITH lt_employee
*    MAPPED DATA(mapped_create).
*
*
*    mapped-employee = mapped_create-employee.
  ENDMETHOD.

  METHOD createemployee.
  MODIFY ENTITIES OF zemployee_header_i IN LOCAL MODE
    ENTITY Employee
      CREATE FROM VALUE #( FOR <instance> IN keys (
                          %cid = <instance>-%cid
                          Age = 1
                          Firstname = 'FNM'
                          Lastname = 'LNM'
                          Role     = 'Consultant'
                          Division = 'DEVCENT'
                          %control =
                          VALUE #(
                              Age = if_abap_behv=>mk-on
                              Role = if_abap_behv=>mk-on
                              Division = if_abap_behv=>mk-off
                              Firstname = if_abap_behv=>mk-on
                              Lastname = if_abap_behv=>mk-off
                          )
       ) )
       MAPPED mapped
       FAILED failed
       REPORTED reported.
  ENDMETHOD.

ENDCLASS.
