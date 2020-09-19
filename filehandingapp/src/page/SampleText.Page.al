page 50001 "SDH Sample Text"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Sample Text';
    SourceTable = "SDH File Handling Sample";

    layout
    {
        area(Content)
        {
            field(TextValue; TextValue)
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Dispays the Text from Blob Field.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        TextValue := GetTextFromBlob();
    end;


    local procedure GetTextFromBlob() ReturnVal: Text;
    var
        IStream: InStream;
    begin
        CalcFields("Blob Storage");
        If not "Blob Storage".HasValue then
            exit('');
        "Blob Storage".CreateInStream(IStream);
        IStream.ReadText(ReturnVal);
    end;

    var
        TextValue: Text;
}