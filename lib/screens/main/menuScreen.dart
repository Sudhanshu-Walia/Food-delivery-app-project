import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Food_delivery_App/const/colors.dart';
import 'package:Food_delivery_App/utils/helper.dart';
import 'package:Food_delivery_App/widgets/customNavBar.dart';
import 'package:Food_delivery_App/widgets/searchBar.dart';

import 'dessertScreen.dart';
import 'foodScreen.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/menuScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Menu",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset(
                        Helper.getAssetName("cart.png", "virtual"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomSearchBar(title: "Search Food"),
                  SizedBox(
                      height: Helper.getScreenHeight(context) * 0.5,
                      width: Helper.getScreenWidth(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(FoodScreen.routeName);
                              },
                              child: MenuCard(
                                imageShape: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      Helper.getAssetName("western2.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                name: "Food",
                                count:"10",
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(DessertScreen.routeName);
                              },
                              child: MenuCard(
                                imageShape: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      Helper.getAssetName("coffee2.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                name: "Beverage",
                                count:"10",
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(DessertScreen.routeName);
                              },
                              child: MenuCard(
                                imageShape: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      Helper.getAssetName(
                                          "dessert.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                name: "Desserts",
                                count:"10",
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(DessertScreen.routeName);
                              },
                              child: MenuCard(
                                imageShape: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                      Helper.getAssetName(
                                          "hamburger3.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                name: "Promotions",
                                count:"10",
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              menu: true,
            ),
          )
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String name;
  final String count;
  final Widget imageShape;
  const MenuCard({
    required this.name,
    required this.count,
    required this.imageShape,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: double.infinity,

          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.placeholder,
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              imageShape,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    // style: Helper.getTheme(context).headline4?.copyWith(
                    //       color: AppColor.primary,
                    //     ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("$count items")
                ],
              ),
              SizedBox(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: AppColor.placeholder,
                          offset: Offset(0, 2),
                          blurRadius: 5,
                        )
                      ]),
                  child: Image.asset(
                    Helper.getAssetName("next_filled.png", "virtual"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlpoint = Offset(size.width * 0, size.height * 0.5);
    Offset endpoint = Offset(size.width * 0.2, size.height * 0.85);
    Offset controlpoint2 = Offset(size.width * 0.33, size.height);
    Offset endpoint2 = Offset(size.width * 0.6, size.height * 0.9);
    Offset controlpoint3 = Offset(size.width * 1.4, size.height * 0.5);
    Offset endpoint3 = Offset(size.width * 0.6, size.height * 0.1);
    Offset controlpoint4 = Offset(size.width * 0.33, size.height * 0);
    Offset endpoint4 = Offset(size.width * 0.2, size.height * 0.15);

    Path path = new Path()
      ..moveTo(size.width * 0.2, size.height * 0.15)
      ..quadraticBezierTo(
        controlpoint.dx,
        controlpoint.dy,
        endpoint.dx,
        endpoint.dy,
      )
      ..quadraticBezierTo(
        controlpoint2.dx,
        controlpoint2.dy,
        endpoint2.dx,
        endpoint2.dy,
      )
      ..quadraticBezierTo(
        controlpoint3.dx,
        controlpoint3.dy,
        endpoint3.dx,
        endpoint3.dy,
      )
      ..quadraticBezierTo(
        controlpoint4.dx,
        controlpoint4.dy,
        endpoint4.dx,
        endpoint4.dy,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomDiamond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.1000000, size.height * 0.4400000);
    path.quadraticBezierTo(size.width * 0.0243800, size.height * 0.5247000,
        size.width * 0.1000000, size.height * 0.6000000);
    path.quadraticBezierTo(size.width * 0.3550000, size.height * 0.8250000,
        size.width * 0.4400000, size.height * 0.9000000);
    path.quadraticBezierTo(size.width * 0.5140600, size.height * 0.9574800,
        size.width * 0.5800000, size.height * 0.9000000);
    path.quadraticBezierTo(size.width * 0.8200000, size.height * 0.6450000,
        size.width * 0.9000000, size.height * 0.5600000);
    path.quadraticBezierTo(size.width * 0.9500400, size.height * 0.5009400,
        size.width * 0.9000000, size.height * 0.4200000);
    path.quadraticBezierTo(size.width * 0.6450000, size.height * 0.1800000,
        size.width * 0.5600000, size.height * 0.1000000);
    path.quadraticBezierTo(size.width * 0.5029400, size.height * 0.0446800,
        size.width * 0.4200000, size.height * 0.1000000);
    path.quadraticBezierTo(size.width * 0.3400000, size.height * 0.1850000,
        size.width * 0.1000000, size.height * 0.4400000);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
