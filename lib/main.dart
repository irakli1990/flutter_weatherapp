import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunshine/backend/bloc.dart';
import 'package:sunshine/repository/weather_repo.dart';
import 'package:sunshine/screen/home_screen.dart';

import 'config/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text("SunShine"),
          ),
          body: BlocProvider(
            create: (context) => WeatherBloc(WeatherRepository()),
            child: HomeScreen(),
          ),
        ));
  }
}
