codeunit 55000 "APP_Install_PIL"
{
    Subtype = Install;
    Access = Internal;
    
    trigger OnInstallAppPerCompany();
    var
        Module: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(Module);

        HandleInstall_PerCompany(Module);
        if Module.DataVersion() = Version.Create(0, 0, 0, 0) then // A 'DataVersion' of 0.0.0.0 indicates a 'fresh/new' install
            HandleFreshInstall_PerCompany(Module)
        else
            HandleReinstall_PerCompany(Module);
    end;

    trigger OnInstallAppPerDatabase()
    var
        Module: ModuleInfo;
    begin
        // Get information about the current module.
        NavApp.GetCurrentModuleInfo(Module);

        HandleInstall_PerDatabase(Module);
        if Module.DataVersion() = Version.Create(0, 0, 0, 0) then // A 'DataVersion' of 0.0.0.0 indicates a 'fresh/new' install
            HandleFreshInstall_PerDatabase(Module)
        else
            HandleReinstall_PerDatabase(Module);
    end;

    local procedure HandleInstall_PerCompany(Module: ModuleInfo)
    // Run for every install - both fresh install and reinstall.
    begin
        Module := Module; // Dummy code to remove unused-warning.
    end;

    local procedure HandleFreshInstall_PerCompany(Module: ModuleInfo)
    begin
        Module := Module; // Dummy code to remove unused-warning.
    end;

    local procedure HandleReinstall_PerCompany(Module: ModuleInfo)
    begin
        Module := Module; // Dummy code to remove unused-warning.
    end;

    local procedure HandleInstall_PerDatabase(Module: ModuleInfo)
    // Run for every install - both fresh install and reinstall.
    begin
        Module := Module; // Dummy code to remove unused-warning.
    end;

    local procedure HandleFreshInstall_PerDatabase(Module: ModuleInfo)
    begin
        Module := Module; // Dummy code to remove unused-warning.
    end;

    local procedure HandleReinstall_PerDatabase(Module: ModuleInfo)
    begin
        Module := Module; // Dummy code to remove unused-warning.
    end;
}