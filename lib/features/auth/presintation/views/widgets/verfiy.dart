import 'dart:async';
import 'package:discovery/features/auth/data/models/register.dart';
import 'package:discovery/features/auth/presintation/views/widgets/profile_pic.dart';
import 'package:discovery/utils/constants.dart';

import 'package:discovery/utils/firebase.dart';
import 'package:discovery/utils/styles.dart';
import 'package:discovery/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../splash/splash.dart';
import '../register.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (_) => ProfilePicture(),
        ),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.only(
          top: 30.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(backgroundColor: Colors.white, textColor: Constants.kSecondColor, text: 'Back', onPressed: () async {
                await firebaseAuth.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => RegisterScreen(),
                  ),(route) => false,
                );
              },),
              SizedBox(
                height: 30,
              ),
             Center(
               child: Column(
                 children: [
                   Title(
                       color: Color(0xff205065),
                       child: Text(
                           'Authorization',
                           style: Styles.textStyle40.copyWith(color: Constants.kPrimaryColor,fontSize: 35)
                       )),
                   SizedBox(
                     height: 64,
                   ),
                   Text(
                       'We sent an Email verification to  ${auth.currentUser?.email}',
                       textAlign: TextAlign.center,
                       style:Styles.textStyle18
                   ),
                   SizedBox(
                     height: 56,
                   ),
                   SizedBox(height: 16),
                   CircularProgressIndicator(color: Color.fromARGB(255, 62, 151, 189)),
                   SizedBox(height: 16),
                   Padding(
                     padding: EdgeInsets
                         .symmetric(horizontal: 32.0),
                     child: Center(
                       child: Text(
                         'Verifying email....',
                         textAlign: TextAlign.center,
                         style: Styles.textStyle18,
                       ),
                     ),
                   ),
                   SizedBox(height: 57),
                   CustomButton(
                     width: 150,
                     height: 50,
                     backgroundColor: Constants.kSecondColor, textColor: Colors.white, text: 'Resend', onPressed: () {
                     try {
                       FirebaseAuth.instance.currentUser
                           ?.sendEmailVerification();
                     } catch (e) {
                       debugPrint('$e');
                     }
                   },),
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}