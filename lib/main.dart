import 'package:afarinick_forms/harvest/harvest_bloc.dart';
import 'package:afarinick_forms/harvest/harvest_database.dart';
import 'package:afarinick_forms/nursery/nursery_bloc.dart';
import 'package:afarinick_forms/nursery/nursery_database.dart';
import 'package:afarinick_forms/propagation/propagation_bloc.dart';
import 'package:afarinick_forms/propagation/propagation_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'SplashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HarvestingDatabase.instance.database;
  await PropagationDatabase.instance.database;
  await NurseryDatabase.instance.database;
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
      ..displayDuration = const Duration(microseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.green
      ..backgroundColor = Colors.red
      ..indicatorColor = Colors.yellow
      ..maskColor = Colors.greenAccent
      ..userInteractions = true
      ..dismissOnTap = false;
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HarvestBloc()),
        BlocProvider(create: (context) => PropagationBloc()),
        BlocProvider(create: (context) => NurseryBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}