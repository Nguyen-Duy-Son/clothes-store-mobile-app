import 'package:clothes_store_mobile_app/app/custom/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../cubits/check_out/check_out_cubit.dart';
import '../../../../cubits/check_out/check_out_state.dart';
import '../../../../custom/function/function.dart';
import '../../../../l10n/l10n.dart';
import '../input_form_field_widget.dart';

class VoucherCoupon extends StatefulWidget {
  const VoucherCoupon({super.key, required this.voucherController});

  final TextEditingController voucherController;

  @override
  State<VoucherCoupon> createState() => _VoucherCouponState();
}

class _VoucherCouponState extends State<VoucherCoupon> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: S.of(context).discountCode,
        ),
        body: BlocBuilder<CheckOutCubit, CheckOutState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputFormFieldWidget(
                    onTap: () {},
                    voucherController: widget.voucherController,
                    read: false,
                  ),
                  widget.voucherController.text.isNotEmpty
                      ? (state.voucherApplied.id.isNotEmpty &&
                      state.voucherApplied.code.isNotEmpty
                      ? Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      S.of(context).voucherApplied,
                      style: TextStyleConstant.lightLight22.copyWith(
                        color: ColorConstants.accentGreen,
                      ),
                    ),
                  )
                      : Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      S.of(context).voucherNotApplied,
                      style: TextStyleConstant.lightLight22.copyWith(
                        color: ColorConstants.accentRed,
                      ),
                    ),
                  ))
                      : const SizedBox(),
                  Text(
                    S.of(context).bestOffersForYou,
                    style: TextStyleConstant.lightLight30.copyWith(
                      color:ColorConstants.neutralLight120,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.vouchers.length,
                      itemBuilder: (context, index) {
                        int remainingDays =
                            FunctionClass.calculateRemainingDays(state
                                .vouchers[index].expiryDate
                                .toIso8601String());
                        bool isExpired = remainingDays < 0;
                        return Opacity(
                          opacity: isExpired ? 0.5 : 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorConstants.neutralLight80,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(bottom: 10.h),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    state.vouchers[index].code,
                                    style:
                                        TextStyleConstant.lightLight30.copyWith(
                                      color: isExpired
                                          ? ColorConstants.neutralLight70
                                          : ColorConstants.neutralLight120,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Assets.icons.discount,
                                            color: isExpired
                                                ? Colors.grey
                                                : ColorConstants
                                                    .primaryLight110,
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            '${S.of(context).decrease}: ${state.vouchers[index].discount}\$',
                                            style: TextStyleConstant
                                                .lightLight24
                                                .copyWith(
                                              color: isExpired
                                                  ? ColorConstants
                                                      .neutralLight70
                                                  : ColorConstants
                                                      .neutralLight120,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        isExpired
                                            ? S.of(context).expired
                                            : '${S.of(context).expiresIn}: $remainingDays ngày ',
                                        style: TextStyleConstant.lightLight20
                                            .copyWith(
                                          color: isExpired
                                              ? ColorConstants.neutralLight70
                                              : ColorConstants.neutralLight120,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: isExpired
                                      ? null
                                      : () {
                                          widget.voucherController.text =
                                              state.vouchers[index].code;
                                        },
                                ),
                                isExpired
                                    ? const SizedBox()
                                    : GestureDetector(
                                      child: Container(
                                        width: 1.sw,
                                        decoration: const BoxDecoration(
                                          color: ColorConstants.neutralLight60,
                                        ),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          S.of(context).copyCode,
                                          style: TextStyleConstant
                                              .lightLight28
                                              .copyWith(
                                            color: ColorConstants
                                                .primaryLight110,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(
                                          text: state.vouchers[index].code,
                                        ));
                                      },
                                    ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
//
// class _VoucherCouponState extends State<VoucherCoupon> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBarWidget(
//           title: S.of(context).discountCode,
//         ),
//         body: BlocBuilder<CheckOutCubit, CheckOutState>(
//           builder: (context, state) {
//             return Container(
//               margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
//               child: Column(
//                 children: [
//                   InputFormFieldWidget(
//                     onTap: () {},
//                     voucherController: widget.voucherController,
//                     read: false,
//                   ),
//                   SizedBox(height: 12.h),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: state.vouchers.length,
//                       itemBuilder: (context, index) {
//                         int remainingDays =
//                             FunctionClass.calculateRemainingDays(state
//                                 .vouchers[index].expiryDate
//                                 .toIso8601String());
//                         bool isExpired = remainingDays < 0;
//                         return Opacity(
//                           opacity: isExpired ? 0.5 : 1,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: ColorConstants.neutralLight80,
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             margin: EdgeInsets.only(bottom: 10.h),
//                             child: ListTile(
//                               title: Text(
//                                 state.vouchers[index].code,
//                                 style: TextStyleConstant.lightLight30.copyWith(
//                                   color: isExpired
//                                       ? ColorConstants.neutralLight70
//                                       : ColorConstants.neutralLight120,
//                                 ),
//                               ),
//                               subtitle: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       SvgPicture.asset(
//                                         Assets.icons.discount,
//                                         color: isExpired
//                                             ? Colors.grey
//                                             : ColorConstants.primaryLight110,
//                                       ),
//                                       SizedBox(width: 8.w),
//                                       Text(
//                                         '${S.of(context).decrease}: ${state.vouchers[index].discount}\$',
//                                         style: TextStyleConstant.lightLight24.copyWith(
//                                           color: isExpired
//                                               ? ColorConstants.neutralLight70
//                                               : ColorConstants.neutralLight120,
//                                         ),
//                                       ),
//
//                                     ],
//                                   ),
//                                   Text(
//                                     isExpired
//                                         ? S.of(context).expired
//                                         : '${S.of(context).expiresIn}: $remainingDays ngày ',
//                                     style: TextStyleConstant.lightLight20.copyWith(
//                                       color: isExpired
//                                           ? ColorConstants.neutralLight70
//                                           : ColorConstants.neutralLight120,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               onTap: isExpired
//                                   ? null
//                                   : () {
//                                       widget.voucherController.text =
//                                           state.vouchers[index].code;
//                                     },
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
