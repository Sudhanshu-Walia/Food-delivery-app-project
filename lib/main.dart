import 'package:Food_delivery_App/screens/main/foodScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Food_delivery_App/screens/auth/signUpScreen.dart';
import 'package:Food_delivery_App/screens/main/offerScreen.dart';
import 'package:Food_delivery_App/screens/setting_screen/aboutScreen.dart';
import 'package:Food_delivery_App/screens/main/changeAddressScreen.dart';
import 'package:Food_delivery_App/screens/main/checkoutScreen.dart';
import 'package:Food_delivery_App/screens/main/dessertScreen.dart';
import 'package:Food_delivery_App/screens/main/homeScreen.dart';
import 'package:Food_delivery_App/screens/setting_screen/inboxScreen.dart';
import 'package:Food_delivery_App/screens/main/individualItem.dart';
import 'package:Food_delivery_App/screens/main/introScreen.dart';
import 'package:Food_delivery_App/screens/main/menuScreen.dart';
import 'package:Food_delivery_App/screens/main/moreScreen.dart';
import 'package:Food_delivery_App/screens/main/profileScreen.dart';
import 'package:Food_delivery_App/screens/setting_screen/myOrderScreen.dart';
import 'package:Food_delivery_App/screens/setting_screen/notificationScreen.dart';
import 'package:Food_delivery_App/screens/setting_screen/paymentScreen.dart';
import 'firebase_option.dart';
import 'screens/splash_screen/spashScreen.dart';
import 'screens/auth/loginScreen.dart';
import 'screens/auth/forgetPwScreen.dart';
import 'screens/auth/sentOTPScreen.dart';
import 'screens/auth/newPwScreen.dart';
import './const/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "RobotoCondensed",
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColor.green,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              AppColor.orange,
            ),
          ),
        ),

      ),
      home: SplashScreen(),
      routes: {
        // LandingScreen.routeName: (context) => LandingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
        SendOTPScreen.routeName: (context) => SendOTPScreen(),
        NewPwScreen.routeName: (context) => NewPwScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
        OfferScreen.routeName: (context) => OfferScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        MoreScreen.routeName: (context) => MoreScreen(),
        DessertScreen.routeName: (context) => DessertScreen(),
        FoodScreen.routeName: (context) => FoodScreen(),
        IndividualItem.routeName: (context) => IndividualItem(),
        PaymentScreen.routeName: (context) => PaymentScreen(),
        NotificationScreen.routeName: (context) => NotificationScreen(),
        AboutScreen.routeName: (context) => AboutScreen(),
        InboxScreen.routeName: (context) => InboxScreen(),
        MyOrderScreen.routeName: (context) => MyOrderScreen(),
        CheckoutScreen.routeName: (context) => CheckoutScreen(),
        ChangeAddressScreen.routeName: (context) => ChangeAddressScreen(),
      },
    );
  }
}
