tableextension 50200 "BSCL Book" extends "BSB Book"
{
    fields
    {
        field(50200; "BSCL No. of Customer Likes"; Integer)
        {
            Caption = 'No. of Customer Likes';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Count(Customer where("BSB Favorite Book No." = field("No.")));
        }
    }
}