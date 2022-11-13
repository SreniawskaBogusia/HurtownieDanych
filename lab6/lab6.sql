--ex1
with ex1 as (select sum(SalesAmount) as sumSalesAmount, OrderDate 
			from FactInternetSales 
			group by OrderDate )

select avg(sumSalesAmount) over (order by OrderDate rows between 3 preceding and current row) 
from ex1 
order by OrderDate

--ex2
select OrderMonth as month_of_year , isnull([0], 0) as [0], isnull([1], 0) as [1],isnull([2], 0) as [2],
	isnull([3], 0) as [3], isnull([4], 0) as [4], isnull([5], 0) as [5],isnull([6], 0) as [6],isnull([7], 0) as [7],
	isnull([8], 0) as [8], isnull([9], 0) as [9], isnull([10], 0) as [10]
from (select SalesTerritoryKey, month(OrderDate) as OrderMonth, sum(SalesAmount) as sumSalesAmount
from  FactInternetSales
where year(OrderDate) = 2011
group by month(OrderDate),SalesTerritoryKey
) as FactInternetSource  
PIVOT  
(sum(sumSalesAmount)  
 for SalesTerritoryKey IN ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]) 
) as PivotTable;

--ex3
select OrganizationKey, DepartmentGroupKey, sum(Amount) 
from FactFinance 
group by rollup(OrganizationKey, DepartmentGroupKey) 
order by OrganizationKey

--ex4
select OrganizationKey, DepartmentGroupKey, sum(Amount) 
from FactFinance 
group by cube(OrganizationKey, DepartmentGroupKey) 
order by OrganizationKey

--ex5
with ex5 as (select OrganizationKey, sum(Amount) as sumAmount 
			from FactFinance 
			where year(Date) = 2012 
			group by OrganizationKey )

select ex5.OrganizationKey, OrganizationName, sumAmount, percent_rank() over (order by sumAmount) as percentile 
from ex5 
join DimOrganization on DimOrganization.OrganizationKey = ex5.OrganizationKey 
order by ex5.OrganizationKey

 --ex6
with ex6 as (select OrganizationKey, sum(Amount) as sumAmount 
			from FactFinance 
			where year(Date) = 2012 
			group by OrganizationKey )

select ex6.OrganizationKey, OrganizationName, sumAmount, percent_rank() over (order by sumAmount) as percentile, STDEV(sumAmount) over (order by sumAmount) as std
from ex6 
join DimOrganization on DimOrganization.OrganizationKey = ex6.OrganizationKey 
order by ex6.OrganizationKey