import 'package:flutter/material.dart';
import 'package:Food_delivery_App/const/colors.dart';
import 'package:Food_delivery_App/utils/helper.dart';
import 'package:Food_delivery_App/widgets/customNavBar.dart';

class OfferScreen extends StatelessWidget {
  static const routeName = "/offerScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Latest Offers",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,                        ),
                        ),
                        Image.asset(
                          Helper.getAssetName("cart.png", "virtual"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [Text("Find discounts, Offer special")],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: Helper.getScreenWidth(context) * 0.4,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("Check Offers")),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    OfferCard(
                      image: Image.asset(
                        Helper.getAssetName("breakfast.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "Cafe de Noires",
                    ),
                    OfferCard(
                      image: Image.asset(
                        Helper.getAssetName("western2.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "Isso",
                    ),
                    OfferCard(
                      image: Image.asset(
                        Helper.getAssetName("coffee3.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "Cafe Beans",
                    ),
                    SizedBox(
                      height: 100,
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
              offer: true,
            ),
          )
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {

  final String name;
  final Image image;
  const OfferCard({
    required this.name,
    required this.image,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(10),child: SizedBox(height: 200, width: double.infinity, child: image)),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  name,
                  // style: Helper.getTheme(context)
                  //     .headline4
                  //     ?.copyWith(color: AppColor.primary),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Image.asset(
                  Helper.getAssetName("star_filled.png", "virtual"),
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
                SizedBox(
                  width: 5,
                ),
                Text("(124 ratings) Cafe"),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    ".",
                    style: TextStyle(
                        color: AppColor.orange, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(" Western Food"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
