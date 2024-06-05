import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../../widgets/customNavBar.dart';
import '../../widgets/searchBar.dart';

class DessertScreen extends StatelessWidget {
  static const routeName = '/dessertScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: AppColor.primary,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "Desserts",
                                // style: Helper.getTheme(context).headline5,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          Helper.getAssetName("cart.png", "virtual"),
                        ),
                      ],
                    ),
                    yHeight(20),
                    CustomSearchBar(
                      title: "Search Food",
                    ),
                    yHeight(15),
                    DessertCard(
                      image: Image.asset(
                        Helper.getAssetName("apple_pie.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "French Apple Pie",
                      shop: "Minute by tuk tuk",
                      rating: "4.9",
                    ),
                    yHeight(5),
                    DessertCard(
                      image: Image.asset(
                        Helper.getAssetName("dessert2.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "Dark Chocolate Cake",
                      shop: "Cakes by Tella",
                      rating: "4.7",
                    ),
                    yHeight(5),
                    DessertCard(
                      image: Image.asset(
                        Helper.getAssetName("dessert4.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "Street Shake",
                      shop: "Cafe Racer",
                      rating: "4.9",
                    ),
                    yHeight(5),
                    DessertCard(
                      image: Image.asset(
                        Helper.getAssetName("dessert5.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "Fudgy Chewy Brownies",
                      shop: "Minute by tuk tuk",
                      rating: "4.9",
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              menu: true,
            ),
          ),
        ],
      ),
    );
  }
}
