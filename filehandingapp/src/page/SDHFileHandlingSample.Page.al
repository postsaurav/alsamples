page 50000 "SDH File Handling Sample"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Tasks;
    DelayedInsert = true;
    Editable = true;
    SourceTable = "SDH File Handling Sample";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Name; "File Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the filename of the attachment.';
                }
                field("File Extension"; "File Extension")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the file extension of the attachment.';
                }
                field("Attached By"; "Attached By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the User ID of document was attached.';
                }
                field("Attached Date"; "Attached Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the document was attached.';
                }
            }
        }
        area(factboxes)
        {
        }
    }
    actions
    {
        area(Processing)
        {
        }
    }
}