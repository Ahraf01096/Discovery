import 'package:discovery/features/auth/presintation/views/register.dart';
import 'package:discovery/utils/constants.dart';
import 'package:discovery/utils/styles.dart';
import 'package:discovery/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:discovery/components/password_text_field.dart';
import 'package:discovery/components/text_form_builder.dart';
import 'package:discovery/utils/validation.dart';
import 'package:discovery/features/auth/presintation/view_model/login_view_model.dart';
import 'package:discovery/widgets/indicators.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return LoadingOverlay(
      progressIndicator: circularProgress(context),
      isLoading: viewModel.loading,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        key: viewModel.scaffoldKey,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 5),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Let\'s Sign You In',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff27678a),
                ),
              ),
            ),
            Center(
              child: Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: Color(0xff27678a),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            buildForm(context, viewModel),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: Styles.textStyle14.copyWith(color: Color(0xFF9593a8))
                ),
                SizedBox(width: 5.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Color(0xff3e97bd),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildForm(BuildContext context, LoginViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormBuilder(
            textInputType: TextInputType.emailAddress,
            enabled: !viewModel.loading,
            prefix: Ionicons.mail_outline,
            hintText: "Email",
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validateEmail,
            onSaved: (String val) {
              viewModel.setEmail(val);
            },
            focusNode: viewModel.emailFN,
            nextFocusNode: viewModel.passFN,
          ),
          SizedBox(height: 15.0),
          PasswordFormBuilder(
            textInputType: TextInputType.visiblePassword,
            enabled: !viewModel.loading,
            prefix: Ionicons.lock_closed_outline,
            suffix: Ionicons.eye_off_outline,
            hintText: "Password",
            textInputAction: TextInputAction.done,
            validateFunction: Validations.validatePassword,
            submitAction: () => viewModel.login(context),
            obscureText: true,
            onSaved: (String val) {
              viewModel.setPassword(val);
            },
            focusNode: viewModel.passFN,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () => viewModel.forgotPassword(context),
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Color(0xFF9593a8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.0),
          CustomButton(
            backgroundColor: Constants.kSecondColor,
            textColor: Colors.white,
            text: 'Login',
            width: 180,
            onPressed: () {
              viewModel.login(context);
            },
          ),

        ],
      ),
    );
  }
}
