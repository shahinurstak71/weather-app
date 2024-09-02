
// lib/services/weather_service.dart
import 'package:http/http.dart' as http;

import 'app/data/weathermodel.dart';





class WeatherService {
  static const String _apiKey = '6500979ab1074900b80230215240109';
  static const String _baseUrl = 'http://api.weatherapi.com/v1';

  Future<Weathermodel?> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$_baseUrl/forecast.json?key=$_apiKey&q=$city&days=1'));

    if (response.statusCode == 200) {
      return WeatherModelFromJson(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
