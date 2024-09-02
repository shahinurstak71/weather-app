// lib/controllers/weather_controller.dart
import 'package:get/get.dart';

import '../../../../weatherservice.dart';
import '../../../data/weathermodel.dart';


class HomeController extends GetxController {
  var isLoading = false.obs;
 var weather =Weathermodel(
  location:  Location(name: '', region: '', country: '', lat: 0, lon: 0, tzId: '', localtimeEpoch: 0, localtime: ''),
  current:  Current(
      tempC: 0,
      tempF: 0,
      isDay: 0,
     
      // windMph: 0,
      // windKph: 0,
      // windDegree: 0,
      // windDir: '',
      // pressureMb: 0,
      // pressureIn: 0,
      // precipMm: 0,
      // precipIn: 0,
      // humidity: 0,
      cloud: 0,
      // feelslikeC: 0,
      // feelslikeF: 0,
      // windchillC: 0,
      // windchillF: 0,
      // heatindexC: 0,
      // heatindexF: 0,
      // dewpointC: 0,
      // dewpointF: 0,
      // visKm: 0,
      // visMiles: 0,
      // uv: 0,
      // gustMph: 0,
      // gustKph: 0,
    ), 
  forecast: Forecast(forecastday: []),
  ).obs;
  
  
  
 
 


  void fetchWeatherData(String city) async {
    isLoading(true);
    try {
      var weatherData = await WeatherService().fetchWeather(city);
      if (weatherData != null) {
        weather.value = weatherData;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
