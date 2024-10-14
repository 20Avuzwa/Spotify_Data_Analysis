--Advanced Spotify Data analysis
CREATE TABLE spotify_data (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    artists TEXT,
    duration_ms INT,
    release_date TEXT,
    year INT,
    acousticness FLOAT,
    danceability FLOAT,
    energy FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    tempo FLOAT,
    valence FLOAT,
    mode INT,
    key INT,
    popularity INT,
    explicit INT
);
--------------------------------------------------------------------------------------------------------
select * from spotify_data;
--EDA 
select count(*) from spotify_data;

select count(distinct artists) from spotify_data;

SELECT duration_ms from spotify_data;
Select Max(duration_ms) from spotify_data;
Select Min(duration_ms) from spotify_data;
Select avg(duration_ms) from spotify_data;

select Max(popularity) from spotify_data as most_popular 

--How many unique songs, artists, and release years are in the dataset?
SELECT COUNT(DISTINCT id) AS num_songs,
	COUNT(DISTINCT artists) AS num_artists, 
	COUNT(DISTINCT year) AS num_years FROM spotify_data;
-------------------------------------------------------------------------------------------------
--What is the distribution of songs by release year?
SELECT year, COUNT(*) AS num_songs
FROM spotify_data
GROUP BY year
ORDER BY year;

--What is the average duration in sec, and avg tempo
SELECT AVG(duration_ms)/1000 AS avg_duration_sec, AVG(tempo) AS avg_tempo
FROM spotify_data;

--* Popularity and Release Year Trends*--
SELECT year, AVG(popularity) AS avg_popularity
FROM spotify_data
GROUP BY year
ORDER BY year;

--Which are the top 10 most popular songs?
SELECT name, artists, popularity
FROM spotify_data
ORDER BY popularity DESC
LIMIT 10;

--**Energy and Danceability**
--What are the average energy and danceability values for songs released each year?
SELECT year, AVG(energy) AS avg_energy, AVG(danceability) AS avg_danceability
FROM spotify_data
GROUP BY year
ORDER BY year;

--What is the correlation between energy and danceability for all songs?
SELECT CORR(energy, danceability) AS energy_danceability_correlation
FROM spotify_data;

--Explicit Songs Analysis**
--What percentage of songs are labeled as explicit?
SELECT (COUNT(*) FILTER(WHERE explicit = 1) * 100.0 / COUNT(*)) AS percent_explicit
FROM spotify_data;

--What is the distribution of explicit songs by release year?
SELECT year, COUNT(*) FILTER(WHERE explicit = 1) AS explicit_songs
FROM spotify_data
GROUP BY year
ORDER BY year;
----------------------------------------------------------------------------------------------------------------------------
/* Audio Feature Analysis*/
--How do audio features like acousticness, loudness, and valence change over time?
SELECT year, AVG(acousticness) AS avg_acousticness, AVG(loudness) AS avg_loudness, AVG(valence) AS avg_valence
FROM spotify_data
GROUP BY year
ORDER BY year;

--Which audio features correlate most strongly with popularity?
-- Check correlation for energy
SELECT CORR(energy, popularity) AS correlation_energy FROM spotify_data;

-- Check correlation for danceability
SELECT CORR(danceability, popularity) AS correlation_danceability FROM spotify_data;

-- Check correlation for loudness
SELECT CORR(loudness, popularity) AS correlation_loudness FROM spotify_data;

-- Check correlation for acousticness
SELECT CORR(acousticness, popularity) AS correlation_acousticness FROM spotify_data;

-- Check correlation for valence
SELECT CORR(valence, popularity) AS correlation_valence FROM spotify_data;

---Combining the correlations using UNION.
SELECT 'energy' AS feature, CORR(energy, popularity) AS correlation FROM spotify_data
UNION ALL
SELECT 'danceability', CORR(danceability, popularity) FROM spotify_data
UNION ALL
SELECT 'loudness', CORR(loudness, popularity) FROM spotify_data
UNION ALL
SELECT 'acousticness', CORR(acousticness, popularity) FROM spotify_data
UNION ALL
SELECT 'valence', CORR(valence, popularity) FROM spotify_data;
--------------------------------------------------------------------------------------------------
--**Artist Insights**--
--Which artists have the most songs in the dataset?
SELECT artists, COUNT(*) AS num_songs
FROM spotify_data
GROUP BY artists
ORDER BY num_songs DESC
LIMIT 10;

--Which artists have the highest average popularity?
SELECT artists, AVG(popularity) AS avg_popularity
FROM spotify_data
GROUP BY artists
ORDER BY avg_popularity DESC
LIMIT 10;
--------------------------------------------------------------------------
 --**Mode and Key Analysis**--
--What are the most common musical keys and modes?
SELECT key, mode, COUNT(*) AS num_songs
FROM spotify_data
GROUP BY key, mode
ORDER BY num_songs DESC;

--Is there a relationship between key/mode and popularity?
SELECT key, mode, AVG(popularity) AS avg_popularity
FROM spotify_data
GROUP BY key, mode
ORDER BY avg_popularity DESC;
-----------------------------------------------------------------------------------------------------
--**Outlier Detection**--
--Identify outliers in song duration, energy, and loudness.
SELECT name, duration_ms, energy, loudness
FROM spotify_data
WHERE duration_ms > (SELECT AVG(duration_ms) + 2 * STDDEV(duration_ms) FROM spotify_data)
OR energy > (SELECT AVG(energy) + 2 * STDDEV(energy) FROM spotify_data)
OR loudness > (SELECT AVG(loudness) + 2 * STDDEV(loudness) FROM spotify_data);

----------------------------------------------------------------------------------------------------------
--** Rank of the songs by year**--
SELECT
  name,
  year,
  popularity,
  RANK() OVER (PARTITION BY year ORDER BY popularity DESC) AS popularity_rank
FROM
  spotify_data;

/*Cumulative statistics over time: Calculate cumulative statistics, 
like a rolling average of popularity or danceability over the years.*/
SELECT
  year,
  name,
  popularity,
  AVG(popularity) OVER (PARTITION BY year ORDER BY year ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS rolling_avg_popularity
FROM
  spotify_data;

--Distribution-based analysis: Calculate percentiles of popularity within a year using the NTILE() window function.
SELECT
  name,
  year,
  popularity,
  NTILE(4) OVER (PARTITION BY year ORDER BY popularity DESC) AS popularity_quartile
FROM
  spotify_data;







