codeunit 89000 "SDH Demo Text Test"
{
    Subtype = Test;

    [Test]
    procedure TestSalesQuoteCreation()
    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
    begin
        //[GIVEN] A customer with Demo Text.
        LibrarySales.CreateCustomer(Customer);
        Customer."SDH Demo Text" := CopyStr(LibraryRandom.RandText(20), 1, MaxStrLen(Customer."SDH Demo Text"));
        Customer.Modify(true);

        //[WHEN] A Sales quote is created.
        LibrarySales.CreateSalesQuoteForCustomerNo(SalesHeader, Customer."No.");

        //[THEN] Demo Text in Sales Quote is populated from customer.
        Libraryassert.AreEqual(Customer."SDH Demo Text", SalesHeader."SDH Demo Text", 'Demo Text Invalid in Sales Quote.');
    end;

    [Test]
    procedure TestSalesInvoiceCreation()
    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
    begin
        //[GIVEN] A customer with Demo Text.
        LibrarySales.CreateCustomer(Customer);
        Customer."SDH Demo Text" := CopyStr(LibraryRandom.RandText(20), 1, MaxStrLen(Customer."SDH Demo Text"));
        Customer.Modify(true);

        //[WHEN] A Sales Invoice is created.
        LibrarySales.CreateSalesInvoiceForCustomerNo(SalesHeader, Customer."No.");

        //[THEN] Demo Text in Sales Invoice is not populated from customer.
        Libraryassert.AreNotEqual(Customer."SDH Demo Text", SalesHeader."SDH Demo Text", 'Demo Text Invalid in Sales Invoice.');
    end;

    var
        LibrarySales: Codeunit "Library - Sales";
        LibraryRandom: Codeunit "Library - Random";
        Libraryassert: Codeunit Assert;
}