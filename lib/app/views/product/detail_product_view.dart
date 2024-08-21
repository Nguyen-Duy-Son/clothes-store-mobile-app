import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/my_cart/my_cart_cubit.dart';
import 'package:clothes_store_mobile_app/app/custom/widgets/app_bar_widget.dart';
import 'package:clothes_store_mobile_app/app/models/shipping_model.dart';
import 'package:clothes_store_mobile_app/app/views/home/components/category/decription_product.dart';
import 'package:clothes_store_mobile_app/app/views/home/components/category/select_color.dart';
import 'package:clothes_store_mobile_app/app/views/home/components/category/select_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../custom/widgets/animation_loading.dart';
import '../../l10n/l10n.dart';
import '../../models/product_cart.dart';
import '../../models/product_model.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key, required this.product});

  final Product product;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  bool isFavourite = false;
  int selectedSize = 0;
  int selectedColor = 0;

  void selectSize(int index) {
    setState(() {
      selectedSize = index;
    });
  }

  void toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  void onSelectColor(int index) {
    setState(() {
      selectedColor = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
        // AppBar(
        //   centerTitle: true,
        //   title: Container(
        //     margin: EdgeInsets.only(top: 8.h),
        //     child: Text(
        //       S.of(context).productDetail,
        //       style: TextStyleConstant.lightLight28.copyWith(
        //         color: ColorConstants.neutralLight120,
        //       ),
        //     ),
        //   ),
        //   actions: [
        //     Container(
        //       padding: EdgeInsets.symmetric(horizontal: 16.w),
        //       child: GestureDetector(
        //         onTap: toggleFavourite,
        //         child: SvgPicture.asset(
        //           Assets.icons.heart,
        //           width: 24.w,
        //           height: 24.h,
        //           color: !isFavourite
        //               ? ColorConstants.neutralLight70
        //               : ColorConstants.accentRed,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        AppBarWidget(title: S.of(context).productDetail, isBackButton: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(widget.product.image),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.name,
                          style: TextStyleConstant.regularLight32.copyWith(
                            color: ColorConstants.neutralLight120,
                          ),
                        ),
                        Row(children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.h, right: 4.w),
                            child: SvgPicture.asset(
                              Assets.icons.star,
                              width: 12.w,
                              height: 12.h,
                            ),
                          ),
                          Text(
                            double.parse(widget.product.rating).toString(),
                            style: TextStyleConstant.lightLight24.copyWith(
                              color: ColorConstants.neutralLight120,
                            ),
                          ),
                        ]),
                      ],
                    ),
                    DecriptionProduct(description: widget.product.description),
                    SelectSize(
                        sizes: widget.product.size,
                        onSelectSize: selectSize,
                        isSelected: selectedSize),
                    SelectColor(
                        colors: widget.product.color,
                        onSelectColor: onSelectColor,
                        isSelected: selectedColor)
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: ColorConstants.neutralLight10,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            border: Border(
              top: BorderSide(
                color: ColorConstants.neutralLight80,
              ),
            ),
          ),
          height: 80.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                child: Column(
                  children: [
                    Text(
                      S.of(context).totalPrice,
                      style: TextStyleConstant.regularLight28.copyWith(
                        color: ColorConstants.neutralLight120,
                        height: 0.7,
                      ),
                    ),
                    Text(
                      '\$${widget.product.price}',
                      style: TextStyleConstant.regularLight34.copyWith(
                        color: ColorConstants.primaryDark70,
                        height: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorConstants.primaryDark70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.bag,
                        width: 24.w,
                        height: 24.h,
                        color: ColorConstants.neutralLight10,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        S.of(context).addToCart,
                        style: TextStyleConstant.regularLight26.copyWith(
                          color: ColorConstants.neutralLight10,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => updateCart(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void updateCart() async{
    ProductCart productCart = ProductCart(
      productId: widget.product.id,
      count: 1,
      name: widget.product.name,
      image: widget.product.image,
      price: widget.product.price.toDouble(),
      size: widget.product.size[selectedSize],
    );
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.transparent, // Đặt màu của lớp phủ thành trong suốt
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
        return Center(child: AnimationLoading());
      },
    );
    await Future.delayed(Duration(milliseconds: 300),(){
      Navigator.pop(context);
    });
    context.read<MyCartCubit>().updateCart(productCart, 1);
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.transparent, // Đặt màu của lớp phủ thành trong suốt
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 100.h,
            width: 28.w,
            color: ColorConstants.neutralLight120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.primaryLight10,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.check,
                    width: 28.w,
                    height: 28.h,
                    color: ColorConstants.primaryDark70,
                  ),
                ),
                SizedBox(height: 16.h),
                Center(
                  child: Text(
                    S.of(context).addProductToCartSuccess,
                    style: TextStyleConstant.lightLight24.copyWith(
                      color: ColorConstants.primaryLight10, height: 0.9,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    await Future.delayed(Duration(milliseconds: 600),(){
      Navigator.pop(context);
    });
  }
}
