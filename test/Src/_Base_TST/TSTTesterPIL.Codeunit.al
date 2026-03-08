codeunit 97400 "TST_Tester_PIL"
{
    Subtype = Test;
    TestPermissions = Disabled;
    #region Region1
    [Test]
    procedure CheckMandatoryHeaderFieldsInvalidStatus();
    var
    begin
        // [GIVEN] 1 equals 1

        // [WHEN] running this test
        if 1 = 1 then;

        // [THEN] don't do any error

    end;

    #endregion Region1
    var
    // Assert: Codeunit Assert;
}