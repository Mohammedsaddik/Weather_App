import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/cubit.dart';
import 'package:weather_app/Cubits/states.dart';
import 'package:weather_app/Model/weather_model.dart';
import 'package:weather_app/pages/Search_screen.dart';

class HomeScreen extends StatelessWidget
{
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen();
              }));
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<WeatherCubit,WeatherState>(
        builder: (context, state)
        {
          if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is WeatherSuccessState) {
            weatherData=BlocProvider.of<WeatherCubit>(context).weatherModel;
            return Container(
              color: Colors.orangeAccent,
              child: Padding(
                padding: const EdgeInsets.all(27.0),
                child: Container(
                  color: Colors.orangeAccent,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 110.0),
                      child: Column(
                        children: [
                          Text(
                            BlocProvider.of<WeatherCubit>(context).cityName!,
                            style:
                            const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26.0),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Updated: ${weatherData!.date.hour} : ${weatherData!.date.minute}',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Row(
                            children:
                            [
                              Image.asset(weatherData!.getImage()),
                              const Spacer(),
                              Text(
                                weatherData!.temp.toInt().toString as String,
                                style:
                                const TextStyle(fontWeight: FontWeight.w500,
                                    fontSize: 26.0),
                              ),
                              const Spacer(),
                              Column(
                                children:
                                [
                                  Text(
                                    'Max :${weatherData!.maxTemp.toInt()}',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  const SizedBox(height: 5.0,),
                                  Text(
                                    'Min :${weatherData!.minTemp.toInt()}',
                                    style: const TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            weatherData!.weatherStateName,
                            style:
                            const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          else if (state is WeatherErrorState) {
            return const Center(
                child: Text('Something Went Wrong, Please try agin!!',
                style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
                ),
            );
          }
          else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'There is no weather start ',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'searching now ',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
        },
      ),
    );
  }
}
