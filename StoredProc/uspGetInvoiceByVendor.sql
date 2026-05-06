USE [AP]
GO
/****** Object:  StoredProcedure [dbo].[uspGetInvoiceByVendor]    Script Date: 5/5/2026 10:17:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[uspGetInvoiceByVendor]
	@VendorID INT = NULL
AS
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
	WHERE @VendorID IS NULL OR v.VendorID = @VendorID

END;
