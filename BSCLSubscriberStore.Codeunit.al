codeunit 50200 "BSCL Subscriber Store"
{
    var
        OnBeforeDelteBookErr: Label 'You are not allowed to delete %1 %2 because it is liked by one or more customer';

    // [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'BSB Favorite Book No.', true, true)]
    // local procedure CustOnAfterValidateBSBFavBookNo(var Rec: Record Customer; var xRec: Record Customer)
    // begin
    //     if Rec."BSB Favorite Book No." <> xRec."BSB Favorite Book No." then
    //         Rec.Modify()
    // end;

    [EventSubscriber(ObjectType::Table, Database::"BSB Book", 'OnBeforeDelete', '', false, false)]
    local procedure OnBeforeDelete(Rec: Record "BSB Book"; var Handled: Boolean);
    var
        Customer: Record Customer;
    begin
        if Handled then
            exit;

        Customer.SetCurrentKey("BSB Favorite Book No.");
        Customer.SetRange("BSB Favorite Book No.", Rec."No.");
        if not Customer.IsEmpty then
            Error(OnBeforeDelteBookErr, Rec.TableCaption, Rec."No.");
        Handled := true;
    end;

}