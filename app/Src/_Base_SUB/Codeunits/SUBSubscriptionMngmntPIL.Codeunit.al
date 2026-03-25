codeunit 61006 SUB_SubscriptionMngmnt_PIL
{

    procedure CheckToOffsetSubscription(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        NewLine: Record "Sales Line";
        Amount: Decimal;
        LineNo: Integer;
        OffsettingGLAccount: Code[20];
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                if SalesLine.Amount <> 0 then begin
                    OffsettingGLAccount := GetSubscrOffsettingAccount(SalesLine);
                    if OffsettingGLAccount <> '' then
                        if OffsettingAmounts.ContainsKey(OffsettingGLAccount) then begin
                            Amount := OffsettingAmounts.Get(OffsettingGLAccount);
                            Amount += SalesLine.Amount;
                            OffsettingAmounts.Set(OffsettingGLAccount, Amount);
                        end else
                            OffsettingAmounts.Add(OffsettingGLAccount, SalesLine.Amount);
                    NewLine := SalesLine;
                end;
            until SalesLine.Next() = 0;
        if SalesLine.FindLast() then
            LineNo := SalesLine."Line No." + 10000;

        foreach OffsettingGLAccount in OffsettingAmounts.Keys do begin
            Amount := OffsettingAmounts.Get(OffsettingGLAccount);
            NewLine."Line No." := LineNo;
            LineNo += 10000;
            NewLine.Type := NewLine.type::"G/L Account";
            NewLine.validate("No.", OffsettingGLAccount);
            NewLine.validate(Quantity, -1);
            NewLine.validate("Unit Price", Amount);
            NewLine.Insert();
        end;
    end;

    procedure GetSubscrOffsettingAccount(SalesLine: Record "Sales Line"): Code[20];
    var
        GenPostingSetup: Record "General Posting Setup";
    begin
        if GenPostingSetup.Get(SalesLine."Gen. Bus. Posting Group", SalesLine."Gen. Prod. Posting Group") then
            exit(GenPostingSetup.SUB_SubscrOffsetAccount_PIL);
    end;

    var
        OffsettingAmounts: Dictionary of [Code[20], Decimal];

}
