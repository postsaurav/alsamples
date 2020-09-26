pageextension 50000 "SDH Customer card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("SDH Demo Text"; "SDH Demo Text")
            {
                ApplicationArea = All;
                ToolTip = 'Specify Demo Text Value';
            }
        }
    }
}