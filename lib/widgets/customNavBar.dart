import 'package:Food_delivery_App/utils/assets.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../screens/main/homeScreen.dart';
import '../screens/main/menuScreen.dart';
import '../screens/main/moreScreen.dart';
import '../screens/main/offerScreen.dart';
import '../screens/main/profileScreen.dart';
import '../utils/helper.dart';

class CustomNavBar extends StatelessWidget {
  final bool home;
  final bool menu;
  final bool offer;
  final bool profile;
  final bool settings;

  const CustomNavBar(
      {this.home = false,
      this.menu = false,
      this.offer = false,
      this.profile = false,
      this.settings = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: Helper.getScreenWidth(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              width: Helper.getScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!menu) {
                        Navigator.of(context)
                            .pushReplacementNamed(MenuScreen.routeName);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        menu
                            ? Image.asset(
                                Assets.moreFilled,
                              )
                            : Image.asset(
                                Assets.more,
                              ),
                        menu
                            ? Text("Menu",
                                style: TextStyle(color: AppColor.orange))
                            : Text("Menu"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!offer) {
                        Navigator.of(context)
                            .pushReplacementNamed(OfferScreen.routeName);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        offer
                            ? Image.asset(
                          Assets.bagFilled,


                              )
                            : Image.asset(
                          Assets.bag,

                              ),
                        offer
                            ? Text("Offers",
                                style: TextStyle(color: AppColor.orange))
                            : Text("Offers"),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!profile) {
                        Navigator.of(context)
                            .pushReplacementNamed(ProfileScreen.routeName);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        profile
                            ? Image.asset(
                          Assets.userFilled,

                              )
                            : Image.asset(
                          Assets.user,

                              ),
                        profile
                            ? Text("Profile",
                                style: TextStyle(color: AppColor.orange))
                            : Text("Profile"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!settings) {
                        Navigator.of(context)
                            .pushReplacementNamed(MoreScreen.routeName);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        settings
                            ? Image.asset(
                          Assets.menuFilled,


                              )
                            : Image.asset(
                          Assets.menu,

                              ),
                        settings
                            ? Text("More",
                                style: TextStyle(color: AppColor.orange))
                            : Text("More"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: home ? AppColor.orange : AppColor.placeholder,
                onPressed: () {
                  if (!home) {
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName);
                  }
                },
                child: Image.asset(
                    Assets.homeWhite,

                 ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(
      size.width * 0.375,
      0,
      size.width * 0.375,
      size.height * 0.1,
    );
    path.cubicTo(
      size.width * 0.4,
      size.height * 0.9,
      size.width * 0.6,
      size.height * 0.9,
      size.width * 0.625,
      size.height * 0.1,
    );
    path.quadraticBezierTo(
      size.width * 0.625,
      0,
      size.width * 0.7,
      0.1,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
