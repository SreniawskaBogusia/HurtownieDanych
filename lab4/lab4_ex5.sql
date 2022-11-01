CREATE TABLE [DIMDate] (
	[date_key] int,
	[date] date,
	[quarter] int,
	[year] int,
	[month] int,
	[week] int
)

DECLARE @StartDate  date = '20150101';

DECLARE @CutoffDate date = DATEADD(DAY, -1, DATEADD(YEAR, 10, @StartDate));

;WITH seq(n) AS 
(
  SELECT 0 UNION ALL SELECT n + 1 FROM seq
  WHERE n < DATEDIFF(DAY, @StartDate, @CutoffDate)
),
d(d) AS 
(
  SELECT DATEADD(DAY, n, @StartDate) FROM seq
),
src AS	
(
  SELECT
    TheDate         = CONVERT(date, d),
    TheDay          = DATEPART(DAY,       d),
    TheWeek         = DATEPART(WEEK,      d),
    TheMonth        = DATEPART(MONTH,     d),
    TheQuarter      = DATEPART(Quarter,   d),
    TheYear         = DATEPART(YEAR,      d)
  FROM d
)
SELECT * FROM src
  ORDER BY TheDate
  OPTION (MAXRECURSION 0);