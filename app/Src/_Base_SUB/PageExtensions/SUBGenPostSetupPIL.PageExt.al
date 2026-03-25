pageextension 61001 SUB_GenPostSetup_PIL extends "General Posting Setup"
{
    layout
    {
        addlast(Control1)
        {
            field(SUB_SubscrOffsetAccount_PIL; Rec.SUB_SubscrOffsetAccount_PIL)
            {
                ApplicationArea = All;
            }
        }
    }
}
