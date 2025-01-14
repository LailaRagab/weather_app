import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import '../../utiles/colors.dart';
import '../widgets/search_app_bar/search_app_bar.dart';

class Search extends StatelessWidget {
  Search({super.key});

  static String routeName = "search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (value) async {
              var getWeather = BlocProvider.of<GetWeatherCubit>(context);
              getWeather.fetchCurrentWeather(value: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              label: Text(
                "Search",
                style: TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              hintText: "Enter City Name",
              suffixIcon: Icon(Icons.search),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary)),
            ),
          ),
        ),
      ),
    );
  }
}
// global var
// WeatherModel ?weatherModel;
