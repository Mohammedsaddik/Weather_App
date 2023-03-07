import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/cubit.dart';

class SearchScreen extends StatelessWidget
{
  String? cityName;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Search a city',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            onSubmitted: (data)async
            {
              cityName=data;
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName=cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: 'Enter a city',
              label: const Text('search'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              suffix: const Icon(Icons.search)
            ),
          ),
        ),
      ),
    );
  }
}
