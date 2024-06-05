import 'package:flutter/material.dart';
import '../const/colors.dart';

class Helper {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static String getAssetName(String fileName, String type) {
    return "assets/images/$type/$fileName";
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}
Widget emailField(String? text, TextEditingController? emailController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text ?? "Email"),
      yHeight(5),
      TextFormField(
        maxLength: 30,
        keyboardType: TextInputType.name,
        controller: emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your email";
          }
          if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
              .hasMatch(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding:  EdgeInsets.all(12),
          
          counterText: "",
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2)),

          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1)),
          // labelText: labelText??"",
          hintText: "Enter Your Email",
          hintStyle: TextStyle(
            color: AppColor.placeholder,
          ),
        ),
      )
    ],
  );
}

Widget passwordField(String? text, TextEditingController? passController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text ?? "Password"),
      yHeight(5),
      TextFormField(
        maxLength: 30,
        keyboardType: TextInputType.name,
        controller: passController,
        validator: (value) {
          if (value == null || value.isEmpty && value.length<6) {
            return "Password must contain atleast 6 character";
          }

          return null;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          counterText: "",
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2)),

          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1)),
          // labelText: labelText??"",
          hintText: "Enter Password",
          hintStyle: TextStyle(
            color: AppColor.placeholder,
          ),
        ),
      )
    ],
  );
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

SizedBox yHeight(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox xWidth(double width) {
  return SizedBox(
    width: width,
  );
}
class DessertCard extends StatelessWidget {
  final String name;
  final String rating;
  final String shop;
  final Image  image;
  const DessertCard({
    required this.name, required this.rating, required this.shop, required this.image});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: image,
            ),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 70,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      // style: Helper.getTheme(context).headline4?.copyWith(
                      //   color: Colors.white,
                      // ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          Helper.getAssetName("star_filled.png", "virtual"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          rating,
                          style: TextStyle(color: AppColor.orange),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          shop,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            ".",
                            style: TextStyle(color: AppColor.orange),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Indian Food",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}





