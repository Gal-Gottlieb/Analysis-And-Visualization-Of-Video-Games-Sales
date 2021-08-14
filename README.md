# Analysis-And-Visualization-Of-Video-Games-Sales
An Analysis and visualization of video game sales data between 2000 and 2016 using Python, SQL, and Power BI.

Data for this analysis is taken from a csv file named Video_Games_Sales_as_at_22_Dec_2016.csv in the following Kaggle profile:
https://www.kaggle.com/rush4ratio/video-game-sales-with-ratings

Data columns description:

1.	Rank - Ranking of overall sales
2.	Name - The games name
3.	Platform - Platform of the games release (i.e., PC,PS4, etc.)
4.	Year - Year of the game's release
5.	Genre - Genre of the game
6.	Publisher - Publisher of the game
7.	NA_Sales - Sales in North America (in millions)
8.	EU_Sales - Sales in Europe (in millions)
9.	JP_Sales - Sales in Japan (in millions)
10.	Other_Sales - Sales in the rest of the world (in millions)
11.	Global_Sales - Total worldwide sales.
12.	Critic_score - Aggregate score compiled by Metacritic staff
13.	Critic_count - The number of critics users.
14.	User_score - Score by Metacritic's subscribers
15.	User_count - Number of users who gave a score to the game.
16.	Developer - Party responsible for creating the game.
17.	Rating - The ESRB ratings – Entertainment SOFTWARE RATING BOARD.




Video games are an industry that has grown quickly in recent years and is expected to grow rapidly in the coming years, partly due to the COVID-19 and its short and long-term effects that contribute to its growth.

The project goal is to help James, VP of Product Management at a technology company that plans to expand to the video games market. He aims to gain a comprehensive understanding of the video games market and areas he should focus on to determine whether or not to enter the market.

James' persona profile is included in a Power Point file in the repository.

During the project preparation, the following tools were used:

1- Python:

* Was used first for data exploration, then for cleaning and preparing the data, then for feature engineering, and finally, for data exploration and analysis.
*The data was exported to a new Excel file called "video games edited with Python".
   
2- Microsoft SQL Management Server (MSMS):

Used for developing more detailed tables outside the existing ones using queries.

3- Power Query:

Used to manipulate data by splitting the existing table into several tables - one fact table and the others dim tables.
* Used for preparing the tables for the Power BI visualization.

4- Power BI:

* Used first to create a Data Warehouse (DWH).
* Used to generate the visualization - based on existing fields and new measures.




Methodology:

* The analysis is made only on video games that were released between the years 2000 - 2016 due to lack of information about games released after 2016, and because games that       released before 2000 are may be less relevant to today's industry.
* The table that figure 4 is based on including just platform with over 100 games, in order to avoid conclusion based on a small sample.




Notes:

* The number of games released by year is dropping after year 2009, it might be due to lagged data back in the time the data set was created, it can be also due to more expensive   budget requires to a game with the rising of the PS4 platform.



Important missing data:

•	The price of a game.
•	Profit from the game.
•	Time of release – day and month.
•	The budget of the game.
•	Countries were the games released.
•	The languages support the game.
•	Full data about scores, rating, etc..
•	When was the critic score given?
•	The grow of sales and users count over the years.





Insights and conclusions:

* The shooter genre is one of the leading ones with the higest percents of games in the top 10% of total sales and with the higest average sales.
* Based on the existing data it is clearly that the trend the most successful genres are shooter, platform, role playing and sports, so therefore will be good considering           producing games in these platforms.
* Games in the platforms genre are also in the top of higest percents of games in the top 10% of total sales and in the top higest average sales.
* In the last years (up to 2016) the rising platform in terms of number of games were released in them was PS4.
* There is a very strong correlation between the sales in different locations.
* Games that were criticized are likely to have higher sales.
* Games that were given rating are are likely to have higher sales.
* Games for adults are with the highest average total sales.

