import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_state.dart';
import 'package:clothes_store_mobile_app/app/cubits/my_cart/my_cart_state.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/voucher/voucher_coupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../l10n/l10n.dart';
import '../input_form_field_widget.dart';

class VoucherWidget extends StatefulWidget {
  const VoucherWidget(
      {super.key, required this.state, required this.voucherController});

  final TextEditingController voucherController;
  final MyCartState state;

  @override
  State<VoucherWidget> createState() => _VoucherWidgetState();
}

class _VoucherWidgetState extends State<VoucherWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckOutCubit, CheckOutState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  S.of(context).discountCode,
                  style: TextStyleConstant.lightLight28.copyWith(
                    color: ColorConstants.neutralLight120,
                  ),
                ),
                SizedBox(width: 20.w), // Add SizedBox
                Expanded(
                  // Add this
                  child: InputFormFieldWidget(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VoucherCoupon(
                                    voucherController: widget.voucherController,
                                  )));
                    },
                    voucherController: widget.voucherController,
                    read: true,
                  ),
                ),
              ],
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
            Container(
              margin: EdgeInsets.only(top: 20.h),
              child: const Divider(
                color: ColorConstants.neutralLight70,
                thickness: 1,
              ),
            ),
            // Column(
            //   children: [
            //     if (state.voucherApplied.id.isNotEmpty &&
            //         state.voucherApplied.code.isNotEmpty)
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 S.of(context).subTotal,
            //                 style: TextStyleConstant.lightLight24.copyWith(
            //                   color: ColorConstants.neutralLight120,
            //                 ),
            //               ),
            //               Text(
            //                 "\$${(state.total).toString()}",
            //                 style: TextStyleConstant.lightLight24.copyWith(
            //                   color: ColorConstants.neutralLight120,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 S.of(context).deliveryFee,
            //                 style: TextStyleConstant.lightLight24.copyWith(
            //                   color: ColorConstants.neutralLight120,
            //                 ),
            //               ),
            //               Text(
            //                 "\$${(state.shipping.cost).toString()}",
            //                 style: TextStyleConstant.lightLight24.copyWith(
            //                   color: ColorConstants.neutralLight120,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 S.of(context).discount,
            //                 style: TextStyleConstant.lightLight24.copyWith(
            //                   color: ColorConstants.neutralLight120,
            //                 ),
            //               ),
            //               Text(
            //                 "- \$${(state.voucherApplied.discount).toString()}",
            //                 style: TextStyleConstant.lightLight24.copyWith(
            //                   color: ColorConstants.neutralLight120,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       )
            //     else
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 S.of(context).subTotal,
            //                 style: TextStyleConstant.lightLight24.copyWith(
            //                   color: ColorConstants.neutralLight120,
            //                 ),
            //               ),
            //               Text(
            //                 "\$${(state.total).toString()}",
            //                 style: TextStyleConstant.lightLight24.copyWith(
            //                   color: ColorConstants.neutralLight120,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 S.of(context).deliveryFee,
            //                 style: TextStyleConstant.lightLight24.copyWith(
            //                   color: ColorConstants.neutralLight120,
            //                 ),
            //               ),
            //               Text(
            //                 "\$${(state.shipping.cost).toString()}",
            //                 style: TextStyleConstant.lightLight24.copyWith(
            //                   color: ColorConstants.neutralLight120,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         Text(
            //           S.of(context).totalPrice,
            //           style: TextStyleConstant.lightLight24.copyWith(
            //             color: ColorConstants.neutralLight120,
            //           ),
            //         ),
            //         Text(
            //           "\$${state.total + state.shipping.cost - state.voucherApplied.discount}",
            //           style: TextStyleConstant.lightLight24.copyWith(
            //             color: ColorConstants.neutralLight120,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // )
          ],
        );
      },
    );
  }
}
