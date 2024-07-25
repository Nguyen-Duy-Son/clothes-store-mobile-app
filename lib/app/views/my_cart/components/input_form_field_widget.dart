import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/text_style.dart';
import '../../../l10n/l10n.dart';

class InputFormFieldWidget extends StatefulWidget {
  const InputFormFieldWidget({super.key, required this.read, required this.onTap, required  this.voucherController});
  final bool read;
  final VoidCallback onTap;
  final TextEditingController voucherController;
  @override
  State<InputFormFieldWidget> createState() => _InputFormFieldWidgetState();
}

class _InputFormFieldWidgetState extends State<InputFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: ColorConstants.neutralLight80,
        ),
      ),
      child: TextFormField(
        onTap: widget.onTap,
        readOnly: widget.read,
        decoration: InputDecoration(
          hintText: S.of(context).enterCode,
          hintStyle: TextStyleConstant.lightLight22.copyWith(
            color: ColorConstants.neutralLight80,
          ),
          contentPadding:
          EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
          suffixIcon: GestureDetector(
            onTap: () {
              widget.read==true?context.read<CheckOutCubit>().applyVoucher(widget.voucherController.text):null;
              widget.read!=true?Navigator.pop(context):null;
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              margin: EdgeInsets.only(right: 4.w),
              decoration: BoxDecoration(
                color: ColorConstants.primaryDark70,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                textAlign: TextAlign.center,
                S.of(context).apply,
                style: TextStyleConstant.lightLight20.copyWith(
                  color: ColorConstants.primaryLight10,
                ),
              ),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        controller: widget.voucherController,
      ),
    );

  }
}
