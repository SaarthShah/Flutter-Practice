part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class getWeather extends WeatherEvent {
  final String cityName;
  getWeather(this.cityName);
}
