import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../l10n/l10n.dart';

class DecriptionProduct extends StatefulWidget {
  const DecriptionProduct({super.key, required this.description});

  final String description;

  @override
  State<DecriptionProduct> createState() => _DecriptionProductState();
}

class _DecriptionProductState extends State<DecriptionProduct> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).productDetail,
          style: TextStyleConstant.boldLight24.copyWith(
            color: ColorConstants.neutralLight120,
          ),
        ),
        Text(
          widget.description,
          style: TextStyleConstant.lightLight20.copyWith(
            color: ColorConstants.neutralLight120,
            height: 0.8,
          ),
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          maxLines: isExpanded ? null : 3,
        ),
        GestureDetector(
          child: Text(isExpanded ? S.of(context).showLess : S.of(context).showMore,
            style: TextStyleConstant.lightLight20.copyWith(
              color: ColorConstants.primaryDark70,
              decoration: TextDecoration.underline,
            ),
          ),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12.h),
          height: 1.h,
          decoration: BoxDecoration(
            color: ColorConstants.neutralLight70,
          ),
        ),
      ],
    );
  }
}