import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/colors.dart';
import '../../utils/assets.dart';
import '../../utils/helper.dart';
import '../../utils/shared_pref_helper.dart';
import '../../widgets/customNavBar.dart';
import '../../widgets/searchBar.dart';
import 'individualItem.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? user = '';

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    SharedPrefHelper prefs = await SharedPrefHelper.getInstance();
    setState(() {
      user = prefs.getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Good morning ${user ?? "User"}",
                            style: TextStyle(fontSize: 14)),
                        Image.asset(Assets.cart,)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Delivering to", style: TextStyle(fontSize: 12)),
                    DropdownButtonHideUnderline(
                      child: SizedBox(
                        width: 150,
                        child: DropdownButton(
                          value: "current location",
                          items: [
                            DropdownMenuItem(
                              child: Text("Current Location"),
                              value: "current location",
                            ),
                          ],
                          icon: Image.asset(
                            Assets.dropdownFilled,
                          ),
                          // style: Helper.getTheme(context).headline4,
                          onChanged: (_) {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomSearchBar(
                      title: "Search Food",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CategoryCard(
                              image: Image.asset(
                                Assets.rice,
                                fit: BoxFit.cover,
                              ),
                              name: "Indian",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CategoryCard(
                              image: Image.asset(
                                Assets.hamburger2,
                                fit: BoxFit.cover,
                              ),
                              name: "Offers",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CategoryCard(
                              image: Image.asset(
                                Assets.rice2,
                                fit: BoxFit.cover,
                              ),
                              name: "Sri Lankan",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CategoryCard(
                              image: Image.asset(
                                Assets.fruit,
                                fit: BoxFit.cover,
                              ),
                              name: "Italian",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Most Popular",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("View all"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // height: 250,
                      width: double.infinity,
                      // padding: const EdgeInsets.only(left: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            MostPopularCard(
                              image: Image.asset(
                                Assets.pizza4,
                                fit: BoxFit.cover,
                              ),
                              name: "Cafe De Bambaa",
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            MostPopularCard(
                              name: "Burger by Bella",
                              image: Image.asset(

                                Assets.dessert3,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Items",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("View all"),
                        ),
                      ],
                    ),
                    Container(
                      // padding: const EdgeInsets.symmetric(
                      //   horizontal: 20,
                      // ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(IndividualItem.routeName);
                            },
                            child: RecentItemCard(
                              image: Image.asset(
                                Assets.pizza3,
                                fit: BoxFit.cover,
                              ),
                              name: "Mulberry Pizza by Josh",
                            ),
                          ),
                          RecentItemCard(
                              image: Image.asset(
                                Assets.coffee,
                                fit: BoxFit.cover,
                              ),
                              name: "Barita"),
                          RecentItemCard(
                              image: Image.asset(
                                Assets.pizza,
                                fit: BoxFit.cover,
                              ),
                              name: "Pizza Rush Hour"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: CustomNavBar(
                home: true,
              )),
        ],
      ),
    );
  }
}

class RecentItemCard extends StatelessWidget {
  final String name;
  final Image image;
  const RecentItemCard({
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 80,
            height: 80,
            child: image,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                // style: Helper.getTheme(context)
                //     .headline4
                //     ?.copyWith(color: AppColor.primary),
              ),
              Row(
                children: [
                  Text("Cafe"),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      ".",
                      style: TextStyle(
                        color: AppColor.orange,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Western Food"),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    Assets.starFilled,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "4.9",
                    style: TextStyle(
                      color: AppColor.orange,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('(124) Ratings')
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class MostPopularCard extends StatelessWidget {
  final String name;
  final Image image;
  const MostPopularCard({
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 300,
            height: 200,
            child: image,
          ),
        ),
        SizedBox(height: 10),
        Text(
          name,
          // style: Helper.getTheme(context)
          //     .headline4
          //     ?.copyWith(color: AppColor.primary),
        ),
        Row(
          children: [
            Text("Cafe"),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                ".",
                style: TextStyle(
                  color: AppColor.orange,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text("Western Food"),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              Assets.starFilled,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "4.9",
              style: TextStyle(
                color: AppColor.orange,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required Image image,
    required String name,
  })  : _image = image,
        _name = name,
        super();

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 100,
            height: 100,
            child: _image,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          _name,
          // style: Helper.getTheme(context)
          //     .headline4
          //     ?.copyWith(color: AppColor.primary, fontSize: 16),
        ),
      ],
    );
  }
}
