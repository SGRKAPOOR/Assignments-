CREATE PROCEDURE sp_DonationsByPaymentMethodInTopCity
    @PaymentMethod VARCHAR(20)
AS
BEGIN
    DECLARE @TopCity VARCHAR(50);

    -- Find the city with the highest total donations
    SELECT TOP 1 @TopCity = a.city
    FROM Donation d
    JOIN Address a ON d.address_id = a.address_id
    GROUP BY a.city
    ORDER BY SUM(d.donation_amount) DESC;

    -- Get donations by payment method for the top city
    SELECT 
        a.city,
        d.payment_method,
        SUM(d.donation_amount) AS TotalDonation
    FROM Donation d
    JOIN Address a ON d.address_id = a.address_id
    WHERE 
        a.city = @TopCity AND
        d.payment_method = @PaymentMethod
    GROUP BY a.city, d.payment_method;
END

EXEC sp_DonationsByPaymentMethodInTopCity @PaymentMethod = 'Cash'