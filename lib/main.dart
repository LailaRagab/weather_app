import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/ui/screens/home.dart';
import 'package:weather_app/ui/screens/search.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, GetWeatherStates>(
        builder: (context, state) {
          final backgroundColor = _getBackgroundColor(state);

          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: backgroundColor,
              appBarTheme: const AppBarTheme(
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            routes: {
              Home.routeName: (_) => const Home(),
              Search.routeName: (_) =>  Search(),
            },
            initialRoute: Home.routeName,
          );
        },
      ),
    );
  }

  Color _getBackgroundColor(GetWeatherStates state) {
    if (state is WithWeatherState) {
      return _mapWeatherToColor(state.weatherModelSecond.condition);
    }
    return Colors.white;
  }

  Color _mapWeatherToColor(String? condition) {
    if (condition == null) return Colors.blueGrey;

    switch (condition.toLowerCase()) {
      case "sunny":
        return Colors.amber[100]!;
      case "clear":
        return Colors.deepPurple[100]!;
      case "partly cloudy":
        return Colors.lightBlue[50]!;
      case "cloudy":
        return Colors.grey[300]!;
      case "overcast":
        return Colors.blueGrey[300]!;
      case "mist":
        return Colors.teal[100]!;
      case "patchy rain possible":
      case "light rain":
      case "moderate rain":
      case "heavy rain":
        return Colors.blue[100]!;
      case "patchy snow possible":
      case "light snow":
      case "moderate snow":
      case "heavy snow":
        return Colors.blueGrey[200]!;
      case "thundery outbreaks possible":
      case "rain with thunder":
        return Colors.purple[100]!;
      case "blizzard":
        return Colors.cyan[100]!;
      case "fog":
      case "freezing fog":
        return Colors.indigo[100]!;
      case "light drizzle":
      case "freezing drizzle":
      case "sleet":
        return Colors.blue[50]!;
      case "ice pellets":
        return Colors.green[200]!;
      default:
        return Colors.blueGrey[400]!;
    }
  }
}
