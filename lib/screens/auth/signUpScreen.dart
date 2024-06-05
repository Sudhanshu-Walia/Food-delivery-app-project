import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../const/colors.dart';
import '../../utils/assets.dart';
import '../../utils/helper.dart';
import '../../utils/shared_pref_helper.dart';
import '../../widgets/customTextInput.dart';
import 'loginScreen.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  static const routeName = '/signUpScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: screenWidth(context)*0.4,
                  child: Image.asset(
                    Assets.signUp,
                  ),
                ),
                yHeight(5),
                Text(
                  "Create Account",
                  // style: Helper.getTheme(context).headline6,
                ),
                yHeight(5),
                Text(
                  "Add your details to create account",
                ),
                yHeight(20),
                CustomTextInput( hintText: "Name",controller: name,),

                emailField("", email),
                yHeight(25),
                CustomTextInput( hintText: "Mobile No",keyboardType: TextInputType.number,maxLength: 10,),
                yHeight(25),
                CustomTextInput( hintText: "Address"),

                passwordField("", password),
                yHeight(40),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState?.validate() ?? false){
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      }
                    },
                    child: Text("Sign Up", style: TextStyle(color: Colors.white)),

                  ),
                ),
                // Spacer(),
                yHeight(20),
                GestureDetector(
                  onTap: () async{
                    SharedPrefHelper helper = await SharedPrefHelper.getInstance();
                    await helper.saveUserEmail(email.text);
                    await helper.saveUserPassword(password.text);
                    await helper.saveUser(name.text);
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an Account?",
                          style: TextStyle(color: Colors.black)),
                      Text(
                        " Login",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                yHeight(20),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
