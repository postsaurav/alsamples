tableextension 50000 "SDH Customer" extends Customer
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