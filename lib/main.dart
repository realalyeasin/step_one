import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:step_one/Bloc/data_bloc.dart';
import 'dart:developer' as devtools show log;

import 'Screens/home_page.dart';

extension Log on Object{
  void log() => devtools.log(toString());
}

void main() {
  runApp(BlocProvider<DataBloc>(create: (context)=>DataBloc(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home:  HomePage());
  }
}

