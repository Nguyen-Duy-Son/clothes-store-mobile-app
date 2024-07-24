import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../l10n/l10n.dart';

class SelectSize extends StatelessWidget {
  const SelectSize({super.key, required this.sizes, required this.onSelectSize, required this.isSelected});
  final List<String> sizes;
  final Function(int) onSelectSize;
  final int isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).selectSize,
          style: TextStyleConstant.boldLight24.copyWith(
            color: ColorConstants.neutralLight120,
            height: 0.7,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            sizes.length,
            (index) => GestureDetector(
              onTap: () {
                onSelectSize(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: isSelected == index
                      ? ColorConstants.primaryDark70
                      : ColorConstants.neutralLight10,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color:  ColorConstants.neutralLight80,
                  ),
                ),
                child: Text(
                  sizes[index],
                  style: TextStyleConstant.lightLight20.copyWith(
                    color: isSelected == index
                        ? ColorConstants.neutralLight10
                        : ColorConstants.primaryDark70,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12.h,)
      ],
    );
  }
}
