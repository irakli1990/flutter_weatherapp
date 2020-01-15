import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunshine/backend/bloc.dart';
import 'package:sunshine/repository/weather_repo.dart';
import 'package:sunshine/screen/weather_screen.dart';

import 'config/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
       resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("SunShine"),
        ),
        body: BlocProvider(
          create: (context) => WeatherBloc(WeatherRepository()),
              child: WeatherSearchScreen(),
        ),
      )
    );
  }
}

