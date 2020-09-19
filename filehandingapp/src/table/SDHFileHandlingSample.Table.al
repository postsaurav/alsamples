table 50000 "SDH File Handling Sample"
{
    DataClassification = CustomerContent;
    Caption = 'File Handling Sample';

    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
            Caption = 'ID';
            Editable = false;
        }
        field(2; "File Name"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Attachment';
        }
        field(3; "File Extension"; Text[30])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'File Extension';
        }
        field(4; "Attached By"; Code[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Attached By';
        }
        field(5; "Attached Date"; DateTime)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Attached Date';
        }
        field(6; "Media Storage"; Media)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Media';
        }
        field(7; "Blob Storage"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Blob';
        }
    }

    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        Validate("Attached By", UserId);
        Validate("Attached Date", CurrentDateTime);
    end;

    procedure SaveAttachmentIntoBlobFromStream(DocStream: InStream; FileName: Text)
    var
        Filemgmt: Codeunit "File Management";
        OStream: OutStream;
    begin
        Validate("File Extension", Filemgmt.GetExtension(FileName));
        Validate("File Name", CopyStr(Filemgmt.GetFileNameWithoutExtension(FileName), 1, MaxStrLen("File Name")));
        Rec."Blob Storage".CreateOutStream(OStream);
        CopyStream(OStream, DocStream);
        Insert(true);
    end;

    procedure DownloadFromBlob()
    var
        IStream: InStream;
        ExportFileName: Text;
    begin
        ExportFileName := Rec."File Name" + '.' + Rec."File Extension";
        Rec.CalcFields("Blob Storage");
        If Not "Blob Storage".HasValue then
            exit;
        Rec."Blob Storage".CreateInStream(IStream);
        DownloadFromStream(IStream, '', '', '', ExportFileName);
    end;
}