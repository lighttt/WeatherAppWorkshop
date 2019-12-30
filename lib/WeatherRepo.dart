import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/WeatherModel.dart';

class WeatherRepo {
  static const String API_ID = "04402e294a942dab68a991dc735cf2e4";

  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$API_ID");
    if (result.statusCode != 200) {
      throw Exception();
    } else {
      return parsedJson(result.body);
    }
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);
  }
}
