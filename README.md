# SweaterWeather

SweaterWeather is an API service that is intended to work as the backend for an weather app that mirrors yahoo weather: https://www.yahoo.com/news/weather 
Visitors can request for forecast,background image for a given location and create account
User can sign in to their account, create favorites, delete favorites using their API key they got during registration process.

# Getting Started
You access the SweaterWeather API through an HTTP interface. Following are examples of requests.
## Forecast Lookup
The following example requests the forecast of  "denver, colorado".
https://maps.googleapis.com/maps/api/v1/forecast?location=denver
Make sure your headers has `Content-Type  application/json`

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
