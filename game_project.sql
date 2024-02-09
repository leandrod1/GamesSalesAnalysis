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

-- --------------------------------------------------------------------
-- -------------------- Questions to answer ---------------------------
-- --------------------------------------------------------------------
-- What are the top 100 best-selling games worldwide?
select * from sales
order by global_sales desc
limit 100;

-- Given that sales figures are provided for each game across multiple consoles,
-- it's most appropriate to consider total sales without segregating by platform.

-- What are the top 100 best-selling games worldwide, aggregating sales across all consoles?
select name_game,
       sum(global_sales) as total_global_sales
from sales
group by name_game
order by sum(global_sales) desc
limit 100;

-- What are the top 10 best-selling games in North America, considering total sales across all platforms?
select name_game, 
	   sum(na_sales) as total_na_sales
from sales
group by name_game
order by sum(na_sales) desc
limit 10;

-- What are the top 10 best-selling games in Europe, encompassing sales from all consoles?
select name_game,
       sum(eu_sales) as total_eu_sales
from sales
group by name_game
order by sum(eu_sales) desc
limit 10;

-- What are the top 10 best-selling games in Japan, considering total sales across all platforms?
select name_game,
       sum(jp_sales) as total_jp_sales
from sales
group by name_game
order by sum(jp_sales) desc
limit 10;

-- What are the top 10 best-selling games in the rest of the world, without dividing sales by platform?
select name_game,
       sum(other_sales) as total_other_sales
from sales
group by name_game
order by sum(other_sales) desc
limit 10;


-- Which consoles have the most games sold globally?
select platform,
       sum(global_sales) as total_global_sales
from sales
group by platform
order by sum(global_sales) desc;

-- Which consoles lead in game sales in North America?
select platform,
	   sum(na_sales) as total_na_sales
from sales
group by platform
order by sum(na_sales) desc;

-- Which consoles lead in game sales in Europe?
select platform,
       sum(eu_sales) as total_eu_sales
from sales
group by platform
order by ssum(eu_sales) desc;

-- Which consoles lead in game sales in Japan?
select platform,
       sum(jp_sales) as total_jp_sales
from sales
group by platform
order by sum(jp_sales) desc;

-- Which consoles lead in game sales in the rest of the world?
select platform,
       sum(other_sales) as total_other_sales
from sales
group by platform
order by sum(other_sales) desc;


-- What are the most popular game genres worldwide?
select genre,
       sum(global_sales) as total_global_sales
from sales
group by genre
order by sum(global_sales) desc;

-- What are the most popular game genres in North America?
select genre,
	   sum(na_sales) as total_na_sales
from sales
group by genre
order by sum(na_sales) desc;

-- What genres lead in sales across Europe?
select genre,
       sum(eu_sales) as total_eu_sales,
from sales
group by genre
order by sum(eu_sales) desc;

-- What genres are favored in Japan?
select genre,
       sum(jp_sales) as total_jp_sales
from sales
group by genre
order by sum(jp_sales) desc;

-- What are the most popular game genres in the rest of the world?
select genre,
       sum(other_sales) as total_other_sales
from sales
group by genre
order by sum(other_sales) desc;


-- How many games were sold annually?
select year, sum(global_sales) as total_global_sales
from sales
group by year
order by year;


-- For this to work turn off ONLY_FULL_GROUP_BY
SELECT @@sql_mode;
SET @@sql_mode = SYS.LIST_DROP(@@sql_mode, 'ONLY_FULL_GROUP_BY');
SELECT @@sql_mode;

-- What are the top-selling games globally on each console?
select name_game,
	    platform,
        year,
        genre,
        publisher,
        global_sales
from sales
group by platform
order by year, global_sales desc;

-- What are the top 5 best-selling games on each console worldwide?
select  row_number() over(partition by a.platform) as index_n,
		a.name_game,
	    a.platform,
        a.year,
        a.genre,
        a.publisher,
        a.global_sales
from (select 
			 name_game, platform, year, genre, publisher, global_sales, row_number() over w as row_num
	  from sales
      window w as (partition by platform order by global_sales desc)) a
where a.row_num between 1 and 5;
