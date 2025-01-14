import 'package:weather_app/models/weather_model.dart';

class GetWeatherStates{}
class WeatherInitialState extends GetWeatherStates{}

class WithWeatherState extends GetWeatherStates{
  final WeatherModel weatherModelSecond;

  WithWeatherState({required this.weatherModelSecond});
}

class WeatherFailureState extends GetWeatherStates{}