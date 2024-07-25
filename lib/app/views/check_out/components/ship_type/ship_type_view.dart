import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../cubits/check_out/check_out_state.dart';
import '../../../../cubits/my_cart/my_cart_state.dart';
import '../../../../custom/function/function.dart';
import '../../../../custom/widgets/app_bar_widget.dart';
import '../../../../l10n/l10n.dart';

class ShipTypeView extends StatefulWidget {
  const ShipTypeView({super.key, required this.checkOutState, required this.myCardState, required this.onShippingSelected});
  final CheckOutState checkOutState;
  final MyCartState myCardState;
  final Function(int) onShippingSelected;

  @override
  State<ShipTypeView> createState() => _ShipTypeViewState();
}

class _ShipTypeViewState extends State<ShipTypeView> {
  String? selectedShippingId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(title: S.of(context).chooseShippingType),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ListView.builder(
            itemCount: widget.checkOutState.shippings.length,
            itemBuilder: (context, index) {
              final shipping = widget.checkOutState.shippings[index];
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        shipping.icon,
                        color: ColorConstants.neutralLight120,
                        width: 24,
                        height: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shipping.name,
                            style: TextStyleConstant.lightLight20.copyWith(
                              color: ColorConstants.neutralLight120,
                              height: 0.9,
                            ),
                          ),
                          Text(
                            "${FunctionClass.formatDateTime(shipping.timeStart)} - ${FunctionClass.formatDateTime(shipping.timeEnd)} | ${shipping.cost} \$",
                            style: TextStyleConstant.lightLight20.copyWith(
                              color: ColorConstants.neutralLight90,
                              height: 0.9,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Radio(
                        value: shipping.id,
                        groupValue: selectedShippingId,
                        onChanged: (value) {
                          setState(() {
                            selectedShippingId = value as String;
                          });
                          widget.onShippingSelected(index);
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
              if (selectedShippingId != null) {
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
      ),
    );
  }
}
