import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../api/api_request.dart';

class GetWeatherCubit extends Cubit <GetWeatherStates> {
  GetWeatherCubit() : super (WeatherInitialState());
  WeatherModel? weatherModelFirst;
  fetchCurrentWeather({required String value , context}) async{
    try {
      weatherModelFirst = await ApiRequest(dio: Dio()).getCurrentWeather(cityName: value);
      emit(WithWeatherState(weatherModelSecond: weatherModelFirst!));

    } on Exception catch (e) {
      emit(WeatherFailureState());
    }

  }

}