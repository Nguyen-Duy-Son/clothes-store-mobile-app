import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../l10n/l10n.dart';

class SelectColor extends StatefulWidget {
  const SelectColor({super.key, required this.colors, required this.onSelectColor, required this.isSelected});
  final Map<String, Color> colors;
  final Function(int) onSelectColor;
  final int isSelected;
  @override
  State<SelectColor> createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text:TextSpan(
            text: "${S.of(context).selectColor}: ",
            style: TextStyleConstant.boldLight24.copyWith(
              color: ColorConstants.neutralLight120,
              height: 0.7,
            ),
            children:[
              TextSpan(
                text: "${widget.colors.keys.toList()[widget.isSelected]}",
                style: TextStyleConstant.boldLight24.copyWith(
                  color: ColorConstants.neutralLight90,
                  height: 0.7,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: widget.colors.entries.map((entry) {
            return GestureDetector(
              onTap: () => widget.onSelectColor(widget.colors.keys.toList().indexOf(entry.key)),
              child: Container(
                width: 24.w,
                height: 24.h,
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  color: entry.value,
                  shape: BoxShape.circle,
                ),
                child: widget.isSelected == widget.colors.keys.toList().indexOf(entry.key)
                    ? Center(
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
