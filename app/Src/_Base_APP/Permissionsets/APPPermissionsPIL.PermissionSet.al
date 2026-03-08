permissionSet 55000 "APP_Permissions_PIL"
{
    Access = Internal;
    Assignable = true;
    Caption = '!!! Put the name of your app here', Locked = true;
    Permissions =
        codeunit APP_Install_PIL = X,
        codeunit APP_SubscribersCodeunits_PIL = X,
        codeunit APP_SubscribersPages_PIL = X,
        codeunit APP_SubscribersReports_PIL = X,
        codeunit APP_SubscribersTables_PIL = X,
        codeunit APP_Upgrade_PIL = X;
}