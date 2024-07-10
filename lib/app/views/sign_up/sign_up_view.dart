import 'package:clothes_store_mobile_app/app/views/sign_up/verify_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../routes/app_routes.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            margin: EdgeInsets.only(top: 40.h),
            child: Column(
              children: <Widget>[
                Text(
                  'Create Account',
                  style: TextStyleConstant.lightLight42.copyWith(
                    height: 0.9,
                  ),
                ),
                Text(
                  "Fill your information below or register your social account",
                  style: TextStyleConstant.lightLight22.copyWith(
                      color: ColorConstants.neutralLight90, height: 0.9),
                  textAlign: TextAlign.center,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name",
                    style: TextStyleConstant.lightLight26.copyWith(
                      height: 0.9,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'John Doe',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: ColorConstants.neutralLight90),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: ColorConstants.neutralLight90),
                    ),
                  ),
                ),
                SizedBox(height: 8.h), // Add this line
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyleConstant.lightLight26.copyWith(
                      height: 0.9,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'example@gmai.com',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: ColorConstants.neutralLight90),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: ColorConstants.neutralLight90),
                    ),
                  ),
                ),
                SizedBox(height: 8.h), // Add this line
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyleConstant.lightLight26.copyWith(
                      height: 0.9,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    hintText: '********',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: ColorConstants.neutralLight90),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: ColorConstants.neutralLight90),
                    ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: isPasswordVisible
                            ? Padding(
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset(
                            isPasswordVisible
                                ?
                            // 'assets/icons/eye-open.svg'
                            Assets.icons.eyeOpen
                                : Assets.icons.eyeClosed,
                            // 'assets/icons/eye-closed.svg',
                          ),
                        )
                            : Padding(
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset(
                            Assets.icons.eyeClosed,
                          ),
                        ),
                      )
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: checkBoxValue,
                            onChanged: (_) {
                              setState(() {
                                checkBoxValue = !checkBoxValue;
                              });
                            }),
                        Text("Agree with",
                            style: TextStyleConstant.lightLight24.copyWith(
                              color: ColorConstants.neutralLight120,
                            )),
                        SizedBox(
                          width: 4.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Terms & Condition',
                            style: TextStyleConstant.lightLight24.copyWith(
                              color: ColorConstants.primaryLight110,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ]),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, AppRoutes.VERIFYCODE);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VerifyCodeView(email: _emailController.text,))
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 8.h,
                      bottom: 8.h,
                    ),
                    margin: EdgeInsets.only(
                      bottom: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstants.primaryLight110,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyleConstant.regularDark24.copyWith(
                        color: ColorConstants.primaryLight10,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.h,
                      width: 80.w,
                      color: ColorConstants.neutralLight90,
                    ),
                    Text(
                      'Or sign in with',
                      style: TextStyleConstant.lightLight24.copyWith(
                        color: ColorConstants.neutralLight90,
                      ),
                    ),
                    Container(
                      height: 1.h,
                      width: 80.w,
                      color: ColorConstants.neutralLight90,
                    ),
                  ],
                ),
                SizedBox(height: 12.h), // Add this line
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _iconButton(Assets.icons.logoApple),
                    SizedBox(
                      width: 16.w,
                    ),
                    _iconButton(Assets.icons.logoGoogle),
                    SizedBox(
                      width: 16.w,
                    ),
                    _iconButton(Assets.icons.logoFacebook,
                        color: Colors.lightBlue),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        )),
                    SizedBox(
                      width: 8.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, AppRoutes.SIGNIN);
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.primaryLight110,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconButton(String path, {Color? color}) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: ColorConstants.neutralLight10,
        borderRadius: BorderRadius.circular(200),
        border: Border.all(
          color: ColorConstants.neutralLight60,
        ),
      ),
      child: SvgPicture.asset(
        path,
        width: 32.w,
        height: 32.w,
        fit: BoxFit.cover,
        color: color,
      ),
    );
  }
}
