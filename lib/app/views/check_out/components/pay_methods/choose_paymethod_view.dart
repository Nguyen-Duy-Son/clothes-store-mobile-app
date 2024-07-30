import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../cubits/check_out/check_out_cubit.dart';
import '../../../../cubits/check_out/check_out_state.dart';
import '../../../../custom/widgets/app_bar_widget.dart';
import '../../../../l10n/l10n.dart';

class ChoosePaymethodView extends StatefulWidget {
  const ChoosePaymethodView({
    super.key,
    required this.checkOutState,
  });

  final CheckOutState checkOutState;

  // final Function(int) onPayMethodSelected;

  @override
  State<ChoosePaymethodView> createState() => _ChoosePaymethodViewState();
}

class _ChoosePaymethodViewState extends State<ChoosePaymethodView> {
  String? selectedPayMethodId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CheckOutCubit, CheckOutState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBarWidget(title: S.of(context).chooseShippingType),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: ListView.builder(
                itemCount: widget.checkOutState.payMethods.length,
                itemBuilder: (context, index) {
                  final payMethod = widget.checkOutState.payMethods[index];
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  payMethod.icon,
                                  // color: ColorConstants.neutralLight110,
                                  width: 24.w,
                                  height: 24.w,
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      payMethod.name,
                                      style: TextStyleConstant.lightLight20
                                          .copyWith(
                                        color: ColorConstants.neutralLight120,
                                        height: 0.9,
                                      ),
                                    ),
                                    if (payMethod.totalMoney != 0.0)
                                      Text(
                                        "${S.of(context).subTotal}: ${payMethod.totalMoney}",
                                        style: TextStyleConstant.lightLight16
                                            .copyWith(
                                          color: ColorConstants.neutralLight90,
                                          height: 1.2,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Radio(
                            value: payMethod.id,
                            groupValue: selectedPayMethodId,
                            onChanged: (value) {
                              setState(() {
                                selectedPayMethodId = payMethod.id;
                              });
                            },
                          ),
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
                },
              ),
            ),
            bottomNavigationBar: Container(
              height: 48.h,
              margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
              decoration: BoxDecoration(
                color: ColorConstants.primaryLight110,
                borderRadius: BorderRadius.circular(50),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: GestureDetector(
                onTap: () {
                  if (selectedPayMethodId != null) {
                    final selectedPayMethod = widget.checkOutState.payMethods
                        .firstWhere((e) => e.id == selectedPayMethodId);
                    print(selectedPayMethodId);
                    if (selectedPayMethod.totalMoney <
                            widget.checkOutState.total +
                                widget.checkOutState.shipping.cost -
                                widget.checkOutState.voucherApplied.discount &&
                        selectedPayMethod.id != 3.toString()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Center(
                            child: Container(
                              alignment: Alignment.center,
                              height: 180.h,
                              child: Dialog(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.w),
                                      child: Center(
                                          child: Text(
                                        S.of(context).insufficientFunds,
                                        textAlign: TextAlign.center,
                                        style: TextStyleConstant.lightLight20
                                            .copyWith(
                                          color: ColorConstants.neutralLight120,
                                        ),
                                      )),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color:
                                                ColorConstants.neutralLight70,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.h),
                                      child: GestureDetector(
                                        child: Center(
                                            child: Text(
                                          S.of(context).agree,
                                          style: TextStyleConstant.lightLight26
                                              .copyWith(
                                            color: ColorConstants.accentRed,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      context
                          .read<CheckOutCubit>()
                          .updatePayMethod(selectedPayMethod);
                      Navigator.pop(context);
                    }
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  S.of(context).apply,
                  style: TextStyleConstant.lightLight26.copyWith(
                    color: ColorConstants.neutralLight10,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
