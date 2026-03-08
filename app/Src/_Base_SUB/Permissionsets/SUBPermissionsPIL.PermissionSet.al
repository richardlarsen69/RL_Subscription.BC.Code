permissionSet 61000 "SUB_Permissions_PIL"
{
    Access = Internal;
    Assignable = true;
    Caption = '!!! Put the name of your app here', Locked = true;
    Permissions =
        codeunit SUB_Install_PIL = X,
        codeunit SUB_SubscribersCodeunits_PIL = X,
        codeunit SUB_SubscribersPages_PIL = X,
        codeunit SUB_SubscribersReports_PIL = X,
        codeunit SUB_SubscribersTables_PIL = X,
        codeunit SUB_Upgrade_PIL = X;
}