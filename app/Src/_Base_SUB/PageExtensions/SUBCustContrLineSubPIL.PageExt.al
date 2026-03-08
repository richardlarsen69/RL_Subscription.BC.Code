pageextension 61000 SUB_CustContrLineSub_PIL extends "Customer Contract Line Subp."
{
    layout
    {
        addbefore("Contract Line Type")
        {
            field(SUB_CustomerNo_PIL; Rec.SUB_CustomerNo_PIL)
            {
                ApplicationArea = All;
            }
            field(SUB_SubscriptionItemNo_PIL; Rec.SUB_SubscriptionItemNo_PIL)
            {
                ApplicationArea = All;
            }
            field(SUB_InvoiceNo_PIL; Rec.SUB_InvoiceNo_PIL)
            {
                ApplicationArea = All;
            }
        }
    }
}
