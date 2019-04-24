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
Below is a sample response for forecast lookup, in JSON:  
```
{  
    "data": {  
        "id": "73",  
        "type": "backgrounds",  
        "attributes": {  
            "image_url": "https://live.staticflickr.com/65535/47651534421_3397dea5b9_b.jpg",  
            "id": 73,  
            "location": "kathmandu"  
        }  
    }  
}
```

## Account Creation 
The following example requests sign up to the SweaterWeather API.  
```
 POST /api/v1/users 
 Content-Type: application/json
 Accept: application/json
 And the body must contain eamil, password and password_confirmation like below:
 { 
   "email": "whatever@example.com",
   "password": "password",
   "password_confirmation": "password"
 }
 
 ```
After a successful request for sign up, You will get an API key.   
Sample response, in JSON:  
```
{ 
  "api_key": "jgn983hy48thw9begh98h4539h4", <br />
}
```

## Login
The following example requests sign in to the SweaterWeather API.  
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json
And the body must contain emil, passwordlike below:
{
  "email": "whatever@example.com",
  "password": "password"
}

```
If your request is approved, you will see your API key within the response.  
Sample response, in JSON:  
```
{
  "api_key": "jgn983hy48thw9begh98h4539h4",
}
```
## Favoriting Locations
The following example requests favoriting a location.  
``` 
  POST /api/v1/favorites
  Content-Type: application/json
  Accept: application/json
  body:
  {
    "location": "Denver, CO",
    "api_key": "jgn983hy48thw9begh98h4539h4"
  }
 ```
If your request is approved you will receive a success message within the response.  
Sample response, in JSON:  
```
{
    "success": "Favorited `Denver, CO`"
}

```
## Listing Favorites 
The following example requests favorites for a user with an API key.  
```
  GET /api/v1/favorites
  Content-Type: application/json
  Accept: application/json

  body:
  {
    "api_key": "jgn983hy48thw9begh98h4539h4"
  }
  ```
If your request is approved you will receive all your favorites along with forecast for each.  
## Removing Favorites  
The following example requests removing a favorites.  
```
  DELETE /api/v1/favorites
  Content-Type: application/json
  Accept: application/json

  body:
  {
    "location": "Denver, CO",
    "api_key": "jgn983hy48thw9begh98h4539h4"
  }
  
```
If your request is approved, You will receive a response that contains remaining favorites and their forecast.  
Sample response, in JSON:  
(In this case we only had one favorites and we deleted that)

```
{
    "data": []
}
``` 
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
