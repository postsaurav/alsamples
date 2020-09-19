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
            action(ImportBlobFile)
            {
                ApplicationArea = All;
                Image = Import;
                ToolTip = 'Import a File into Blob Field.';

                trigger OnAction()
                var
                    FilePath: Text;
                    InFileStream: InStream;
                begin
                    If UploadIntoStream(SelectFileTextLbl, '', '', FilePath, InFileStream) then
                        SaveAttachmentIntoBlobFromStream(InFileStream, FilePath);
                end;
            }

            action(ExportBlobFile)
            {
                ApplicationArea = All;
                Image = Export;
                ToolTip = 'Exports a File from Blob Field.';

                trigger OnAction()
                begin
                    DownloadFromBlob();
                end;
            }
        }
    }
    var
        SelectFileTextLbl: Label 'Select File..';
}