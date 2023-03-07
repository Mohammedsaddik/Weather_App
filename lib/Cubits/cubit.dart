import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/states.dart';
import 'package:weather_app/Model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState>
{
  WeatherCubit(this.weatherService):super(WeatherLoadingState());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;
  void getWeather({required String cityName})async
  {
    emit(WeatherLoadingState());
    try{
      weatherModel=await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessState());
    }on Exception catch(e){
      emit(WeatherErrorState());
    }
  }
}