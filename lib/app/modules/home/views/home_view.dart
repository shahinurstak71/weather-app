// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';


class HomeView extends StatelessWidget {
  final HomeController weatherController = Get.put(HomeController());
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,color: Colors.white,
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text("Weather app", style: TextStyle( fontWeight: FontWeight.bold, fontSize:25

              ),),
            ),
                SizedBox(height: 5,),
                
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                hintText: 'Enter City',
                prefixIcon: IconButton(
                  onPressed: (){
                    weatherController.fetchWeatherData(cityController.text);
                  }, icon:Icon(Icons.search) ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
                ),
              ),
            ),
            // SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: () {
            //     weatherController.fetchWeatherData(cityController.text);
            //   },
            //   child: Text('Search'),
            //),
            SizedBox(height: 20),
            Obx(() {
              if (weatherController.isLoading.value) {
                return CircularProgressIndicator();
              } else if (weatherController.weather.value.location.name == '') {
                return Text('Enter a city name to get weather information');
              } else {
                return Column(
                  children: [
                    Text(
                      weatherController.weather.value.location.name.toString(),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    // Text(
                    //   '${weatherController.weather.value.current.tempC} °C',
                    //   style: TextStyle(fontSize: 20),
                    // ),
                    // // Text(
                    // //   weatherController.weather.value.current.condition.text,
                    // //   style: TextStyle(fontSize: 18),
                    // // ),
                
                    Text(weatherController.weather.value.current.tempF.toString()),
                     Text(weatherController.weather.value.current.cloud.toString()),
                    // Text(
                    //   DateFormat.yMMMMEEEEd().format(DateTime.parse(weatherController.weather.value.current!.lastUpdated.toString()))
                    // )

                    // CircleAvatar(
                    //   radius: 50,
                    //   backgroundImage: NetworkImage(weatherController.weather.value.),
                    // )
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
