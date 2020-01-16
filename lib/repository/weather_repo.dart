import 'dart:convert';import 'package:http/http.dart' as http;import 'package:sunshine/models/weather.dart';import 'package:sunshine/models/weather_forecast.dart';class WeatherRepository {  Future<WeatherModel> getWeather(String city) async {    final result = await http.Client().get(        'https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2');    if (result.statusCode != 200) throw Exception();    return parsedJson(result.body);  }  Future<WeatherForecastModel> getWeatherForecast(String city) async {    final result = await http.Client().get(        'https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2');    if (result.statusCode != 200) throw Exception();    print(result.body);    return parsedForecastJson(result.body);  }  WeatherModel parsedJson(final response) {    final jsonDecoded = json.decode(response);    return WeatherModel.fromJson(jsonDecoded);  }  WeatherForecastModel parsedForecastJson(final response) {    final jsonDecoded = json.decode(response);    return WeatherForecastModel.fromJson(jsonDecoded);  }}