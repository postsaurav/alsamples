pageextension 50002 "SDH Sales order" extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("SDH Demo Text"; Rec."SDH Demo Text")
            {
                ApplicationArea = All;
                ToolTip = 'Specify Demo Text Value';
            }
        }
    }
}