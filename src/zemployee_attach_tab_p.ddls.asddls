@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Header Table'
define root view entity zemployee_attach_tab_p
  provider contract transactional_query
  as projection on zemployee_header_i

{
      @UI.facet: [{
          id: 'EmployeeData',
          purpose: #STANDARD,
          label: 'Employee Data',
          type: #IDENTIFICATION_REFERENCE,
          position: 10
      },{
          id: 'Upload',
          purpose: #STANDARD,
          label: 'Upload Attachments',
          type: #LINEITEM_REFERENCE,
          position: 20,
          targetElement: '_Attachments'
      }]

      @UI: {
          selectionField: [{ position: 10 }],
          lineItem: [{ position: 10 }],
          identification: [{ position: 10 }]
      }

  key Id,
      @UI: {
        lineItem: [{position: 20 }],
        identification: [{position: 20 }]
      }
      Firstname,
      @UI: {
        lineItem: [{position: 30 }],
        identification: [{position: 30 }]
      }
      Lastname,
      @UI: {
        lineItem: [{position: 40 }],
        identification: [{position: 40 }]
      }
      Age,
      @UI: {
        lineItem: [{position: 50 }],
        identification: [{position: 50 }]
      }
      Role,
      @UI: {
        lineItem: [{position: 60 }],
        identification: [{position: 60 }]
      }
      Division,
      @UI: {
        lineItem: [{position: 70 }],
        identification: [{position: 70 }]
      }

      Lastchangedat,
      Locallastchangedat,
      /* Associations */
      _Attachments : redirected to composition child zemployee_attach_tabl_p

}
