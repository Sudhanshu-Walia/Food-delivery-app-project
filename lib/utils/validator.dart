import 'dart:ffi';

class Validator{

  static String error='';


  static emailPassWordValidator({required String email, required String password})
  {
    if(email.isEmpty){
      error='Please Enter Your Email';
      return false;
    }else if(password.isEmpty){
      error='Please Enter your password';
      return false;
    }else if(password.length<8){
      error='Please enter minimum password of 8 charcaters';
      return false;
    }else{
      error='';
      return true;
    }
  }

}