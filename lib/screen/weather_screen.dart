import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:sunshine/backend/bloc.dart';import 'package:sunshine/widgets/show_weather.dart';import 'package:sunshine/widgets/loading_indicator.dart';class WeatherSearchScreen extends StatefulWidget {  @override  _WeatherSearchScreenState createState() => _WeatherSearchScreenState();}class _WeatherSearchScreenState extends State<WeatherSearchScreen> {  @override  Widget build(BuildContext context) {    final weatherBloc = BlocProvider.of<WeatherBloc>(context);    var cityController = TextEditingController();    return Container(      height: double.infinity,      child: Column(        mainAxisAlignment: MainAxisAlignment.center,        crossAxisAlignment: CrossAxisAlignment.start,        children: <Widget>[          BlocBuilder<WeatherBloc, WeatherState>(            bloc: weatherBloc,            builder: (context, state) {              if (state is InitialWeatherState) {                return Column(                  children: <Widget>[                    Container(                      padding: const EdgeInsets.all(8),                      child: TextField(                        controller: cityController,                        decoration: InputDecoration(                            border: OutlineInputBorder(),                            hintText: 'Search for city'),                      ),                    ),                    GestureDetector(                      child: Padding(                        padding: const EdgeInsets.all(8.0),                        child: Container(                            height: 50,                            decoration: BoxDecoration(                                borderRadius: BorderRadius.circular(9.0),                                color: Colors.orange),                            alignment: Alignment.center,                            child: Text("Shearch")),                      ),                      onTap: () =>                          weatherBloc                              .add(GetWeatherEvent(city: cityController.text)),                    ),                  ],                );              }              if (state is WeatherLoadingState) {                return LoadingIndicator();              }              if (state is WeatherLoadedState) {                return ShowWeatherScreen(state.weather);              }              return WeatherSearchScreen();            },          )        ],      ),    );  }  @override  void dispose() {    super.dispose();  }}