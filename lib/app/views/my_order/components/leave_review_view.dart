import 'package:clothes_store_mobile_app/app/constants/assets.dart';
import 'package:clothes_store_mobile_app/app/models/leave_review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/text_style.dart';
import '../../../cubits/my_order/my_order_cubit.dart';
import '../../../cubits/my_order/my_order_state.dart';
import '../../../custom/widgets/app_bar_widget.dart';
import '../../../l10n/l10n.dart';
import '../../check_out/components/product_order.dart';

class LeaveReviewView extends StatefulWidget {
  const LeaveReviewView({super.key, required this.leaveReview});

  final LeaveReview leaveReview;

  @override
  State<LeaveReviewView> createState() => _LeaveReviewViewState();
}

class _LeaveReviewViewState extends State<LeaveReviewView> {
  List<bool> starSelections = List<bool>.filled(5, false);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(title: S
            .of(context)
            .leaveReview),
        body: BlocBuilder<MyOrderCubit, MyOrderState>(
          builder: (context, state) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductOrder(
                            product: widget.leaveReview.productCart,
                            isReview: true),
                        const Divider(
                          thickness: 1,
                          color: ColorConstants.neutralLight70,
                        ),
                        SizedBox(height: 8.h),
                        Center(
                          child: Text(
                            S
                                .of(context)
                                .titleLeaveReview,
                            style: TextStyleConstant.regularLight34.copyWith(
                              color: ColorConstants.neutralLight120,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        const Divider(
                          thickness: 1,
                          color: ColorConstants.neutralLight70,
                        ),
                        Center(
                          child: Text(
                            S
                                .of(context)
                                .youOverallRating,
                            style: TextStyleConstant.regularLight26.copyWith(
                              color: ColorConstants.neutralLight90,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                5,
                                    (index) {
                                  bool isSelected = false;
                                  return GestureDetector(
                                    child: SvgPicture.asset(
                                      Assets.icons.star,
                                      color: starSelections[index]
                                          ? ColorConstants.accentYellow
                                          : ColorConstants.neutralLight120,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        starSelections[index] = !starSelections[index];
                                      });
                                    },
                                  );
                                }
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        const Divider(
                          thickness: 1,
                          color: ColorConstants.neutralLight70,
                        ),
                        Text(
                          S
                              .of(context)
                              .addDetailedReview,
                          style: TextStyleConstant.regularLight24.copyWith(
                            color: ColorConstants.neutralLight120,
                          ),
                        ),
                        TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: S
                                .of(context)
                                .enterHere,
                            hintStyle: TextStyleConstant.regularLight24.copyWith(
                              color: ColorConstants.neutralLight90,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: ColorConstants.neutralLight90,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: ColorConstants.neutralLight90,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
            );
          },
        ),
      ),
    );
  }
  Widget textReview(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: S
            .of(context)
            .enterHere,
        hintStyle: TextStyleConstant.regularLight24.copyWith(
          color: ColorConstants.neutralLight90,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: ColorConstants.neutralLight90,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: ColorConstants.neutralLight90,
          ),
        ),
      ),
    );
  }
}
