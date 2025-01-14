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
      child:
      Builder(
          builder: (context) {
            // return
            //   BlocBuilder <GetWeatherCubit, GetWeatherStates>(
            //     builder: (context, state) {
                  return MaterialApp(
                    theme: ThemeData(
                        primarySwatch: 
                        // Colors.amber
                        themeColor(
                            BlocProvider
                                .of<GetWeatherCubit>(context)
                                .weatherModelFirst
                                ?.condition)
                    ),
                    debugShowCheckedModeBanner: false,
                    routes: {
                      Home.routeName: (_) =>  Home(),
                      Search.routeName: (_) => Search(),
                    },
                    initialRoute: Home.routeName,
                  );
            //     }
            // );
          }
      ),
    );
  }


  MaterialColor themeColor(String? weatherState) {
    if (weatherState == null) {
      return Colors.blue;
    }
    switch (weatherState.toLowerCase()) {
      case "sunny":
        return Colors.amber;
      case "clear":
        return Colors.deepPurple;
      case "partly cloudy":
        return Colors.lightBlue;
      case "cloudy":
        return Colors.grey;
      case "overcast":
        return Colors.blueGrey;
      case "mist":
        return Colors.teal;
      case "patchy rain possible":
      case "light rain":
      case "moderate rain":
      case "heavy rain":
        return Colors.blue;
      case "patchy snow possible":
      case "light snow":
      case "moderate snow":
      case "heavy snow":
        return Colors.blueGrey;
      case "thundery outbreaks possible":
      case "rain with thunder":
        return Colors.purple;
      case "blizzard":
        return Colors.cyan;
      case "fog":
      case "freezing fog":
        return Colors.indigo;
      case "light drizzle":
      case "freezing drizzle":
      case "sleet":
        return Colors.blue;
      case "ice pellets":
        return Colors.green;
      default:
        return Colors.blueGrey;
    }
  }
}