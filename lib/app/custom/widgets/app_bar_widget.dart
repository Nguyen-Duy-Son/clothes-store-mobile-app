import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';

class AppBarWidget extends PreferredSize {
  final String title;
  final bool isBackButton;
  AppBarWidget({required this.title, this.isBackButton = true})
      : super(
    preferredSize: Size.fromHeight(52.h),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorConstants.neutralLight80.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: AppBar(
        automaticallyImplyLeading: isBackButton,
        leading:isBackButton? Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: BackButton(
            color: ColorConstants.neutralLight120,
          ),
        ):null,
        title: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: Text(
            title,
            style: TextStyleConstant.lightLight28.copyWith(
              color: ColorConstants.neutralLight120,
              height: 0.9,
            ),
          ),
        ),
        centerTitle: true,
      ),
    ),
  );
}
