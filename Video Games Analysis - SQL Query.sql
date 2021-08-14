use Video_Games_Sales


--- 1 - Creating table with the number of games by genre, maximum sales per game, average sales, and percentiles of sales. 


select distinct genre.genre as 'Genre' ,count(*) over (partition by genre.genre) as 'Number of Games'
,round(avg(sales.Global_Sales) over(partition by Genre.genre)*1000000,0) as 'AVG Sales'
,round(PERCENTILE_CONT(0.25) within group (order by Global_Sales) over (partition by genre.genre)*1000000,0) 
as 'Sales - 25thPerc',  round(PERCENTILE_CONT(0.5) within group (order by Global_Sales) over (partition by genre.genre)*1000000,0) 
as 'Median', round(PERCENTILE_CONT(0.75) within group (order by Global_Sales) over (partition by genre.genre)*1000000,0)
as 'Sales - 75thPerc',
round(PERCENTILE_CONT(0.9) within group (order by Global_Sales) over (partition by genre.genre)*1000000,0) 
as 'Sales - 90thPerc'
,round(max(Global_Sales) over (partition by genre.genre)*1000000,0)  as 'Max Sales'
from dbo.[Fact_Sales_2$] as sales inner join Dim_Genre$ as Genre
on genre.[Genre ID]=sales.Genre_ID
order by genre.Genre ;


--- 2 - Creating general table of the top 10% of games by their global sales


select sales.Game_ID,sales.Name,plt.Platform,Year_of_Release, Genre,Publisher,Developer,NA_Sales,EU_Sales,
JP_Sales,Other_Sales,Global_Sales
from Fact_Sales_2$ as sales inner join Dim_Platform$ as plt
on plt.[Platform ID]=sales.Platform_ID inner join Dim_Developer$ as dev
on dev.[Developer/s_ID]=sales.[Developer/s_ID] inner join ['Dim_Publisher - Excel$'] as pub
on pub.Publisher_ID=sales.Publisher_ID inner join Dim_Genre$ as gen
on gen.[Genre ID]=sales.Genre_ID
where sales.Global_Sales*1000000 > (select distinct PERCENTILE_CONT(0.9) within group (order by Global_Sales) over (partition by null)*1000000
from dbo.[Fact_Sales_2$] as sales inner join Dim_Genre$ as Genre
on sales.Genre_ID=genre.[Genre ID]) ;


/*
3 - Creating table that shows by genre the number of games in top 10% by total sales and percent of games by genre in top 10%
by total sales, and the total number of games by genre
*/

select Q1.[Genre ID],q1.Genre,Q2.[No. Of Games],q1.[NO. Of Games In Top 10% Of Sales],
(q1.[NO. Of Games In Top 10% Of Sales]*100/q2.[No. Of Games]) as '% Of Genre Games In Top 10%'
from
(select gen.[Genre ID],gen.Genre,count(*) as 'NO. Of Games In Top 10% Of Sales'
from Fact_Sales_2$ as sales inner join  Dim_Genre$ as gen
on gen.[Genre ID]=sales.Genre_ID
where Year_of_Release between 2000 and 2016 and sales.Global_Sales*1000000 > (select distinct PERCENTILE_CONT(0.9) within group (order by Global_Sales) over (partition by null)*1000000
from dbo.[Fact_Sales_2$] as sales inner join Dim_Genre$ as Genre
on sales.Genre_ID=genre.[Genre ID])
group by gen.[Genre ID],gen.Genre
) as Q1
inner join
(select gen.[Genre ID],gen.Genre,count(*) as 'No. Of Games'
from Fact_Sales_2$ as sales inner join  Dim_Genre$ as gen
on gen.[Genre ID]=sales.Genre_ID
where Year_of_Release between 2000 and 2016
group by gen.[Genre ID],gen.Genre
) as Q2
on Q1.[Genre ID]=Q2.[Genre ID] and Q1.Genre=Q2.Genre
order by '% Of Genre Games In Top 10%' desc ;

/*
5 - Creating table that shows by platform the number of games in top 10% by total sales and percent of games by genre in top 10%
by total sales, and the total number of games by genre
*/

select Q3.[Platform ID],q3.Platform,Q4.[No. Of Games],Q3.[NO. Of Games In Top 10% Of Sales],
(Q3.[NO. Of Games In Top 10% Of Sales]*100/Q4.[No. Of Games]) as "% Of Platform's Games In Top 10%"
from
(select plat.[Platform ID],plat.Platform,count(*) as 'NO. Of Games In Top 10% Of Sales'
from Fact_Sales_2$ as sales inner join  Dim_Platform$ as plat
on plat.[Platform ID]=sales.Platform_ID
where Year_of_Release between 2000 and 2016 and sales.Global_Sales*1000000 > 
(select distinct PERCENTILE_CONT(0.9) within group (order by Global_Sales) over (partition by null)*1000000
from dbo.[Fact_Sales_2$] as sales inner join Dim_Platform$ as plat
on sales.Platform_ID=plat.[Platform ID])
group by plat.[Platform ID],PLAT.Platform) 
as Q3
inner join
(select plat.[Platform ID],plat.Platform,count(*) as 'No. Of Games'
from Fact_Sales_2$ as sales inner join  Dim_Platform$ as plat
on plat.[Platform ID]=sales.Platform_ID
where Year_of_Release between 2000 and 2016
group by plat.[Platform ID],plat.Platform
Having count(*)>100
) as Q4
on Q3.[Platform ID]=Q4.[Platform ID] and Q3.platform=Q4.Platform
order by "% Of Platform's Games In Top 10%" desc ;

END
