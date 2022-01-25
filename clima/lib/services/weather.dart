import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart' as constants;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = "${constants.WEATHER_API_STRING}?q=$cityName&appid=${dotenv.env["WEATHER_API_KEY"]}&units=metric";
    NetworkingHelper networkingHelper = NetworkingHelper(networkUrl: url);
    var weatherData = await networkingHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location loc = Location();
    await loc.getLocation();
    if (loc.lattitude == -double.infinity ||
        loc.lattitude == -double.infinity) {
      print(
          "Something went wrong with obtaining lattitude and longitude of current location. (${loc.lattitude},${loc.longitude})");
      return;
    }

    NetworkingHelper nh = NetworkingHelper(
        networkUrl:
            "${constants.WEATHER_API_STRING}?lat=${loc.getLattitude}&lon=${loc.getLongitude}&appid=${dotenv.env["WEATHER_API_KEY"]}&units=metric");
    return await nh.getData();
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
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
