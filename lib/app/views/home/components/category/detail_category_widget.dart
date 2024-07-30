import 'package:clothes_store_mobile_app/app/cubits/product_by_category/product_by_category_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/product_by_category/product_by_category_state.dart';
import 'package:clothes_store_mobile_app/app/custom/widgets/app_bar_widget.dart';
import 'package:clothes_store_mobile_app/app/views/product/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../models/category_model.dart';

class DetailCategoryWidget extends StatefulWidget {
  const DetailCategoryWidget({super.key, required this.category});
  final Category category;
  @override
  State<DetailCategoryWidget> createState() => _DetailCategoryWidgetState();
}

class _DetailCategoryWidgetState extends State<DetailCategoryWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductByCategoryCubit>().getProductByCategory(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBarWidget(title: widget.category.name, isBackButton: true),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              child: BlocBuilder<ProductByCategoryCubit, ProductByCategoryState>(builder: (context, state) {
                if (state is ProductByCategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ProductByCategoryError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is ProductByCategoryLoaded) {
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
                            return ProductWidget(e:e);
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              }),
            ),
          ),
        ),
    );
  }
}