import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Food_delivery_App/screens/auth/loginScreen.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../auth/signUpScreen.dart';
class LandingScreen extends StatelessWidget {
  static const routeName = "/landingScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 234, 246, 1.0),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                      children: [
            
                        // Align(
                        //   alignment: Alignment.topCenter,
                        //   // child: ClipShadow(
                        //   //   clipper: CustomClipperAppBar(),
                        //   //   boxShadow: [
                        //   //     BoxShadow(
                        //   //       color: AppColor.placeholder,
                        //   //       offset: Offset(0, 15),
                        //   //       blurRadius: 10,
                        //   //     ),
                        //   //   ],
                        //   //   child: Container(
                        //   //     width: double.infinity,
                        //   //     height: Helper.getScreenHeight(context) * 0.5,
                        //   //     decoration: ShapeDecoration(
                        //   //       color: AppColor.orange,
                        //   //       shape: RoundedRectangleBorder(
                        //   //         borderRadius: BorderRadius.circular(10),
                        //   //       ),
                        //   //     ),
                        //   //     child: Image.asset(
                        //   //       Helper.getAssetName("login_bg.png", "virtual"),
                        //   //       fit: BoxFit.cover,
                        //   //     ),
                        //   //   ),
                        //   // ),
                        // ),
                        yHeight(100),
                        Image.asset(
                          Helper.getAssetName("cover.png", "virtual"),
                        ),
                        yHeight(50),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
            children: [
              Text(
                "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20),
              ),
            
                        yHeight(screenHeight(context)*0.2),
            
                        SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
                child: Text("Login",style: TextStyle(color: Colors.white),),
              ),
                        ),
                        SizedBox(
              height: 10,
                        ),
                        SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.white),
                  foregroundColor:
                  MaterialStateProperty.all(AppColor.orange),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(
                      side:
                      BorderSide(color: AppColor.orange, width: 1.5),
                    ),
                  ),
                ),
                onPressed: () {Navigator.of(context)
                    .pushReplacementNamed(SignUpScreen.routeName);
                },
                child: Text("Create an Account"),
              ),
                        ),
            ],
                          ),
                        ),
                      ],
            ),
          ),
        ));
  }
}

class CustomClipperAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width * 0.24, size.height);
    Offset endPoint = Offset(size.width * 0.25, size.height * 0.96);
    Offset controlPoint2 = Offset(size.width * 0.3, size.height * 0.78);
    Offset endPoint2 = Offset(size.width * 0.5, size.height * 0.78);
    Offset controlPoint3 = Offset(size.width * 0.7, size.height * 0.78);
    Offset endPoint3 = Offset(size.width * 0.75, size.height * 0.96);
    Offset controlPoint4 = Offset(size.width * 0.76, size.height);
    Offset endPoint4 = Offset(size.width * 0.79, size.height);
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.21, size.height)
      ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..quadraticBezierTo(
        controlPoint2.dx,
        controlPoint2.dy,
        endPoint2.dx,
        endPoint2.dy,
      )
      ..quadraticBezierTo(
        controlPoint3.dx,
        controlPoint3.dy,
        endPoint3.dx,
        endPoint3.dy,
      )
      ..quadraticBezierTo(
        controlPoint4.dx,
        controlPoint4.dy,
        endPoint4.dx,
        endPoint4.dy,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
