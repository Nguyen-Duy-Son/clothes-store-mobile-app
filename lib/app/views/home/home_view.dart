import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/assets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: [
          Padding(
            padding:EdgeInsets.all(10.w),
            child: GestureDetector(
              child: SvgPicture.asset(
                Assets.icons.bell,
                width: 24.w,
                height: 24.h,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Text('Home View'),
      ),
    ));
  }
}
