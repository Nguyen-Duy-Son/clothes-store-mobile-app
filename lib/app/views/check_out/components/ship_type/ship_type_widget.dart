import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_cubit.dart';
import 'package:clothes_store_mobile_app/app/custom/function/function.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/ship_type/ship_type_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../cubits/check_out/check_out_state.dart';
import '../../../../cubits/my_cart/my_cart_state.dart';
import '../../../../l10n/l10n.dart';

class ShipTypeWidget extends StatefulWidget {
  const ShipTypeWidget(
      {super.key, required this.checkOutState, required this.myCardState});

  final CheckOutState checkOutState;
  final MyCartState myCardState;

  @override
  State<ShipTypeWidget> createState() => _ShipTypeWidgetState();
}

class _ShipTypeWidgetState extends State<ShipTypeWidget> {
  int index = 0;

  void onShippingSelected(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckOutCubit, CheckOutState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).chooseShippingType,
                style: TextStyleConstant.lightLight28.copyWith(
                  color: ColorConstants.neutralLight120,
                  height: 0.9,
                ),
              ),
              SizedBox(height: 4.h), // Add SizedBox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    widget.checkOutState.shippings[index].icon,
                    color: ColorConstants.neutralLight120,
                    width: 24,
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.checkOutState.shippings[index].name,
                        style: TextStyleConstant.lightLight20.copyWith(
                          color: ColorConstants.neutralLight120,
                          height: 0.9,
                        ),
                      ),
                      Text(
                        "${FunctionClass.formatDateTime(widget.checkOutState.shippings[index].timeStart)} - ${FunctionClass.formatDateTime(widget.checkOutState.shippings[index].timeEnd)} | ${widget.checkOutState.shippings[index].cost} \$",
                        style: TextStyleConstant.lightLight20.copyWith(
                          color: ColorConstants.neutralLight90,
                          height: 0.9,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShipTypeView(
                            checkOutState: widget.checkOutState,
                            myCardState: widget.myCardState,
                            onShippingSelected: onShippingSelected,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 4.h, left: 20.w),
                      alignment: Alignment.centerRight,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstants.neutralLight70,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        S.of(context).change,
                        style: TextStyleConstant.lightLight20.copyWith(
                          color: ColorConstants.primaryLight110,
                          height: 0.9,
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
          ),
        );
      },
    );
  }
}
