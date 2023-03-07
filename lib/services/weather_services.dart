import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather_model.dart';

class WeatherService
{
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'c18f995c9b2844f394182000230503';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse(
      '$baseUrl/current.json?key=$apiKey &q=$cityName',
    );
    http.Response response = await http.get(url);
    if (response.statusCode == 400) {
      var data  = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}



