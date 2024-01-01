-- 1. Retrieve all information about the company named "Oracle Financial Services Software Ltd."

-- 2. Find all companies in the "SOFTWARE & SERVICES" sector.

-- 3. Count the number of companies in the "BANKING AND FINANCE" industry in the database.

-- 4. Retrieve the names of companies and net profits for companies in the "OIL & GAS" sector for the last quarter.

-- 5. Find the company with the highest net profit in the last quarter.

-- 6. Calculate the average value of Earnings Per Share (EPS) for all companies in the "PHARMACEUTICALS & BIOTECHNOLOGY" sector.

-- 7. Identify companies with a net profit exceeding 25000 in the last quarter.

-- 8. Find the company with the highest operating profit in the "BANKING AND FINANCE" sector.

-- 9. Select companies from "AUTOMOBILES & AUTO COMPONENTS" sector and paid over 100 in "tax"

-- 10. Calculate the average value of Operating Profit Margin for all companies in the "CEMENT AND CONSTRUCTION" sector.


-- A1
SELECT * FROM nifty
WHERE name = 'Oracle Financial Services Software Ltd.';

-- A2
SELECT * FROM nifty
WHERE sector = 'SOFTWARE & SERVICES';

-- A3
SELECT COUNT(*) AS NumberOfCompanies FROM nifty 
WHERE sector = 'BANKING AND FINANCE';

-- A4
SELECT name, net_profit FROM nifty
WHERE sector = 'OIL & GAS';

-- A5
SELECT name, net_profit as Highest_Net_Profit FROM nifty
WHERE net_profit > 0
ORDER BY net_profit DESC
LIMIT 1;

-- A6
SELECT ROUND(AVG(CAST(eps AS DECIMAL(10,2))), 2) AS AVG_EPS_VALUE
FROM nifty
WHERE sector = 'PHARMACEUTICALS & BIOTECHNOLOGY';

-- A7
SELECT name, net_profit FROM nifty
WHERE net_profit > 25000;

-- A8
SELECT name, operating_profit FROM nifty 
WHERE sector = 'BANKING AND FINANCE'
ORDER BY operating_profit DESC
LIMIT 1;

-- A9
SELECT * FROM nifty
WHERE sector = 'AUTOMOBILES & AUTO COMPONENTS'
AND tax > 100;

-- A10
SELECT
ROUND(
	AVG(
		CAST(
			(operating_expenses - operating_profit)
				AS DECIMAL(10,2)
			)
		),2
	) AS avg_opm, name FROM nifty
WHERE sector = 'CEMENT AND CONSTRUCTION'
GROUP BY name;