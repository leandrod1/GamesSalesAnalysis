# Video Games Sales Data Analysis

## About

This project delves into the extensive Global Video Games Sales dataset, aiming to uncover insights into top-performing games, consoles, genres, sales trends, and customer behavior across various continents. By leveraging this dataset sourced from [Kaggle Global Video Game Sales](https://www.kaggle.com/datasets/thedevastator/global-video-game-sales), we seek to enhance your understanding of the gaming industry and identify trends that contribute to the success of game developers.

Through this dataset, we can analyze the interplay between platforms and genres for numerous video games on a global scale. Explore which platforms are driving sales worldwide, identify the most successful genres across different regions, and track how these dynamics have evolved over time.

## About Data

The dataset was obtained from the [Kaggle Global Video Game Sales](https://www.kaggle.com/datasets/thedevastator/global-video-game-sales). This dataset contains sales transactions from four different areas of the world. The data contains 12 columns and 16481 rows:

| Column                  | Description                              | Data Type      |
| :---------------------- | :--------------------------------------- | :------------- |
| ranking                 | Ranking of the game based on global sales| INT            |
| name_game               | Name of the game                         | VARCHAR(150)   |
| platform                | Platform the game was released on        | VARCHAR(5)     |
| year                    | Year the game was released               | YEAR           |
| genre                   | Genre of the game                        | VARCHAR(15)    |
| publisher               | Publisher of the game                    | VARCHAR(40)    |
| NA_Sales                | Sales of the game in North America       | DECIMAL(5, 2)  |
| EU_Sales                | Sales of the game in Europe              | DECIMAL(5, 2)  |
| JP_Sales                | Sales of the game in Japan               | DECIMAL(5, 2)  |
| Other_Sales             | Sales of the game in other regions       | DECIMAL(5, 2)  |
| Global_Sales            | Total sales of the game worldwide        | DECIMAL(5, 2)  |

## Questions To Answer

1. What are the top 100 best-selling games worldwide?
2. What are the top 100 best-selling games worldwide, aggregating sales across all consoles?
3. What are the top 10 best-selling games in North America, considering total sales across all platforms?
4. What are the top 10 best-selling games in Europe, encompassing sales from all consoles?
5. What are the top 10 best-selling games in Japan, considering total sales across all platforms?
6. What are the top 10 best-selling games in the rest of the world, without dividing sales by platform?

7. Which consoles have the most games sold globally?
8. Which consoles lead in game sales in North America?
9. Which consoles lead in game sales in Europe?
10. Which consoles lead in game sales in Japan?
11. Which consoles lead in game sales in the rest of the world?

12. What are the most popular game genres worldwide?
13. What are the most popular game genres in North America?
14. What genres lead in sales across Europe?
15. What genres are favored in Japan?
16. What are the most popular game genres in the rest of the world?

17. How many games were sold annually?

18. What are the top-selling games globally on each console?
19. What are the top 5 best-selling games on each console worldwide?

## Code

For the rest of the code, check the [game_project.sql](https://github.com/leandrod1/GamesSalesAnalysis/blob/main/game_project.sql) file

```sql
-- Create database
create database if not exists salesGames;

-- Use database
use salesGames;

-- Create table
create table if not exists sales (
    ranking int not null primary key,
    name_game varchar(150) not null,
    platform varchar(5) not null,
    year year not null,
    genre varchar(15) not null,
    publisher varchar(40) not null,
    NA_Sales decimal(5,2) not null,
    EU_Sales decimal(5,2) not null,
    JP_Sales decimal(5,2) not null,
    Other_Sales decimal(5,2) not null,
    Global_Sales decimal(5,2) not null
);
```
