import 'package:Food_delivery_App/screens/auth/signUpScreen.dart';
import 'package:Food_delivery_App/utils/shared_pref_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../const/colors.dart';
import '../../utils/assets.dart';
import '../main/homeScreen.dart';
import '../../utils/helper.dart';
import 'forgetPwScreen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // function to implement the google signin

// creating firebase instance
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  User? user;
  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print("data=====>${googleUser?.email}");
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      user = userCredential?.user;
    } on FirebaseAuthException catch (e) {
      SnackBar(content: Text(e.toString()));
    }on Exception catch(e){
      print("e==============>##$e");
    }
  }

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool showErrorBorder = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    Helper.getAssetName("login_img.png", "virtual"),
                    scale: 10,
                  ),
                  Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  yHeight(40),
                  Text(
                    'Enter your login credential',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  yHeight(10),
                  emailField("Email", email),
                  yHeight(20),
                  passwordField("Password", password),
                  yHeight(20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPrefHelper helper =
                            await SharedPrefHelper.getInstance();
                        helper.saveUserEmail(email.text);
                        helper.saveUserPassword(password.text);

                        if (_formKey.currentState?.validate() ?? false || (userCredential!=null)) {
                          Navigator.of(context)
                              .pushReplacementNamed(HomeScreen.routeName);
                        }
                      },
                      child:
                          Text("Login", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  yHeight(20),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(ForgetPwScreen.routeName);
                    },
                    child: Text("Forget your password?",
                        style: TextStyle(color: Colors.black)),
                  ),
                  yHeight(100),
                  Text("Login With", style: TextStyle(color: Colors.black)),
                  yHeight(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      loginOption(
                        Image.asset(
                          // Helper.getAssetName(
                          Assets.fbLogo,
                          // "virtual",
                          // ),
                        ),
                      ),
                      loginOption(
                        GestureDetector(
                          onTap: () async {
                            signInWithGoogle();
                          },
                          child: Image.asset(
                            // Helper.getAssetName(
                            Assets.gLogo,
                            // "virtual",
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  yHeight(40),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignUpScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an Account?",
                            style: TextStyle(color: Colors.black)),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColor.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  yHeight(20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget loginOption(Widget widget) {
  return SizedBox(
    height: 60,
    // width: 100,

    child: ClipOval(child: widget),
  );
}
