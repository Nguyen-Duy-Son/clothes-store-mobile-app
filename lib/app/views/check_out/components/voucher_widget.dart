import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_state.dart';
import 'package:clothes_store_mobile_app/app/cubits/my_cart/my_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/text_style.dart';
import '../../../custom/function/function.dart';
import '../../../l10n/l10n.dart';
import '../../my_cart/components/input_form_field_widget.dart';

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
                  style: TextStyleConstant.lightLight24.copyWith(
                    color: ColorConstants.neutralLight120,
                  ),
                ),
                SizedBox(width: 10.w), // Add SizedBox
                Expanded(
                  // Add this
                  child: InputFormFieldWidget(
                    onTap: () => showModalSheetVoucher(),
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
            Column(
              children: [
                if (state.voucherApplied.id.isNotEmpty &&
                    state.voucherApplied.code.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).subTotal,
                            style: TextStyleConstant.lightLight24.copyWith(
                              color: ColorConstants.neutralLight120,
                            ),
                          ),
                          Text(
                            "\$${(state.total + state.voucherApplied.discount).toString()}",
                            style: TextStyleConstant.lightLight24.copyWith(
                              color: ColorConstants.neutralLight120,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).discount,
                            style: TextStyleConstant.lightLight24.copyWith(
                              color: ColorConstants.neutralLight120,
                            ),
                          ),
                          Text(
                            "- \$${(state.voucherApplied.discount).toString()}",
                            style: TextStyleConstant.lightLight24.copyWith(
                              color: ColorConstants.neutralLight120,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      S.of(context).totalPrice,
                      style: TextStyleConstant.lightLight24.copyWith(
                        color: ColorConstants.neutralLight120,
                      ),
                    ),
                    Text(
                      "\$${state.total.toString()}",
                      style: TextStyleConstant.lightLight24.copyWith(
                        color: ColorConstants.neutralLight120,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void showModalSheetVoucher() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<CheckOutCubit, CheckOutState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
              child: Column(
                children: [
                  InputFormFieldWidget(
                    onTap: () {},
                    voucherController: widget.voucherController,
                    read: false,
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
                            child: ListTile(
                              title: Text(
                                state.vouchers[index].code,
                                style: TextStyle(
                                  color: isExpired ? Colors.grey : null,
                                ),
                              ),
                              subtitle: Text(
                                isExpired
                                    ? 'Hết hạn'
                                    : 'Hạn hết trong trong: $remainingDays ngày ',
                                style: TextStyle(
                                  color: isExpired ? Colors.grey : null,
                                ),
                              ),
                              trailing: Text(
                                'Giảm: ${state.vouchers[index].discount}\$',
                                style: TextStyle(
                                  color: isExpired ? Colors.grey : null,
                                ),
                              ),
                              onTap: isExpired
                                  ? null
                                  : () {
                                      widget.voucherController.text =
                                          state.vouchers[index].code;
                                    },
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
        );
      },
    );
  }
}
