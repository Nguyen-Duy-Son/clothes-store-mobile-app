import 'package:clothes_store_mobile_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int pageIndex = 1;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              padding: EdgeInsets.zero,
              child: GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, AppRoutes.WELCOME);
                },
                child: const Text('Skip'),
              ),
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              pageIndex = index + 1;
            });
          },
          children: [
            PageBoarding(
              title: TitleFirstOnBoarding(context),
              imageUrl: 'assets/images/on_boarding-1.jpg',
            ),
            PageBoarding(
              title: TitleSecondOnBoarding(context),
              imageUrl: 'assets/images/on_boarding-2.jpg',
            ),
            PageBoarding(
              title: TitleThirdOnBoarding(context),
              imageUrl: 'assets/images/on_boarding-3.jpg',
            )
          ],
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
            top: 40.h,
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Row(
            mainAxisAlignment: pageIndex == 1
                ? MainAxisAlignment.end
                : MainAxisAlignment.spaceBetween,
            children: [
              // Left arrow
              if (pageIndex > 1)
                GestureDetector(
                  onTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: ColorConstants.primaryLight10,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: ColorConstants.primaryLight120,
                        width: 1,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/arrow-left.svg',
                      width: 32.w,
                      height: 32.w,
                      color: ColorConstants.primaryLight120,
                    ),
                  ),
                ),
              // Right arrow
              if (pageIndex <= 3)
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: ColorConstants.primaryLight120,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/arrow-right.svg',
                      width: 32.w,
                      height: 32.w,
                      color: ColorConstants.primaryLight10,
                    ),
                  ),
                  onTap: () {
                    if (pageIndex < 3) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.popAndPushNamed(context, AppRoutes.WELCOME);
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageBoarding extends StatefulWidget {
  const PageBoarding({super.key, required this.imageUrl, required this.title});

  final String imageUrl;
  final Widget title;

  @override
  State<PageBoarding> createState() => _PageBoardingState();
}

class _PageBoardingState extends State<PageBoarding> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 24.w,
          right: 24.w,
          child: Image.asset(
            widget.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 1.sw,
            decoration: const BoxDecoration(
              color: ColorConstants.primaryLight10,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.title,
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: TextStyleConstant.regularDark20.copyWith(
                        color: ColorConstants.neutralLight90, height: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget TitleFirstOnBoarding(BuildContext context) {
  return Center(
    child: RichText(
      textAlign: TextAlign.center,
      softWrap: true,
      overflow: TextOverflow.visible,
      text: TextSpan(
        text: 'Samples ',
        style: TextStyleConstant.regularLight42.copyWith(
          color: ColorConstants.primaryLight110,
          height: 0.7,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Shopping Experience',
            style: TextStyleConstant.regularLight42.copyWith(
                // color: ColorConstants.primaryLight110,
                ),
          ),
        ],
      ),
    ),
  );
}

Widget TitleSecondOnBoarding(BuildContext context) {
  return Center(
    child: RichText(
      textAlign: TextAlign.center,
      softWrap: true,
      overflow: TextOverflow.visible,
      text: TextSpan(
        text: 'Wishlist: Where ',
        style: TextStyleConstant.regularLight42.copyWith(
          // color: ColorConstants.primaryLight110,
          height: 0.7,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Fashion Dreams ',
            style: TextStyleConstant.regularLight42.copyWith(
              color: ColorConstants.primaryLight110,
            ),
          ),
          TextSpan(
            text: 'Begin',
            style: TextStyleConstant.regularLight42.copyWith(
                // color: ColorConstants.primaryLight110,
                ),
          ),
        ],
      ),
    ),
  );
}

Widget TitleThirdOnBoarding(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      left: 20.w,
      right: 20.w,
    ),
    child: Center(
      child: RichText(
        textAlign: TextAlign.center,
        softWrap: true,
        overflow: TextOverflow.visible,
        text: TextSpan(
          text: 'Swift ',
          style: TextStyleConstant.regularLight42.copyWith(
            color: ColorConstants.primaryLight110,
            height: 0.7,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'and ',
              style: TextStyleConstant.regularLight42.copyWith(
                  // color: ColorConstants.primaryLight110,
                  ),
            ),
            TextSpan(
              text: 'Reliable ',
              style: TextStyleConstant.regularLight42.copyWith(
                  // color: ColorConstants.primaryLight110,
                  ),
            ),
            TextSpan(
              text: 'Delivery',
              style: TextStyleConstant.regularLight42.copyWith(
                  // color: ColorConstants.primaryLight110,
                  ),
            ),
          ],
        ),
      ),
    ),
  );
}
