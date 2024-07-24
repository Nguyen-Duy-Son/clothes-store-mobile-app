import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../cubits/home/home_cubit.dart';
import '../../models/product_model.dart';
import 'detail_product_view.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required this.e});
  final Product e;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  void toggleFavourite(Product p) async{
    BlocProvider.of<HomeCubit>(context).updateFavoriteProductOfUser(p);
    BlocProvider.of<HomeCubit>(context).getHome();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProduct(
              product: widget.e,
            ),
          ),
        );
      },
      child: Padding(
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
                        color: !widget.e.isFavourite?ColorConstants.neutralLight70:ColorConstants.accentRed,
                      ),
                    ),
                    onTap: ()=>toggleFavourite(widget.e),
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
      ),
    );
  }
}