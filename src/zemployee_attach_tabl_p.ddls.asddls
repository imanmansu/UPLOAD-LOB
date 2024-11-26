@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Attachment'
define  view entity zemployee_attach_tabl_p
  as projection on zemployee_attach_i
{
      @UI.facet: [{
              id: 'EmployeeData',
              purpose: #STANDARD,
              label: 'Attachment Information',
              type: #IDENTIFICATION_REFERENCE,
              position: 10
          }]

      @UI: {
            lineItem: [{ position: 10 }],
            identification: [{ position: 10 }]
        }

  key AttachId,
      @UI: {
         lineItem: [{ position: 20 }],
         identification: [{ position: 20 }]
       }
      Id,
      @UI: {
        lineItem: [{ position: 30 }],
        identification: [{ position: 30 }]
      }
      Comments,
      @UI: {
          lineItem: [{ position: 40 }],
          identification: [{ position: 40 }]
        }
      Attachment,
      Mimetype,
      Filename,
      LastChangeDat,

      /* Associations */
      _employee : redirected to parent zemployee_attach_tab_p


}
