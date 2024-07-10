import 'package:clothes_store_mobile_app/app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/assets.dart';
import '../../constants/text_style.dart';
import '../../routes/app_routes.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: 1.sw,
            margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 26.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            Assets.images.mauQuanAo,
                            width: 140.w,
                            height: 330.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                Assets.images.anhMau2,
                                width: 120.w,
                                height: 200.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                Assets.images.anhMau3,
                                width: 120.w,
                                height: 120.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 16.h,
                      bottom: 16.h,
                    ),
                    padding: EdgeInsets.zero,
                    child: RichText(
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      text: TextSpan(
                        text: 'The ',
                        style: GoogleFonts.dongle(
                          color: ColorConstants.neutralLight120,
                          fontWeight: FontWeight.w500,
                          fontSize: 42.sp,
                          height: 0.8,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Fashion App ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 42.sp,
                              color: ColorConstants.primaryLight110,
                            ),
                          ),
                          TextSpan(
                            text: 'That Makes You Look Your Best',
                            style: GoogleFonts.dongle(
                              color: ColorConstants.neutralLight120,
                              fontSize: 42.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.dongle(
                        color: ColorConstants.neutralLight90,
                        fontSize: 22.sp,
                        height: 1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, AppRoutes.ONBOARDING);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        top: 12.h,
                        bottom: 12.h,
                      ),
                      margin: EdgeInsets.only(
                        top: 16.h,
                        bottom: 16.h,
                        left: 8.w,
                        right: 8.w,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryLight110,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Let's Get Started",
                        style: GoogleFonts.dongle(
                          color: ColorConstants.primaryLight10,
                          fontWeight: FontWeight.w500,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.dongle(
                          color: ColorConstants.neutralLight120,
                          fontWeight: FontWeight.w500,
                          fontSize: 22.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(
                              context, AppRoutes.SIGNIN);
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.dongle(
                            color: ColorConstants.primaryLight110,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
