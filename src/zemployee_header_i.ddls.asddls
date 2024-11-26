@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Employee'
define root view entity zemployee_header_i as select from zemployee_header
composition[1..*] of zemployee_attach_i as _Attachments
{   
    @EndUserText.label: 'Employee ID'
   key  zemployee_header.id as Id,
    @EndUserText.label: 'First Name'
    zemployee_header.firstname as Firstname,
    @EndUserText.label: 'Last Name'
    zemployee_header.lastname as Lastname,
    @EndUserText.label: 'Age'
    zemployee_header.age as Age,
    @EndUserText.label: 'Role'    
    zemployee_header.role as Role,
    @EndUserText.label: 'Division'    
    zemployee_header.division as Division,
    zemployee_header.lastchangedat as Lastchangedat,
    zemployee_header.locallastchangedat as Locallastchangedat,
    
    
    _Attachments // Make association public
}
