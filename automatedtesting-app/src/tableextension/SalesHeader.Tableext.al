tableextension 50001 "SDH Sales Header" extends "Sales Header"
{
    fields
    {
        field(50000; "SDH Demo Text"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Demo Text';
        }
    }
}