import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import '../../../constants/assets.dart';
import '../../../constants/color_constants.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );
  int currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_pageController.page!.round() == _pageController.page!.toInt()) {
        if (_pageController.page! >= 5) {
          _pageController.animateToPage(
            0,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        } else {
          _pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140.h,
          child: PageView(
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (value) {
              // Add this line
              setState(() {
                if(currentPage==5){
                  currentPage=0;
                }
                currentPage = value;
              });
            },
            children: [
              ImagePageView(imageUrl: Assets.images.home1),
              ImagePageView(imageUrl: Assets.images.home2),
              ImagePageView(imageUrl: Assets.images.home3),
              ImagePageView(imageUrl: Assets.images.home4),
              ImagePageView(imageUrl: Assets.images.home5),
              ImagePageView(imageUrl: Assets.images.home7),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Opacity(
          opacity: 0.7,
          child: DotsIndicator(
            // Add this widget
            position: currentPage,
            decorator: const DotsDecorator(
              color: ColorConstants.neutralLight80,
              activeColor: ColorConstants
                  .primaryLight110, // Change this to your desired color
            ),
            dotsCount: 6, // The number of pages in your PageView
          ),
        ),
      ],
    );
  }
}
class ImagePageView extends StatelessWidget {
  const ImagePageView({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.fill,
        width: 100.w,
      ),
    );
  }
}