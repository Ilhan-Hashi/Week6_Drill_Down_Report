USE AP;
GO

CREATE PROCEDURE uspGetInvoiceByVendor
	@VendorID INT = NULL
AS
BEGIN 
	IF @VendorID IS NULL 
	BEGIN 
		SELECT
			v.VendorID,
			v.VendorName,
			i.InvoiceID,
			i.InvoiceNumber,
			i.InvoiceDate,
			i.InvoiceTotal,
			i.InvoiceDueDate,
			i.PaymentDate,
			i.PaymentTotal,
			i.CreditTotal
		FROM Invoices i 
		JOIN Vendors v ON i.VendorID = v.VendorID 
	END
	ELSE 
	BEGIN 
		SELECT
			v.VendorID,
			v.VendorName,
			i.InvoiceID,
			i.InvoiceNumber,
			i.InvoiceDate,
			i.InvoiceTotal,
			i.InvoiceDueDate,
			i.PaymentDate,
			i.PaymentTotal,
			i.CreditTotal
		FROM Invoices i 
		JOIN Vendors v ON i.VendorID = v.VendorID 
		WHERE v.VendorID = @VendorID
		END
END;
GO

