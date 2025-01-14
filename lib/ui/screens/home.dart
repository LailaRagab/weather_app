import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/ui/screens/search.dart';
import 'package:weather_app/ui/widgets/home_widgets/home_empty_body.dart';
import 'package:weather_app/ui/widgets/home_widgets/home_weather_body.dart';
import 'package:weather_app/utiles/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Search.routeName);
              },
              icon: const Icon(
                Icons.search,
              ),
            )
          ],
          title: const Text(
            "Weather App",
          ),
        ),
        body: BlocBuilder<GetWeatherCubit, GetWeatherStates>(
            builder: (context, state) {
          if (state is WeatherInitialState) {
            return const HomeEmptyBody();
          } else if (state is WithWeatherState) {
            return HomeWeatherBody(
              weatherModelThird: state.weatherModelSecond,
            );
          } else {
            return const Text("oops there 's an error ! ");
          }
        }));
  }
}
