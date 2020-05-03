import 'package:umbrella/services/location.dart';
import 'package:umbrella/services/networking.dart';
import 'package:umbrella/utilities/constants.dart';

class WeatherModel {
  String websiteUrl = 'https://api.openweathermap.org/data/2.5/weather';
Future<dynamic> locationWeatherData()async{

  Location location = Location();
  await location.getCurrentPosition();

  Networking networking = Networking(

      url: '$websiteUrl?lat=${await location.getLatitude()}&lon'
  '=${await location.getLongitude()}&units=metric&appid=$apiKey');

  // get the Response body from API
  var locationWeather = await networking.fetchAlbum();
return locationWeather ;
}
  Future<dynamic> cityWeatherData(String cityName)async{


    Networking networking = Networking(

        url: '$websiteUrl?q=$cityName&units=metric&appid=$apiKey');

    // get the Response body from API
    var locationWeather = await networking.fetchAlbum();
    return locationWeather ;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return "It's 🍦 time";
    } else if (temp > 20) {
      return "Time for shorts and 👕";
    } else if (temp < 10) {
      return "You'll need 🧣 and 🧤";
    } else {
      return "Bring a 🌂 just in case";
    }
  }
}
