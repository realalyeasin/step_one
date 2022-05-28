import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_one/Bloc/data_bloc.dart';
import 'package:step_one/OnBoarding/views.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as devtools show log;

import 'Bindings/binding.dart';
import 'Screens/home_page.dart';

extension Log on Object{
  void log() => devtools.log(toString());
}
int? initScreen;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  initScreen = await sharedPreferences.getInt('initScreen');
  await sharedPreferences.setInt('initScreen', 1);
  await dotenv.load(fileName: ".env");
  runApp(BlocProvider<DataBloc>(create: (context)=>DataBloc(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: initScreen == 0 || initScreen == null ? 'OnBoardingPage' : 'HomePage',
      routes: {
        'OnBoardingPage' : (context) => OnboardingPage(),
        'HomePage' : (context) => HomePage(),
      },
      initialBinding: ControllerBinding(),
    );
  }
}

