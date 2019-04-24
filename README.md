# SweaterWeather

SweaterWeather is an API service that is intended to work as the backend for an weather app that mirrors yahoo weather:   https://www.yahoo.com/news/weather  
Visitors can request for forecast,background image for a given location and create account  
User can sign in to their account, create favorites, delete favorites using their API key they got during registration   process.  

# Getting Started
You access the SweaterWeather API through an HTTP interface. Following are examples of requests.  
Base URL: `localhost:3000`
## Forecast Lookup
The following example requests the forecast of  "denver, colorado".  
https://maps.googleapis.com/maps/api/v1/forecast?location=denver  
Make sure your headers has `Content-Type  application/json`    
## Backgrounds Lookup
The following example requests bacgrounds for  "kathmandu".

https://maps.googleapis.com/maps/api/v1/backgrounds?location=kathmandu

Make sure your headers has `Content-Type  application/json`

Below is a sample response for forecast lookup, in JSON:\n

`{  
    "data": {  
        "id": "73",  
        "type": "backgrounds",  
        "attributes": {  
            "image_url": "https://live.staticflickr.com/65535/47651534421_3397dea5b9_b.jpg",  
            "id": 73,  
            "location": "kathmandu"  
        }  
    }  
}`  

## Account Creation 
The following example requests sign up to the SweaterWeather API.<br />
`POST /api/v1/users <br />
 Content-Type: application/json  <br />
 Accept: application/json <br />
 And the body must contain eamil, password and password_confirmation like below: <br />  
 {  <br />
   "email": "whatever@example.com", <br />  
   "password": "password"  <br />
   "password_confirmation": "password"  <br />
 }`  <br />
After a successful request for sign up, You will get an API key. <br />  
Sample response, in JSON:   <br />
`{  <br />
  "api_key": "jgn983hy48thw9begh98h4539h4", <br />
}` <br />

## Login
The following example requests sign in to the SweaterWeather API.
`POST /api/v1/sessions
Content-Type: application/json
Accept: application/json
And the body must contain emil, passwordlike below:
{
  "email": "whatever@example.com",
  "password": "password"
}`
If your request is approved, you will see your API key within the response.
Sample response, in JSON:
`{
  "api_key": "jgn983hy48thw9begh98h4539h4",
}`
## Favoriting Locations
The following example requests favoriting a location.
` POST /api/v1/favorites
  Content-Type: application/json
  Accept: application/json
  body:
  {
    "location": "Denver, CO",
    "api_key": "jgn983hy48thw9begh98h4539h4"
  }`
If your request is approved you will receive a success message within the response.
Sample response, in JSON:
`{
    "success": "Favorited `Denver, CO`"
}`
## Listing Favorites 
The following example requests favorites for a user with an API key.
` GET /api/v1/favorites
  Content-Type: application/json
  Accept: application/json

  body:
  {
    "api_key": "jgn983hy48thw9begh98h4539h4"
  }`
If your request is approved you will receive all your favorites along with forecast for each.
Sample response, in JSON:
`{
    "data": [
        {
            "id": "4",
            "type": "forecast",
            "attributes": {
                "location": "Denver, CO",
                "current_temperature": 63.95,
                "feels_like": 63,
                "time_now": "08:02 PM",
                "date_today": "04/23",
                "highest_for_today": 67,
                "lowest_for_today": 46,
                "humidity": 34,
                "visibility": 5.17,
                "uvindex": 0,
                "now_summary": "Clear",
                "today_summary": "Mostly cloudy until afternoon.",
                "tonight_summary": "Clear",
                "weekly_summary": "No precipitation throughout the week, with high temperatures peaking at 79°F on Sunday.",
                "daily_forecast": [
                    {
                        "id": 1,
                        "date": "Tuesday",
                        "summary": "Mostly cloudy until afternoon.",
                        "icon": "partly-cloudy-day",
                        "high": 67.66,
                        "low": 46.59,
                        "precipitation": "9 %",
                        "humidity": "53%"
                    },
                    {
                        "id": 1,
                        "date": "Wednesday",
                        "summary": "Partly cloudy in the evening.",
                        "icon": "partly-cloudy-day",
                        "high": 73.21,
                        "low": 47.04,
                        "precipitation": "4 %",
                        "humidity": "37%"
                    },
                    {
                        "id": 1,
                        "date": "Thursday",
                        "summary": "Mostly cloudy in the morning.",
                        "icon": "partly-cloudy-day",
                        "high": 69.87,
                        "low": 48.26,
                        "precipitation": "28 %",
                        "humidity": "54%"
                    },
                    {
                        "id": 1,
                        "date": "Friday",
                        "summary": "Mostly cloudy throughout the day.",
                        "icon": "partly-cloudy-day",
                        "high": 76.16,
                        "low": 53.02,
                        "precipitation": "5 %",
                        "humidity": "38%"
                    },
                    {
                        "id": 1,
                        "date": "Saturday",
                        "summary": "Partly cloudy in the morning.",
                        "icon": "partly-cloudy-night",
                        "high": 71.24,
                        "low": 47.04,
                        "precipitation": "1 %",
                        "humidity": "30%"
                    },
                    {
                        "id": 1,
                        "date": "Sunday",
                        "summary": "Mostly cloudy throughout the day.",
                        "icon": "partly-cloudy-day",
                        "high": 79.3,
                        "low": 41.24,
                        "precipitation": "0 %",
                        "humidity": "28%"
                    },
                    {
                        "id": 1,
                        "date": "Monday",
                        "summary": "Foggy starting in the afternoon, continuing until evening.",
                        "icon": "fog",
                        "high": 57.18,
                        "low": 44.76,
                        "precipitation": "82 %",
                        "humidity": "66%"
                    },
                    {
                        "id": 1,
                        "date": "Tuesday",
                        "summary": "Foggy in the morning.",
                        "icon": "fog",
                        "high": 54.19,
                        "low": 38.59,
                        "precipitation": "88 %",
                        "humidity": "62%"
                    }
                ],
                "hourly_forecast": [
                    {
                        "id": 1,
                        "time": "08 PM",
                        "icon": "clear-night",
                        "temperature": 64
                    },
                    {
                        "id": 1,
                        "time": "09 PM",
                        "icon": "clear-night",
                        "temperature": 61
                    },
                    {
                        "id": 1,
                        "time": "10 PM",
                        "icon": "clear-night",
                        "temperature": 59
                    },
                    {
                        "id": 1,
                        "time": "11 PM",
                        "icon": "clear-night",
                        "temperature": 57
                    },
                    {
                        "id": 1,
                        "time": "12 AM",
                        "icon": "clear-night",
                        "temperature": 56
                    },
                    {
                        "id": 1,
                        "time": "01 AM",
                        "icon": "clear-night",
                        "temperature": 54
                    },
                    {
                        "id": 1,
                        "time": "02 AM",
                        "icon": "clear-night",
                        "temperature": 53
                    },
                    {
                        "id": 1,
                        "time": "03 AM",
                        "icon": "clear-night",
                        "temperature": 51
                    },
                    {
                        "id": 1,
                        "time": "04 AM",
                        "icon": "clear-night",
                        "temperature": 49
                    },
                    {
                        "id": 1,
                        "time": "05 AM",
                        "icon": "clear-night",
                        "temperature": 47
                    },
                    {
                        "id": 1,
                        "time": "06 AM",
                        "icon": "clear-night",
                        "temperature": 46
                    },
                    {
                        "id": 1,
                        "time": "07 AM",
                        "icon": "clear-day",
                        "temperature": 48
                    },
                    {
                        "id": 1,
                        "time": "08 AM",
                        "icon": "clear-day",
                        "temperature": 54
                    },
                    {
                        "id": 1,
                        "time": "09 AM",
                        "icon": "clear-day",
                        "temperature": 60
                    },
                    {
                        "id": 1,
                        "time": "10 AM",
                        "icon": "clear-day",
                        "temperature": 63
                    },
                    {
                        "id": 1,
                        "time": "11 AM",
                        "icon": "clear-day",
                        "temperature": 66
                    },
                    {
                        "id": 1,
                        "time": "12 PM",
                        "icon": "clear-day",
                        "temperature": 68
                    },
                    {
                        "id": 1,
                        "time": "01 PM",
                        "icon": "clear-day",
                        "temperature": 70
                    },
                    {
                        "id": 1,
                        "time": "02 PM",
                        "icon": "clear-day",
                        "temperature": 72
                    },
                    {
                        "id": 1,
                        "time": "03 PM",
                        "icon": "clear-day",
                        "temperature": 73
                    },
                    {
                        "id": 1,
                        "time": "04 PM",
                        "icon": "clear-day",
                        "temperature": 73
                    },
                    {
                        "id": 1,
                        "time": "05 PM",
                        "icon": "clear-day",
                        "temperature": 72
                    },
                    {
                        "id": 1,
                        "time": "06 PM",
                        "icon": "partly-cloudy-day",
                        "temperature": 72
                    },
                    {
                        "id": 1,
                        "time": "07 PM",
                        "icon": "partly-cloudy-day",
                        "temperature": 70
                    },
                    {
                        "id": 1,
                        "time": "08 PM",
                        "icon": "partly-cloudy-night",
                        "temperature": 68
                    },
                    {
                        "id": 1,
                        "time": "09 PM",
                        "icon": "partly-cloudy-night",
                        "temperature": 65
                    },
                    {
                        "id": 1,
                        "time": "10 PM",
                        "icon": "clear-night",
                        "temperature": 64
                    },
                    {
                        "id": 1,
                        "time": "11 PM",
                        "icon": "clear-night",
                        "temperature": 62
                    },
                    {
                        "id": 1,
                        "time": "12 AM",
                        "icon": "clear-night",
                        "temperature": 60
                    },
                    {
                        "id": 1,
                        "time": "01 AM",
                        "icon": "clear-night",
                        "temperature": 57
                    },
                    {
                        "id": 1,
                        "time": "02 AM",
                        "icon": "clear-night",
                        "temperature": 54
                    },
                    {
                        "id": 1,
                        "time": "03 AM",
                        "icon": "partly-cloudy-night",
                        "temperature": 52
                    },
                    {
                        "id": 1,
                        "time": "04 AM",
                        "icon": "partly-cloudy-night",
                        "temperature": 49
                    },
                    {
                        "id": 1,
                        "time": "05 AM",
                        "icon": "partly-cloudy-night",
                        "temperature": 48
                    },
                    {
                        "id": 1,
                        "time": "06 AM",
                        "icon": "partly-cloudy-night",
                        "temperature": 47
                    },
                    {
                        "id": 1,
                        "time": "07 AM",
                        "icon": "partly-cloudy-day",
                        "temperature": 47
                    },
                    {
                        "id": 1,
                        "time": "08 AM",
                        "icon": "partly-cloudy-day",
                        "temperature": 47
                    },
                    {
                        "id": 1,
                        "time": "09 AM",
                        "icon": "partly-cloudy-day",
                        "temperature": 49
                    },
                    {
                        "id": 1,
                        "time": "10 AM",
                        "icon": "partly-cloudy-day",
                        "temperature": 51
                    },
                    {
                        "id": 1,
                        "time": "11 AM",
                        "icon": "partly-cloudy-day",
                        "temperature": 55
                    },
                    {
                        "id": 1,
                        "time": "12 PM",
                        "icon": "clear-day",
                        "temperature": 59
                    },
                    {
                        "id": 1,
                        "time": "01 PM",
                        "icon": "clear-day",
                        "temperature": 62
                    },
                    {
                        "id": 1,
                        "time": "02 PM",
                        "icon": "clear-day",
                        "temperature": 66
                    },
                    {
                        "id": 1,
                        "time": "03 PM",
                        "icon": "clear-day",
                        "temperature": 68
                    },
                    {
                        "id": 1,
                        "time": "04 PM",
                        "icon": "clear-day",
                        "temperature": 69
                    },
                    {
                        "id": 1,
                        "time": "05 PM",
                        "icon": "clear-day",
                        "temperature": 69
                    },
                    {
                        "id": 1,
                        "time": "06 PM",
                        "icon": "clear-day",
                        "temperature": 69
                    },
                    {
                        "id": 1,
                        "time": "07 PM",
                        "icon": "clear-day",
                        "temperature": 67
                    },
                    {
                        "id": 1,
                        "time": "08 PM",
                        "icon": "clear-night",
                        "temperature": 64
                    }
                ]
            }
        }
    ]
}`

## Removing Favorites 
The following example requests removing a favorites.
` DELETE /api/v1/favorites
  Content-Type: application/json
  Accept: application/json

  body:
  {
    "location": "Denver, CO",
    "api_key": "jgn983hy48thw9begh98h4539h4"
  }`
If your request is approved, You will receive a response that contains remaining favorites and their forecast.
Sample response, in JSON:
`{
    "data": []
}` (In this case we only had one favorites and we deleted that)




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
