import 'dart:async';
import 'package:Food_delivery_App/screens/auth/loginScreen.dart';
import 'package:Food_delivery_App/screens/main/homeScreen.dart';
import 'package:flutter/material.dart';
import '../../utils/helper.dart';
import '../../utils/shared_pref_helper.dart';
import '../main/landingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer(Duration(milliseconds: 4000), () async {
      SharedPrefHelper helper = await SharedPrefHelper.getInstance();

      if(helper.getUserEmail() != null && helper.getUserPassword() != null){
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

      }
      else{
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  Helper.getAssetName("food-delivery-logo.png", "virtual"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
