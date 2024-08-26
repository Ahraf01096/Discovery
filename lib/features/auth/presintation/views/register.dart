import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:discovery/components/password_text_field.dart';
import 'package:discovery/components/text_form_builder.dart';
import 'package:discovery/utils/validation.dart';
import 'package:discovery/features/auth/presintation/view_model/register_view_model.dart';
import 'package:discovery/widgets/indicators.dart';
import 'package:discovery/utils/constants.dart';
import 'package:discovery/widgets/custom_button.dart';
import '../../../../utils/styles.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Country selectedCountry = Country(
      phoneCode: "20",
      countryCode: "EG",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Egypt",
      example: "Egypt",
      displayName: "Egypt",
      displayNameNoCountryCode: "EG",
      e164Key: '');
  @override
  Widget build(BuildContext context) {
    RegisterViewModel viewModel = Provider.of<RegisterViewModel>(context);
    return LoadingOverlay(
      progressIndicator: circularProgress(context),
      isLoading: viewModel.loading,
      child: Scaffold(
        key: viewModel.scaffoldKey,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            Text(
              'Create A New Account',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff27678a),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Please, fill in the Form To Continue.',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: Color(0xff27678a),
              ),
            ),
            SizedBox(height: 40.0),
            buildForm(viewModel, context),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ? ',
                    style: Styles.textStyle14.copyWith(color: Color(0xFF9593a8))
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Login(),
                        ),
                            (route) => false);
                  },
                  child: Text(
                    'Login',
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

  buildForm(RegisterViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormBuilder(
            enabled: !viewModel.loading,
            prefix: Ionicons.person_outline,
            hintText: "Username",
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validateName,
            onSaved: (String val) {
              viewModel.setName(val);
            },
            focusNode: viewModel.usernameFN,
            nextFocusNode: viewModel.emailFN,
          ),
          SizedBox(height: 20.0),
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
            nextFocusNode: viewModel.countryFN,
          ),
          SizedBox(height: 20.0),
          TextFormBuilder(
            textInputType: TextInputType.phone,
            enabled: !viewModel.loading,
            prefix: Icons.phone_enabled_outlined,
            hintText: "phone number",
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validatePhoneNumber,
            onSaved: (String val) {
              viewModel.setCountry(val);
            },
            focusNode: viewModel.countryFN,
            nextFocusNode: viewModel.passFN,
          ),
          SizedBox(height: 20.0),
          PasswordFormBuilder(
            enabled: !viewModel.loading,
            prefix: Ionicons.lock_closed_outline,
            suffix: Ionicons.eye_off_outline,
            hintText: "Password",
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validatePassword,
            obscureText: true,
            onSaved: (String val) {
              viewModel.setPassword(val);
            },
            focusNode: viewModel.passFN,
            nextFocusNode: viewModel.cPassFN,
          ),
          SizedBox(height: 20.0),
          PasswordFormBuilder(
            enabled: !viewModel.loading,
            prefix: Ionicons.lock_open_outline,
            suffix: Ionicons.eye_off_outline,
            hintText: "Confirm Password",
            textInputAction: TextInputAction.done,
            validateFunction: Validations.validatePassword,
            submitAction: () => viewModel.register(context),
            obscureText: true,
            onSaved: (String val) {
              viewModel.setConfirmPass(val);
            },
            focusNode: viewModel.cPassFN,
          ),
          SizedBox(height: 40.0),
          CustomButton(
            backgroundColor: Constants.kSecondColor,
            textColor: Colors.white,
            text: 'Continue',
            width: 180,
            onPressed: () => viewModel.register(context),
          ),

        ],
      ),
    );
  }
}
