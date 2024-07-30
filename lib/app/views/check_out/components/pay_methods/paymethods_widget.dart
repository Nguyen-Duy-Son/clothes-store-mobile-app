import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_state.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/pay_methods/choose_paymethod_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../l10n/l10n.dart';

class PaymethodsWidget extends StatefulWidget {
  const PaymethodsWidget({super.key, required this.checkOutState});

  final CheckOutState checkOutState;

  @override
  State<PaymethodsWidget> createState() => _PaymethodsWidgetState();
}

class _PaymethodsWidgetState extends State<PaymethodsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).paymentMethods,
          style: TextStyleConstant.regularLight28.copyWith(
            color: ColorConstants.neutralLight120,
          ),
        ),
        SizedBox(height: 4.h), // Add SizedBox
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  widget.checkOutState.payMethod.icon,
                  width: 24.w,
                  height: 24.w,
                ),
                SizedBox(width: 12.w), // Add SizedBox
                Container(
                  margin: EdgeInsets.only(top: 8.h),
                  child: Text(
                    widget.checkOutState.payMethod.name,
                    style: TextStyleConstant.lightLight24.copyWith(
                      color: ColorConstants.neutralLight120,
                      height: 0.9,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChoosePaymethodView(
                      checkOutState: widget.checkOutState,
                      // onPayMethodSelected: (index) {
                      //   setState(() {
                      //     this.index = index;
                      //   });
                      // },
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 4.h, bottom: 4.h),
                margin: EdgeInsets.only(top: 8.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstants.neutralLight70,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    S.of(context).change,
                    style: TextStyleConstant.lightLight20.copyWith(
                      color: ColorConstants.primaryLight110,
                      height: 0.9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: const Divider(
            color: ColorConstants.neutralLight70,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
