@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Attachment'
define view entity zemployee_attach_i as select from zemployee_attach
  association to parent zemployee_header_i as _employee
  on $projection.Id = _employee.Id
{
  key zemployee_attach.attach_id  as AttachId,
      zemployee_attach.id         as Id,
      @EndUserText.label: 'Comments'
      zemployee_attach.comments   as Comments,
      @EndUserText.label: 'Attachments'
      @Semantics.largeObject:{
          mimeType: 'Mimetype',
          fileName: 'Filename',
          contentDispositionPreference: #INLINE
      }
      zemployee_attach.attachment as Attachment,
      @EndUserText.label: 'File Type'
      zemployee_attach.mimetype   as Mimetype,
      @EndUserText.label: 'File Name'
      zemployee_attach.filename   as Filename,
    
      _employee.Lastchangedat as LastChangeDat,
      _employee // Make association public
}
