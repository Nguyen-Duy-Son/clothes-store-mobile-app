import 'package:clothes_store_mobile_app/app/custom/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../l10n/l10n.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(title: S.of(context).privacyPolicy),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 12.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  S.of(context).cancelationPolicy,
                  style: TextStyleConstant.lightLight30.copyWith(
                    color: ColorConstants.primaryDark70,
                  ),
                ),
                Text(
                  S.of(context).titleCancelationPolicy,
                  style: TextStyleConstant.lightLight24.copyWith(
                    color: ColorConstants.neutralLight90,
                  ),
                ),
                Text(
                  S.of(context).termsCondition,
                  style: TextStyleConstant.lightLight30.copyWith(
                    color: ColorConstants.primaryDark70,
                  ),
                ),
                Text(
                  S.of(context).titleTermsCondition,
                  style: TextStyleConstant.lightLight24.copyWith(
                    color: ColorConstants.neutralLight90,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
