tableextension 61001 SUB_GenPostingSetup_PIL extends "General Posting Setup"
{
    fields
    {
        field(61000; SUB_SubscrOffsetAccount_PIL; Code[20])
        {
            Caption = 'Subscription Offset Account', Comment = 'NOR="Utligningskonto for abonnement"';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
    }
}
