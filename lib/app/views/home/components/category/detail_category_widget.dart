import 'package:clothes_store_mobile_app/app/cubits/product_by_category/product_by_category_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/product_by_category/product_by_category_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../models/category_model.dart';
import '../../../../models/product_model.dart';

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
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Container(
              child: Text(
                widget.category.name,
                style: TextStyleConstant.regularLight32.copyWith(
                  color: ColorConstants.neutralLight120,
                ),
              ),
            ),
            centerTitle: true,
          ),
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
class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required this.e});
  final Product e;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isFavourite = false;
  void toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.w),
                child: Image.network(
                  widget.e.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4.h,
                right: 4.w,
                child: GestureDetector(
                  child: Container(
                    width: 30.w,
                    height: 30.w,
                    decoration: BoxDecoration(
                      color: ColorConstants.neutralLight10,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      Assets.icons.heart,
                      width: 16.w,
                      height: 16.h,
                      color: !isFavourite?ColorConstants.neutralLight70:ColorConstants.accentRed,
                    ),
                  ),
                  onTap: ()=>toggleFavourite(),
                ),
              ),
            ],
          ),
          Stack(
              clipBehavior: Clip.none,
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Text(
                          widget.e.name,
                          style: TextStyleConstant.lightLight24.copyWith(
                            color: ColorConstants.neutralLight120,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                        children:[
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.h, right: 4.w),
                            child: SvgPicture.asset(
                              Assets.icons.star,
                              width: 12.w,
                              height: 12.h,
                            ),
                          ),
                          Text(
                            double.parse(widget.e.rating).toString(),
                            style: TextStyleConstant.lightLight24.copyWith(
                              color: ColorConstants.neutralLight120,
                            ),
                          ),
                        ]
                    )
                  ],
                ),
                Positioned(
                  top: 20.h,
                  child: Text(
                    "\$${widget.e.price.toDouble().toStringAsFixed(2)}",
                    style: TextStyleConstant.regularLight30.copyWith(
                      color: ColorConstants.neutralLight120,
                    ),
                  ),
                ),
              ]
          ),
        ],
      ),
    );
  }
}