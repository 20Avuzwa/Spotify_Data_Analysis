# Spotify Data Analysis Project

## Overview

This project explores and analyzes a large dataset containing over 169,000 Spotify songs. The analysis aims to uncover trends and insights into various song features such as energy, danceability, loudness, and their relationship with song popularity. The project also examines key factors such as the impact of explicit content, release year, and audio features on a song's success on the Spotify platform.

The project includes exploratory data analysis (EDA), advanced SQL queries, and insights derived from examining correlations between different audio features and song popularity. The goal is to provide useful insights into what makes a song popular on Spotify, based on its acoustic properties and metadata.

## Dataset

The dataset contains **169,909 songs** with the following attributes:
Download it here: https://drive.usercontent.google.com/download?id=1lADPn9O7N5uxpqs_th0hetvLkF_BkOo-&export=download&authuser=0&confirm=t&uuid=0980e92b-7c82-4796-b28f-0a1916026300&at=AN_67v09TYYGJ2BVz51GRPGlSN06:1728227684840

- **id**: Unique identifier for each song
- **name**: The title of the song
- **artists**: Artists performing the song (can include multiple artists)
- **duration_ms**: Duration of the song in milliseconds
- **release_date**: Date the song was released
- **year**: Release year extracted from the release date
- **acousticness**: Confidence measure of how acoustic a song is (higher values represent more acoustic sounds)
- **danceability**: Describes how suitable a track is for dancing, based on rhythm stability and tempo
- **energy**: Intensity and activity level of a song
- **instrumentalness**: Measure of whether a track is purely instrumental or not
- **liveness**: Measure of whether a song was recorded in front of a live audience
- **loudness**: The average volume of the song in decibels (dB)
- **speechiness**: The presence of spoken words in a song
- **tempo**: Beats per minute (BPM) of the song
- **valence**: Measure of the musical positivity conveyed by the track
- **mode**: The mode of the song (major or minor scale)
- **key**: The musical key in which the track is composed
- **popularity**: Popularity score on Spotify (ranges from 0 to 100)
- **explicit**: Binary value indicating if the song contains explicit content (1: Yes, 0: No)

## Project Goals

The main objectives of this analysis are:

1. To understand the general distribution of songs across various features such as energy, danceability, loudness, and valence.
2. To examine how song features affect popularity on Spotify.
3. To identify key trends related to release year, explicit content, and song popularity.
4. To perform correlation analysis to understand relationships between audio features and song popularity.

## Exploratory Data Analysis (EDA)

### Key Questions Answered:
1. **How many unique songs, artists, and release years are present?**
   - There are **169,909 unique songs**, **33,375 unique artists**, and the dataset spans over **100 release years**.

2. **What is the distribution of song duration and tempo?**
   - The average song duration is **231.4 seconds** (~3 minutes 51 seconds), and the average tempo is **116.95 BPM**.

3. **Which songs are the most popular?**
   - The top 10 most popular songs include tracks such as:
     1. "Blinding Lights" by **The Weeknd** (popularity: 100)
     2. "ROCKSTAR" (feat. Roddy Ricch) by **DaBaby** (popularity: 99)
     3. "death bed (coffee for your head)" by **Powfu** (popularity: 97)

4. **What is the correlation between audio features and popularity?**
   - The correlation analysis found:
     - **Energy** has a positive correlation with popularity (**0.497**).
     - **Loudness** has a positive correlation with popularity (**0.467**).
     - **Acousticness** has a negative correlation with popularity (**-0.593**).

5. **What percentage of songs are labeled as explicit?**
   - Approximately **8.49%** of the songs in the dataset are labeled as explicit.

## Advanced Queries and Insights

1. **Popularity Over Time**
   - Trend: The average song popularity has increased over the years.

2. **Top Artists by Number of Songs**
   - Insight: Certain artists consistently produce a large volume of songs.

3. **Top Artists by Popularity**
   - Insight: Some artists consistently rank higher in terms of popularity.

4. **Correlations Between Audio Features and Popularity**
   - Insight: Energy and loudness are positively correlated with popularity, while acousticness is negatively correlated.

5. **Explicit Songs Analysis**
   - Insight: Around 8.49% of the songs are explicit.

6. **Cumulative Popularity Trends**
   - Insight: Cumulative popularity metrics over time help capture evolving trends.

## Future Work

- **Visualizations**: Visualizing insights using Tableau or Power BI to explore relationships between features like energy, danceability, and popularity.
- **Feature Engineering**: Enhancing the dataset by creating new features such as popularity growth over time or classifying genres.
- **Predictive Modeling**: Building machine learning models to predict a song's popularity based on its audio features.

## How to Run the Project

1. **Dataset**: Ensure the `spotify-data.csv` file is available in your working directory.
2. **SQL Queries**: The SQL queries related to this analysis can be found in the `Spotify Data Analysis.sql` file.
3. **Analysis**: Run the SQL queries to generate the insights mentioned above.

## Tools and Technologies

- **PostgreSQL / PgAdmin**: Used for running SQL queries and data manipulation.


## Conclusion

This project explored Spotify's song dataset by performing exploratory data analysis (EDA) and advanced SQL queries. Key insights were derived regarding artist popularity, correlations between audio features and popularity, and trends in explicit songs. These findings can be used to understand the evolution of music preferences and help recommend songs based on popular features.



