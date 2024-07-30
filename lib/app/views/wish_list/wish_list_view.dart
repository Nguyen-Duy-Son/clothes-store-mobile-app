import 'dart:math';

import 'package:clothes_store_mobile_app/app/constants/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets.dart';
import '../../constants/color_constants.dart';
import '../../cubits/home/home_cubit.dart';
import '../../cubits/home/home_state.dart';
import '../../custom/widgets/app_bar_widget.dart';
import '../../l10n/l10n.dart';
import '../../models/product_model.dart';
import '../product/product_widget.dart';


class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getHome();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(title: S.of(context).myWishList, isBackButton: false),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is HomeLoaded) {
              List<Product> products = state.products.where((element) => element.isFavourite).toList();
              var halfLength = (products.length / 2).ceil();
              var firstHalf = products.sublist(0, halfLength);
              var secondHalf = products.sublist(halfLength);
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: SingleChildScrollView(
                  child: Row(
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
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }
}
