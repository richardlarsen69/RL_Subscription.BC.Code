codeunit 61000 "SUB_SubscribersCodeunits_PIL"
{
    // Place event subscribers for codeunits in this codeunit.
    // Recommendations:
    // - Group events for objects, functional areas etc. using regions.
    // - Use one-line event procedures if possible, calling additional code in other objects.

    #region MethodName
    // Group events using region
    #endregion MethodName

    Access = Internal; // Contains subscribers only. No public access. 


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Billing Documents", 'OnBeforeTestPreviousDocumentTotalInvoiceAmount', '', true, true)]
    local procedure CreateBillingDoc_OnBeforeTestPreviousDocumentTotalInvoiceAmount(SalesHeader: Record "Sales Header")
    var
        SubscriptionMngmnt: Codeunit SUB_SubscriptionMngmnt_PIL;

    begin
        SubscriptionMngmnt.CheckToOffsetSubscription(SalesHeader);
    end;
}