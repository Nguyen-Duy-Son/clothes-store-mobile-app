import 'package:clothes_store_mobile_app/app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 26.h),
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
                            'assets/images/mau-quan-ao.jpg',
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
                                'assets/images/anh-mau-2.jpg',
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
                                'assets/images/anh-mau-3.jpg',
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
                        style: TextStyleConstant.regularLight42.copyWith(
                          color: ColorConstants.neutralLight120,
                          height: 0.7,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Fashion App ',
                            style: TextStyleConstant.regularLight42.copyWith(
                              color: ColorConstants.primaryLight110,
                            ),
                          ),
                          TextSpan(
                            text: 'That Makes You Look Your Best',
                            style: TextStyleConstant.regularLight42
                                .copyWith(color: ColorConstants.neutralLight120),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: TextStyleConstant.regularDark20.copyWith(
                        color: ColorConstants.neutralLight90, height: 0.7),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, AppRoutes.ONBOARDING);
                    } ,
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
                        style: TextStyleConstant.regularDark20.copyWith(
                          color: ColorConstants.primaryLight10,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(
                      top: 6.h,
                      bottom: 6.h,
                      left: 32.w,
                      right: 32.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            "Already have an account?",
                            style: TextStyleConstant.lightLight26.copyWith(
                              color: ColorConstants.neutralLight120,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.popAndPushNamed(context, AppRoutes.SIGNIN);
                          },
                          child: Text(
                            'Login',
                            style: TextStyleConstant.lightLight26.copyWith(
                              color: ColorConstants.primaryLight110,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        )
                      ],
                    ),
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
