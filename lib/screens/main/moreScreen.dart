import 'package:Food_delivery_App/utils/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:Food_delivery_App/const/colors.dart';
import 'package:Food_delivery_App/screens/setting_screen/aboutScreen.dart';
import 'package:Food_delivery_App/screens/setting_screen/inboxScreen.dart';
import 'package:Food_delivery_App/screens/setting_screen/paymentScreen.dart';
import 'package:Food_delivery_App/utils/helper.dart';
import 'package:Food_delivery_App/widgets/customNavBar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../utils/assets.dart';
import '../auth/loginScreen.dart';
import '../setting_screen/myOrderScreen.dart';
import '../setting_screen/notificationScreen.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = "/moreScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "More",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Image.asset(Assets.cart),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MoreCard(
                        image: Image.asset(Assets.income),
                        name: "Payment Details",
                        handler: () {
                          Navigator.of(context)
                              .pushNamed(PaymentScreen.routeName);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MoreCard(
                        image: Image.asset(Assets.shoppingBag),
                        name: "My Orders",
                        handler: () {
                          Navigator.of(context)
                              .pushNamed(MyOrderScreen.routeName);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MoreCard(
                        image: Image.asset(Assets.noti),
                        name: "Notifications",
                        isNoti: true,
                        handler: () {
                          Navigator.of(context)
                              .pushNamed(NotificationScreen.routeName);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MoreCard(
                        image: Image.asset(Assets.mail),
                        name: "Inbox",
                        handler: () {
                          Navigator.of(context)
                              .pushNamed(InboxScreen.routeName);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MoreCard(
                        image: Image.asset(Assets.info),
                        name: "About Us",
                        handler: () {
                          Navigator.of(context)
                              .pushNamed(AboutScreen.routeName);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MoreCard(
                        image: Image.asset(Assets.user),
                        name: "Logout",
                        handler: () async {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                          SharedPrefHelper pref =
                              await SharedPrefHelper.getInstance();
                          pref.clearAll();
                        },
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Column(
                        children: [
                          RatingBar(
                            glow: false,
                            initialRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full: Image.asset(
                                Assets.heart,
                                color: Colors.red,
                              ),
                              half: Image.asset(
                                Assets.heartHalf,
                                color: Colors.red,
                              ),
                              empty: Image.asset(
                                Assets.heartBorder,
                                color: Colors.red,
                              ),
                            ),
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          yHeight(10),
                          Text("Rate Us")
                        ],
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              settings: true,
            ),
          )
        ],
      ),
    );
  }
}

class MoreCard extends StatelessWidget {
  final String? name;
  final Image image;
  final bool isNoti;
  final Function() handler;

  MoreCard({
    this.name,
    required this.image,
    bool this.isNoti = false,
    required this.handler,
  });
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handler,
      child: Container(
        height: 70,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromRGBO(200, 200, 200, 100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: AppColor.placeholder,
                          ),
                          child: image),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        name ?? "",
                        style: TextStyle(
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: AppColor.placeholderBg,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.secondary,
                      size: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
