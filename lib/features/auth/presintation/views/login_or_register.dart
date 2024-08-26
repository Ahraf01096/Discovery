import 'package:discovery/features/auth/presintation/views/login.dart';
import 'package:discovery/features/auth/presintation/views/register.dart';
import 'package:discovery/utils/constants.dart';
import 'package:discovery/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/Login or Register.png',),fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomButton(
                backgroundColor: Constants.kSecondColor, textColor: Colors.white, text: 'Login',
              width: 140,
              onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => Login()));
              } ,),
            CustomButton(
              backgroundColor: Constants.kSecondColor,
              width: 140,
              textColor: Colors.white, text: 'Register',
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder:(context) => RegisterScreen()));
              } ,)
          ],
        ),
      ),
    );
  }
}
