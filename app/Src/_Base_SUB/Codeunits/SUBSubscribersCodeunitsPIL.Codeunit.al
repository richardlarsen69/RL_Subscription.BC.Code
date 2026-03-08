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
        SalesLine: Record "Sales Line";
        NewLine: Record "Sales Line";
        Amount: Decimal;
        LineNo: Integer;
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                Amount += SalesLine."Line Amount";
                if SalesLine.Amount <> 0 then
                    NewLine := SalesLine;
                LineNo := SalesLine."Line No.";
            until SalesLine.Next() = 0;
        If NewLine.Amount <> 0 then begin
            NewLine."Line No." := LineNo + 10000;
            NewLine.Type := NewLine.type::"G/L Account";
            NewLine."No." := '1502';
            NewLine.validate(Quantity, -1);
            NewLine.validate("Unit Price", Amount);
            NewLine.Insert();
        end;
    end;
}