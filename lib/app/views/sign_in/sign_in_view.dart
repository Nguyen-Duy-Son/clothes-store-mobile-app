import 'package:clothes_store_mobile_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

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
                  'Sign In',
                  style: TextStyleConstant.lightLight42,
                ),
                Text(
                  "Hi Wecome back, you're been missed",
                  style: TextStyleConstant.lightLight22
                      .copyWith(color: ColorConstants.neutralLight90),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyleConstant.lightLight26,
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    hintText: 'example@gmai.com',
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
                SizedBox(height: 16.h), // Add this line
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyleConstant.lightLight26,
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: '********',
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
                                    ? 'assets/icons/eye-open.svg'
                                    : 'assets/icons/eye-closed.svg',
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.all(8.w),
                              child: SvgPicture.asset(
                                'assets/icons/eye-closed.svg',
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyleConstant.lightLight24.copyWith(
                        color: ColorConstants.primaryLight110,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 8.h,
                      bottom: 8.h,
                    ),
                    margin: EdgeInsets.only(
                      top: 12.h,
                      bottom: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstants.primaryLight110,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Sign In",
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
                    _iconButton('assets/icons/logo-apple.svg'),
                    SizedBox(
                      width: 16.w,
                    ),
                    _iconButton('assets/icons/logo-goggle.svg'),
                    SizedBox(
                      width: 16.w,
                    ),
                    _iconButton('assets/icons/logo-facebook.svg',
                        color: Colors.lightBlue),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyleConstant.lightLight24.copyWith(
                          color: ColorConstants.neutralLight120,
                        )),
                    SizedBox(
                      width: 8.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.SIGNUP);
                      },
                      child: Text(
                        'Sign Up',
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
