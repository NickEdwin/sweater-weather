# Sweater Weater  

## Description  

Sweater weather is at heart a weather API for use by any front end team.  
This API will expose the weather for an entered city by converting the name to latitude/longitude coordinates using the Mapquest API. Itthen it uses the OpenWeatherMap API to find the weather for that given point. It always uses the Pixabay API to return an image of that city.  
The API also has user registration functions. Users can register and a new API key is generated for them using 13 key SecureRandom which is built into rails.  

Another aspect of this API is that users can also plan road trips! A user will start by enter a starting and ending city name along with their API key. If the API key is correct a user is returned the estimated travel time to their destination as well as the weather of the destination city.  

## API's used for project  

[Mapquest](https://developer.mapquest.com/)  
[OpenWeatherMap](https://openweathermap.org/api)  
[Pixabay](https://pixabay.com/api/docs/)  


## Known issues and bugs  

Mapquest api will not enter an invalid city, when an invalid location is entered the lat/long coordinates default to the exact center of the USA. Will need to ass some guard logic against this exact location (doesn't look like anyone lives there so it shouldn't alienate users.)   

Images for city from Pixabay are sometimes just artsy images and not an image that truly depicts the feel of the city. Right now the API will call for 20 images and select one randomly for some variety, but that means some strange ones. Perhaps a different API would be a better choice to avoid this.  
