import 'package:clima/services/networking.dart';
import 'package:clima/utilities/location.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Location location = Location();
    await location.getLocation();
    final httpsUri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'q': cityName,
        'appid': 'c2133e6f2f3b5c48fe868b05ed3c0fd2',
        'units': 'metric'
      },
    );
    NetworkingHelper networkingHelper = NetworkingHelper(url: httpsUri);
    var weatherData = networkingHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();
    final httpsUri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'appid': 'c2133e6f2f3b5c48fe868b05ed3c0fd2',
        'units': 'metric'
      },
    );
    NetworkingHelper networkingHelper = NetworkingHelper(url: httpsUri);
    var weatherData = networkingHelper.getData();
    return weatherData;
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
