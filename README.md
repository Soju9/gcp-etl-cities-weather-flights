# From Web Scraping to Cloud Automation: Building My First ETL Pipeline on GCP

This repository contains my first ETL pipeline project, built during my Data Analytics training at WBS Coding School.

The project collects city, weather, airport, and flight arrival data, transforms the API responses into structured tables, and loads the results into a MySQL database hosted on Google Cloud Platform.

The full project write-up is available on Medium:

[From Web Scraping to Cloud Automation: Building My First ETL Pipeline on GCP](https://medium.com/@nico.menges/from-web-scraping-to-cloud-automation-building-my-first-etl-pipeline-on-gcp-88a2bed39485)

## Project Overview

The goal of this project was to design and build an automated ETL pipeline that combines multiple external data sources into a relational database.

The pipeline focuses on three German cities:

- Berlin
- Hamburg
- Munich

For each city, the project collects:

- City information
- Population data
- Geographic coordinates
- Weather forecast data
- Nearby airport information
- Flight arrival information

## Tech Stack

- Python
- Pandas
- Requests
- SQLAlchemy
- PyMySQL
- MySQL
- Google Cloud SQL
- Google Cloud Functions
- OpenWeather API
- AeroDataBox API via RapidAPI
- Jupyter Notebook

## Data Sources

### City Data

The base dataset contains manually prepared city information for Berlin, Hamburg, and Munich, including:

- City name
- Country
- Population
- Population timestamp
- Latitude
- Longitude

### Weather Data

Weather forecast data is collected from the OpenWeather API.

The API response is transformed into a structured weather table containing:

- Date
- Time
- Temperature
- Feels-like temperature
- Minimum temperature
- Maximum temperature
- Rain probability
- Humidity
- Weather condition
- Wind speed
- Retrieval date
- City ID

### Airport And Flight Data

Airport and flight arrival data is collected from AeroDataBox through RapidAPI.

The airport data includes:

- IATA code
- ICAO code
- Airport name
- City
- Country
- Latitude
- Longitude
- City ID

The flight arrival data includes:

- Flight number
- Arrival time
- Arrival terminal
- Departure airport IATA code
- Arrival airport IATA code

## Database Schema

The project uses a relational MySQL database with the following tables:

- `city`
- `population`
- `weather`
- `airport`
- `flights`

The cloud-ready schema is available in:

    sql/cities_info_cloud.sql

## Repository Structure

    notebooks/
      city_database.ipynb
      Weather_Forecast.ipynb
      Weather_Function_Test.ipynb
      flight_info.ipynb

    sql/
      cities_info_cloud.sql
      cities_info.sql
      test_schema_cloud.sql

    docs/
      cities_info_diagram.mwb

## ETL Pipeline Flow

1. Create the city and population datasets.
2. Load city and population data into MySQL.
3. Use city coordinates to request weather forecast data from OpenWeather.
4. Transform nested JSON weather responses into tabular format.
5. Load weather forecast data into the `weather` table.
6. Use city coordinates to find nearby airports through AeroDataBox.
7. Load airport data into the `airport` table.
8. Use airport IATA codes to request flight arrival data.
9. Transform flight data into a structured format.
10. Load flight arrival data into the `flights` table.
11. Adapt the logic for cloud automation using Google Cloud Functions.

## Notebooks

### `city_database.ipynb`

Creates the initial city and population data for Berlin, Hamburg, and Munich, then loads the data into the MySQL database.

### `Weather_Forecast.ipynb`

Explores the OpenWeather API and transforms forecast data into a structured DataFrame.

### `Weather_Function_Test.ipynb`

Contains the cloud-function-oriented version of the weather ETL process.

### `flight_info.ipynb`

Explores AeroDataBox endpoints for airport search and flight arrival data.

## Important Security Note

API keys, database passwords, and other secrets should never be committed to GitHub.

Before uploading this project, replace any hardcoded credentials with environment variables or a local `keys.py` file that is excluded through `.gitignore`.

Example:

    from keys import API_key, SQL_PW

The `keys.py` file should stay local and should not be pushed to GitHub.

## Example Environment Variables

    OPENWEATHER_API_KEY=your_openweather_api_key
    RAPIDAPI_KEY=your_rapidapi_key
    SQL_HOST=your_database_host
    SQL_USER=your_database_user
    SQL_PASSWORD=your_database_password
    SQL_DATABASE=cities_info
    SQL_PORT=3306

## Key Learnings

Through this project, I learned how to:

- Extract data from APIs
- Work with nested JSON responses
- Transform API data into relational tables
- Design a basic relational database schema
- Load data into MySQL using Python
- Connect Python notebooks to a cloud-hosted database
- Prepare ETL logic for Google Cloud Functions
- Handle practical issues such as API limits, credentials, and schema consistency

## Medium Article

Read the full article here:

[From Web Scraping to Cloud Automation: Building My First ETL Pipeline on GCP](https://medium.com/@nico.menges/from-web-scraping-to-cloud-automation-building-my-first-etl-pipeline-on-gcp-88a2bed39485)
