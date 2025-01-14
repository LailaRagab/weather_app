import 'package:flutter/material.dart';
import 'package:weather_app/utiles/colors.dart';
import 'package:weather_app/utiles/fonts.dart';

AppBar buildSearchAppBar(){
  return AppBar(
    backgroundColor: AppColors.primary,
    title: Text("Search a City" ,
    style: TextStyle(color: AppColors.white ,
    fontWeight: FontWeight.bold),
    ),

  );
}