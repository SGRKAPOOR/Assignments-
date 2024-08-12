CREATE PROCEDURE sp_DonationStatsByLocationAndMonth
    @City VARCHAR(50),
    @Month INT,
    @Year INT
AS
BEGIN
    SELECT 
        a.postal_code,
        a.city,
        AVG(d.donation_amount) AS AverageDonation,
        SUM(d.donation_amount) AS TotalDonation
    FROM Donation d
    JOIN Address a ON d.address_id = a.address_id
    WHERE 
        a.city = @City AND
        MONTH(d.donation_date) = @Month AND
        YEAR(d.donation_date) = @Year
    GROUP BY a.postal_code, a.city
    ORDER BY a.postal_code;
END

EXEC sp_DonationStatsByLocationAndMonth @City = 'Toronto', @Month = 7, @Year = 2024