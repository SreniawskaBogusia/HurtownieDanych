
create view carrier_view with schemabinding as
select 
dc.[carrier_name],
dc.[address],
dc.[contact_person],
fc.[carrier_id]
from [dbo].[FactCarrier] fc
join [dbo].[DIMCarrier] dc on fc.carrier_key = dc.carrier_key

SELECT TOP (1000) [carrier_name]
      ,[address]
      ,[contact_person]
      ,[carrier_id]
  FROM [lab5_prod].[dbo].[carrier_view]


  create unique clustered index ix_carrier_view on [dbo].[carrier_view] ( [carrier_name],
[address],
[contact_person],
[carrier_id] )