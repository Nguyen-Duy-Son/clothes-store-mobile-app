import 'dart:async';

import 'package:clothes_store_mobile_app/app/cubits/home/home_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/home/home_state.dart';
import 'package:clothes_store_mobile_app/app/views/home/components/category/detail_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/assets.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_style.dart';
import '../../../l10n/l10n.dart';
import '../../../models/product_model.dart';
import '../../product/detail_product_view.dart';
import '../../product/product_widget.dart';

class FlashSaleWidget extends StatefulWidget {
  const FlashSaleWidget({super.key});

  @override
  State<FlashSaleWidget> createState() => _FlashSaleWidgetState();
}

class _FlashSaleWidgetState extends State<FlashSaleWidget> {
  int _hours = 3;
  int _minutes = 0;
  int _seconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (mounted) {
          setState(
            () {
              if (_hours == 0 && _minutes == 0 && _seconds == 0) {
                timer.cancel();
              } else {
                if (_seconds == 0) {
                  if (_minutes == 0) {
                    _hours -= 1;
                    _minutes = 59;
                  } else {
                    _minutes -= 1;
                  }
                  _seconds = 59;
                } else {
                  _seconds -= 1;
                }
              }
            },
          );
        } else {
          timer
              .cancel(); // Cancel the timer if the widget is no longer in the tree
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).flashSale,
              style: TextStyleConstant.regularLight34.copyWith(
                color: ColorConstants.neutralLight120,
              ),
            ),
            SizedBox(
              width: 32.w,
            ),
            Text(
              "${S.of(context).closingIn} :",
              style: TextStyleConstant.regularLight22.copyWith(
                color: ColorConstants.neutralLight80,
              ),
            ),
            boxTime(_hours.toString().padLeft(2, '0')),
            Text(
              ":",
              style: TextStyleConstant.regularLight22.copyWith(
                color: ColorConstants.primaryLight110,
              ),
            ),
            boxTime(_minutes.toString().padLeft(2, '0')),
            Text(
              ":",
              style: TextStyleConstant.regularLight22.copyWith(
                color: ColorConstants.primaryLight110,
              ),
            ),
            boxTime(_seconds.toString().padLeft(2, '0')),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is HomeLoaded) {
            var halfLength = (state.products.length / 2).ceil();
            var firstHalf = state.products.sublist(0, halfLength);
            var secondHalf = state.products.sublist(halfLength);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Expanded(
                  child: Column(
                    children: firstHalf.map((e) {
                      return ProductWidget(e:e);
                    }).toList(),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: secondHalf.map((e) {
                      return ProductWidget(e: e);
                    }).toList(),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        }),
      ],
    );
  }
  Widget boxTime(String time) {
    return Container(
      width: 24.w,
      height: 24.h,
      decoration: BoxDecoration(
        color: ColorConstants.primaryLight70,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        time,
        style: TextStyleConstant.regularLight22.copyWith(
          color: ColorConstants.primaryLight110,
        ),
      ),
    );
  }
}
