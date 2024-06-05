import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Food_delivery_App/const/colors.dart';
import 'package:Food_delivery_App/utils/helper.dart';
import 'package:Food_delivery_App/widgets/customNavBar.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/notiScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                              children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Notifications",
                          // style: Helper.getTheme(context).headline5,
                        ),
                      ),
                      Image.asset(
                        Helper.getAssetName("cart.png", "virtual"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NotiCard(
                    title: "Your order has been picked up",
                    time: "Now",
                  ),
                  NotiCard(
                    title: "Your order has been delivered",
                    time: "1 h ago",
                    color: AppColor.placeholderBg,
                  ),
                  NotiCard(
                    title: "Lorem ipsum dolor sit amet",
                    time: "3 h ago",
                  ),
                  NotiCard(
                    title: "Lorem ipsum dolor sit amet, consectetur",
                    time: "5 h ago",
                  ),
                  NotiCard(
                    title: "Lorem ipsum dolor sit amet, consectetur",
                    time: "05 Sep 2020",
                    color: AppColor.placeholderBg,
                  ),
                  NotiCard(
                    title: "Lorem ipsum dolor sit amet, consectetur",
                    time: "12 Aug 2020",
                    color: AppColor.placeholderBg,
                  ),
                  NotiCard(
                    title: "Lorem ipsum dolor sit amet, consectetur",
                    time: "20 Jul 2020",
                  ),
                  NotiCard(
                    title: "Lorem ipsum dolor sit amet, consectetur",
                    time: "12 Jul 2020",
                  ),
                              ],
                            ),
                ),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: CustomNavBar(
                menu: true,
              ))
        ],
      ),
    );
  }
}

class NotiCard extends StatelessWidget {

  final String time;
  final String title;
  final Color color;
  const NotiCard({

    this.color = Colors.white, required this.time, required this.title,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: Border(
          bottom: BorderSide(
            color: AppColor.placeholder,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.orange,
            radius: 5,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColor.primary,
                  ),
                  overflow: TextOverflow.ellipsis,
            
            
                ),
                Text(time),
              ],
            ),
          )
        ],
      ),
    );
  }
}
