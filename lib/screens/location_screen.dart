import 'package:flutter/material.dart';
import 'package:umbrella/utilities/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:umbrella/services/weather.dart';
import 'package:umbrella/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  String weatherIcon;
  var cityName;
  int temp;
  String weatherMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//Passing Data to a State Object
    updateData(widget.locationWeather);
  }

  void updateData(dynamic locationWeather) {
    if (locationWeather == Null) {
      cityName = '';
      temp = 0;
      weatherMessage = "disabled to loading data!";
      weatherIcon = 'Error';
      return;
    }
    setState(() {
      var weatherId = locationWeather['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(weatherId);

      cityName = locationWeather['name'];
      // convert temp to int as we don't need that accuracy !
      double tempDouble = locationWeather['main']['temp'];
      temp = tempDouble.toInt();

      weatherMessage = weather.getMessage(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async {
                        var data = await WeatherModel().locationWeatherData();
                        updateData(data);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        var cityNameBack = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CityScreen()));
                        if (cityNameBack != Null) {
                          var data = await WeatherModel()
                              .cityWeatherData(cityNameBack);
                          updateData(data);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            '$temp°',
                            style: kTempTextStyle,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Text(
                            weatherIcon,
                            style: kConditionTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      '$weatherMessage in $cityName!',
                      style: kMessageTextStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
