import 'package:clothes_store_mobile_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../custom/widgets/app_bar_widget.dart';
import '../../../../l10n/l10n.dart';

class PaymentSuccessView extends StatefulWidget {
  const PaymentSuccessView({super.key});

  @override
  State<PaymentSuccessView> createState() => _PaymentSuccessViewState();
}

class _PaymentSuccessViewState extends State<PaymentSuccessView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(title: S.of(context).pay),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: ColorConstants.primaryDark70,
                size: 100,
              ),
              Text(
                S.of(context).paymentSuccess,
                style: TextStyleConstant.boldDark40.copyWith(
                  color: ColorConstants.neutralLight120,
                ),
              ),
              Text(
                S.of(context).thankYouForShopping,
                style: TextStyleConstant.lightLight20.copyWith(
                  color: ColorConstants.neutralLight90,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(
                color: ColorConstants.neutralLight60,
                width: 1,
              ),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: ColorConstants.primaryDark70,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    S.of(context).viewOrder,
                    style: TextStyleConstant.lightDark26.copyWith(
                      color: ColorConstants.primaryLight10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: ColorConstants.neutralLight10,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).backToHome,
                      style: TextStyleConstant.lightDark26.copyWith(
                        color: ColorConstants.primaryDark70,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, AppRoutes.HOME);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
