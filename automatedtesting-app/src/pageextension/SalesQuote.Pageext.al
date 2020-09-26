pageextension 50001 "SDH Sales quote" extends "Sales Quote"
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