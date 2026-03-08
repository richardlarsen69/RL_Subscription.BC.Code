tableextension 61000 SUB_CustSubContrLine_PIL extends "Cust. Sub. Contract Line"
{
    fields
    {
        field(61000; SUB_CustomerNo_PIL; Code[20])
        {
            Caption = 'Customer No';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(61001; SUB_SubscriptionItemNo_PIL; Code[20])
        {
            Caption = 'Subscription Item No';
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(61002; SUB_InvoiceNo_PIL; Code[20])
        {
            Caption = 'Invoice No.';
            DataClassification = ToBeClassified;
        }
    }
}
