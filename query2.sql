USE PetRescueCharity;
GO
CREATE PROCEDURE sp_DonationStatsByDate
AS
BEGIN
    SELECT 
        CAST(donation_date AS DATE) AS DonationDay,
        AVG(donation_amount) AS AverageDonation,
        SUM(donation_amount) AS TotalDonation
    FROM Donation
    GROUP BY CAST(donation_date AS DATE)
    ORDER BY DonationDay;

    SELECT 
        DATEADD(MONTH, DATEDIFF(MONTH, 0, donation_date), 0) AS DonationMonth,
        AVG(donation_amount) AS AverageDonation,
        SUM(donation_amount) AS TotalDonation
    FROM Donation
    GROUP BY DATEADD(MONTH, DATEDIFF(MONTH, 0, donation_date), 0)
    ORDER BY DonationMonth;

    SELECT 
        YEAR(donation_date) AS DonationYear,
        AVG(donation_amount) AS AverageDonation,
        SUM(donation_amount) AS TotalDonation
    FROM Donation
    GROUP BY YEAR(donation_date)
    ORDER BY DonationYear;
END

EXEC sp_DonationStatsByDate