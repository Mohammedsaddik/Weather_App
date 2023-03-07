import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/cubit.dart';
import 'package:weather_app/pages/home_screen.dart';
import 'package:weather_app/services/weather_services.dart';

void main() {
  runApp(BlocProvider(
    create: (context)
    {
      return WeatherCubit(WeatherService());
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel==null ? Colors.blue : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
