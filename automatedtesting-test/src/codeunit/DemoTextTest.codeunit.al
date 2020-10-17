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

    [Test]
    procedure TestSalesOrderconversion()
    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
        SalesOrderNo: Code[20];
    begin
        //[GIVEN] A Sales Quote with Demo Text.
        LibrarySales.CreateCustomer(Customer);
        Customer."SDH Demo Text" := CopyStr(LibraryRandom.RandText(20), 1, MaxStrLen(Customer."SDH Demo Text"));
        Customer.Modify(true);
        LibrarySales.CreateSalesQuoteForCustomerNo(SalesHeader, Customer."No.");

        //[WHEN] A QUote is converted to order.
        SalesOrderNo := LibrarySales.QuoteMakeOrder(SalesHeader);

        //[THEN] Demo Text in Sales Order is Populated from Sales QUote.
        SalesHeader.Get(SalesHeader."Document Type"::Order, SalesOrderNo);
        Libraryassert.AreEqual(Customer."SDH Demo Text", SalesHeader."SDH Demo Text", 'Demo Text Invalid in Sales order.');
    end;

    [Test]
    procedure TestOpenSalesOrder()
    var
        SalesHeader: Record "Sales Header";
        RandomValue: Code[20];
        SalesOrderPage: TestPage "Sales Order";
    begin
        //[GIVEN] A Sales order with Demo Text.
        LibrarySales.CreateSalesOrder(SalesHeader);

        //[WHEN] A user updates Demo Text in Sales order Page.
        RandomValue := CopyStr(LibraryRandom.RandText(20), 1, MaxStrLen(RandomValue));
        SalesOrderPage.OpenEdit();
        Libraryassert.IsTrue(SalesOrderPage."SDH Demo Text".Editable(), 'Editable False');
        SalesOrderPage.GoToRecord(SalesHeader);
        SalesOrderPage."SDH Demo Text".SetValue(RandomValue);

        //[THEN] Demo Text value is updated in sales orders.
        Libraryassert.AreEqual(SalesOrderPage."SDH Demo Text".Value, RandomValue, 'Demo Text Values are diffrent.');
        SalesOrderPage.Close();
    end;

    [Test]
    procedure TestReleasedSalesOrder()
    var
        SalesHeader: Record "Sales Header";
        RandomValue: Code[20];
        SalesOrderPage: TestPage "Sales Order";
    begin
        //[GIVEN] A Sales order with Status Released.
        LibrarySales.CreateSalesOrder(SalesHeader);
        LibrarySales.ReleaseSalesDocument(SalesHeader);

        //[WHEN] A Demo Text Field is Updated in Page.
        RandomValue := CopyStr(LibraryRandom.RandText(20), 1, MaxStrLen(RandomValue));
        SalesOrderPage.OpenEdit();
        SalesOrderPage.GoToRecord(SalesHeader);
        asserterror SalesOrderPage."SDH Demo Text".SetValue(RandomValue);

        //[THEN] Demo Text value is not updated.
        Libraryassert.AreNotEqual(SalesOrderPage."SDH Demo Text".Value, RandomValue, 'Demo Text Values are Same.');
    end;

    var
        LibrarySales: Codeunit "Library - Sales";
        LibraryRandom: Codeunit "Library - Random";
        Libraryassert: Codeunit Assert;

}