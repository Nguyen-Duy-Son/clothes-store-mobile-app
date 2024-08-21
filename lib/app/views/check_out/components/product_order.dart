import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/text_style.dart';
import '../../../l10n/l10n.dart';
import '../../../models/product_cart.dart';

class ProductOrder extends StatefulWidget {
  const ProductOrder({super.key, required this.product, this.isReview = false});
  final bool isReview;
  final ProductCart product;

  @override
  State<ProductOrder> createState() => _ProductOrderState();
}

class _ProductOrderState extends State<ProductOrder> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.product.image,
              width: 100.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
            SizedBox(
              width: 16.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: TextStyleConstant.regularLight24.copyWith(
                    color: ColorConstants.neutralLight120,
                    height: 1.2,
                  ),
                ),
                Text(
                  "${S.of(context).size}: ${widget.product.size}",
                  style: TextStyleConstant.regularLight20.copyWith(
                    color: ColorConstants.neutralLight80,
                    height: 1.2,
                  ),
                ),
                Text(
                  "\$${widget.product.price* widget.product.count}",
                  style: TextStyleConstant.regularLight20.copyWith(
                    color: ColorConstants.neutralLight120,
                    height: 1.2,
                  ),
                ),
                Text(
                  "${S.of(context).quantity}: ${widget.product.count}",
                  style: TextStyleConstant.regularLight20.copyWith(
                    color: ColorConstants.neutralLight120,
                    height: 1.2,
                  ),
                ),

              ],
            ),],
        ),
        if (widget.isReview)
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.primaryDark70,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(top: 60.w),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            child: Text(
              S.of(context).reOrder,
              style: TextStyleConstant.regularLight20.copyWith(
                color: ColorConstants.neutralLight10,
                height: 1.2,
              ),
            ),
          ),
      ],
    );
  }
}
