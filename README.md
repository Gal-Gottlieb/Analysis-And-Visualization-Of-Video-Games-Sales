# Analysis-And-Visualization-Of-Video-Games-Sales
An Analysis and visualization of video game sales data between 2000 and 2016 using Python, SQL, and Power BI.

Data for this analysis is taken from a CSV file named Video_Games_Sales_as_at_22_Dec_2016.csv in the following Kaggle profile:
https://www.kaggle.com/rush4ratio/video-game-sales-with-ratings

* The CSV file is in the repository.

Here is a link to the Power BI public visualization:
https://app.powerbi.com/groups/me/reports/d4239a35-2cef-40f3-8fce-a878541f364d/ReportSectione823e96e8e1f731b321a

* Note that you need a Power BI account to view it. A screenshot of the visualization is in the repository.


Data columns description:

1. 	Rank - Ranking of overall sales
2.	 Name - The games name
3.	 Platform - Platform of the games release (i.e., PC,PS4, etc.)
4.	 Year - Year of the game's release
5.	 Genre - Genre of the game
6.	 Publisher - Publisher of the game
7.	 NA_Sales - Sales in North America (in millions)
8.	 EU_Sales - Sales in Europe (in millions)
9.	 JP_Sales - Sales in Japan (in millions)
10. Other_Sales - Sales in the rest of the world (in millions)
11. Global_Sales - Total worldwide sales.
12. Critic_score - Aggregate score compiled by Metacritic staff
13. Critic_count - The number of critics users.
14. User_score - Score by Metacritic's subscribers
15. User_count - Number of users who gave a score to the game.
16. Developer - Party responsible for creating the game.
17. Rating - The ESRB ratings – Entertainment SOFTWARE RATING BOARD.




Video games are an industry that has grown quickly in recent years and is expected to grow rapidly in the coming years, partly due to the COVID-19 and its short and long-term effects that contribute to its growth.

The project goal is to help James, VP of Product Management at a technology company that plans to expand to the video games market. He aims to gain a comprehensive understanding of the video games market and areas he should focus on to determine whether or not to enter the market.

* Mikes' persona profile is included in a PowerPoint file in the repository.

During the project preparation, the following tools were used:

1- Python:

* Was used first for data exploration, then for cleaning and preparing the data, then for feature engineering, and finally, for data exploration and analysis.
*The data was exported to a new Excel file called "video games edited with Python".
* Uploaded a file containing the Python script to the repository.
   
2- Microsoft SQL Management Server (MSMS):

* Used for developing more detailed tables outside the existing ones using queries.
* Uploaded a file containing the SQL script to the repository.


3- Power Query:

* Used to manipulate data by splitting the existing table into several tables - one fact table and the others dim tables.
* Used for preparing the tables for the Power BI visualization.

4- Power BI:

* Used first to create a Data Warehouse (DWH).
* Used to generate the visualization - based on existing fields and new measures.




Methodology:

* Due to a lack of information regarding video games released after 2016, as well as the fact that video games released before 2000 may be less relevant to today's industry, the analysis only applies to video games released between 2000 and 2016.
* In order to avoid conclusions based on a small sample, figure 4 includes just platforms with over 100 games.




Notes:

* There is a definite drop off in the number of games released after the year 2009, perhaps due to lagged data back in the time when the data set was created, and less likely, due   to the more expensive budget needed for a game with the rise of the PlayStation 4.




Missing data that would lead to a better analysis:

•	A game's price.

•	Game profits.

•	Release date - day and month.

•	Game budget.

•	The countries where  the game was released.

•	Languages supported by the game.

•	Full data on scores, rating, etc.

•	When was the critic score given.

•	The growth of sales and users over the years.





Insights and conclusions:

* Based on the available data, it is evident that the most successful genres are shooter, platform, role-playing, and sports, so it may be beneficial to consider making games in     these genres.
* Based on the number of games released in them in the previous years (to 2016), PS4 was rising with popularity.
* There is a very strong correlation between sales in different locations.
* It is likely that criticized games will sell more than those that weren't.
* Games that were rated are likely to have higher sales.
* Games for adults have the highest average total sales.

