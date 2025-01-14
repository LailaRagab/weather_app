import 'package:flutter/material.dart';
import 'package:weather_app/ui/screens/search.dart';
import 'package:weather_app/utiles/colors.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
    // backgroundColor: AppColors.primary,
    title: Text("Weather App" ,
    //   style: TextStyle(
    //   color: AppColors.white
    // ),
    ),
    actions: [
      IconButton(
          onPressed: (){
            Navigator.pushNamed(context, Search.routeName);
          },
          icon: Icon(Icons.search ,
          // color: AppColors.white,
          ),
      )
    ],
  );
}