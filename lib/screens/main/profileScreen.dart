import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Food_delivery_App/const/colors.dart';
import 'package:Food_delivery_App/utils/helper.dart';
import 'package:Food_delivery_App/widgets/customNavBar.dart';
import 'package:Food_delivery_App/widgets/customTextInput.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/assets.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profileScreen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;

  Future pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      File? imageTemp = File(pickedImage.path);
      imageTemp = (await croppedImg(imagePath: imageTemp))??File("");
      setState(() {
        image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File?> croppedImg({required File imagePath}) async {
    try {
      CroppedFile? cropImg = await ImageCropper()
          .cropImage(sourcePath: imagePath.path, compressQuality: 100);
      if (cropImg != null) {
        return File(cropImg.path);
      }
      else{
        return null;
      }

    } catch (e) {
      print("crop Img error $e");
    }

    return null;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: screenHeight(context),
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
                              "Profile",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
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
                      ClipOval(
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: (image != null)
                                  ? Image.file(image!)
                                  : Image.asset(
                                      Helper.getAssetName(
                                        "user.jpg",
                                        "real",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 80,
                                color: Colors.black.withOpacity(0.3),
                                child: Image.asset(Helper.getAssetName(
                                    "camera.png", "virtual")),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          pickImage();
                          // setState(() {
                          //
                          // });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Assets.editFilled),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Edit Profile",
                              style: TextStyle(color: AppColor.orange),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomFormImput(
                        label: "Name",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Email",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Mobile No",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Address",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Password",
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Confirm Password",
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      yHeight(60)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              profile: true,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFormImput extends StatelessWidget {
  const CustomFormImput({
    String? label,
    String? value,
    bool isPassword = false,
  })  : _label = label ?? "",
        _value = value ?? "",
        _isPassword = isPassword,
        super();

  final String _label;
  final String _value;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColor.green)),
        hintText: _label,
        contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
      ),
      obscureText: _isPassword,
      initialValue: _value,
      style: TextStyle(
        fontSize: 14,
      ),
    );
  }
}
