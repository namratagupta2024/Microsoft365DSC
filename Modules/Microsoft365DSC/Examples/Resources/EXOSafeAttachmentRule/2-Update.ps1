<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param(
        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint
    )
    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        EXOSafeAttachmentRule 'ConfigureSafeAttachmentRule'
        {
            Identity                  = "Research Department Attachment Rule"
            Comments                  = "Applies to Research Department, except managers"
            Enabled                   = $False # Updated Property
            ExceptIfSentToMemberOf    = "Executives@$TenantId"
            SafeAttachmentPolicy      = "Marketing Block Attachments"
            SentToMemberOf            = "LegalTeam@$TenantId"
            Ensure                    = "Present"
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
        }
    }
}
