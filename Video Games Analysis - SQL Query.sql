use Video_Games_Sales


--- 1 - Creating general table of the top 10% of games by their global sales


select sales.Game_ID,sales.Name,plt.Platform,Year_of_Release, Genre,Publisher,Developer,NA_Sales,EU_Sales,
JP_Sales,Other_Sales,Global_Sales
from Fact_Sales_2$ as sales inner join Dim_Platform$ as plt
on plt.[Platform ID]=sales.Platform_ID inner join Dim_Developer$ as dev
on dev.[Developer/s_ID]=sales.[Developer/s_ID] inner join ['Dim_Publisher - Excel$'] as pub
on pub.Publisher_ID=sales.Publisher_ID inner join Dim_Genre$ as gen
on gen.[Genre ID]=sales.Genre_ID
where sales.Global_Sales*1000000 > (select distinct PERCENTILE_CONT(0.9) within group (order by Global_Sales) over (partition by null)*1000000
from dbo.[Fact_Sales_2$] as sales inner join Dim_Genre$ as Genre
on sales.Genre_ID=genre.[Genre ID])



/*
2 - Creating table that shows by year of release,platform and genre the number of games in top 10% by total sales and percent of games in top 10%
by total sales
*/


select q3.Year_of_Release,q3.Platform,Q3.[Platform ID], q3.Genre,Q4.[No. Of Games],Q3.[NO. Of Games In Top 10% Of Sales],
(Q3.[NO. Of Games In Top 10% Of Sales]*100/Q4.[No. Of Games]) as "% Of Platform's Games In Top 10%"
from
(select gen.Genre,sales.Year_of_Release,plat.[Platform ID],plat.Platform,count(*)  as 'NO. Of Games In Top 10% Of Sales'
from Fact_Sales_2$ as sales inner join  Dim_Platform$ as plat 
on plat.[Platform ID]=sales.Platform_ID 
inner join Dim_Genre$ as gen
on gen.[Genre ID]=sales.Genre_ID
where Year_of_Release between 2000 and 2016 and sales.Global_Sales*1000000 > 
(select distinct PERCENTILE_CONT(0.9) within group (order by Global_Sales) over (partition by null)*1000000
from dbo.[Fact_Sales_2$] as sales inner join Dim_Platform$ as plat
on sales.Platform_ID=plat.[Platform ID])
group by gen.Genre,sales.Year_of_Release,plat.[Platform ID],PLAT.Platform) 
as Q3
inner join
(select gen.Genre,sales.Year_of_Release,plat.[Platform ID],plat.Platform,count(*) as 'No. Of Games'
from Fact_Sales_2$ as sales inner join  Dim_Platform$ as plat
on plat.[Platform ID]=sales.Platform_ID
inner join Dim_Genre$ as gen
on gen.[Genre ID]=sales.Genre_ID
where Year_of_Release between 2000 and 2016
group by gen.Genre,sales.Year_of_Release,plat.[Platform ID],plat.Platform
) as Q4
on Q3.[Platform ID]=Q4.[Platform ID] and Q3.platform=Q4.Platform and q3.Genre=q4.Genre and q3.Year_of_Release=q4.Year_of_Release
order by Year_of_Release,Platform,Genre,"% Of Platform's Games In Top 10%" desc
