import 'dart:async';
import 'package:afarinick_forms/nursery/nursery_homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Auth/login.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override

  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getPref() async{
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var email = pref.getString('email');
    var password = pref.getString('password');
    Timer(
      const Duration(seconds: 4),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => email == null && password == null ?  const Login() : const NurseryHomePage(),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    getPref();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/Kumad_Global.png',
              width: MediaQuery.of(context).size.width * .3,
              height: MediaQuery.of(context).size.height * .5,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.all(14),
              child: const Text(
                'AFARINICK/KUMAD',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.grey,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
