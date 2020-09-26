codeunit 50000 "SDH Table 36 Subscribers"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterCopySellToCustomerAddressFieldsFromCustomer', '', false, false)]
    local procedure CopyDemoText(var SalesHeader: Record "Sales Header"; SellToCustomer: Record Customer)
    begin
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Quote then
            SalesHeader.Validate("SDH Demo Text", SellToCustomer."SDH Demo Text");
    end;
}