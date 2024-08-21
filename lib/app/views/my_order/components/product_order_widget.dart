import 'package:clothes_store_mobile_app/app/cubits/my_order/my_order_state.dart';
import 'package:clothes_store_mobile_app/app/views/my_order/components/track_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/text_style.dart';
import '../../../l10n/l10n.dart';
import 'leave_review_view.dart';

class ProductOrderWidget extends StatefulWidget {
  const ProductOrderWidget(
      {super.key,
      required this.myOrderState,
      required this.option,
      required this.index});

  final MyOrderState myOrderState;
  final int index;
  final int option;

  @override
  State<ProductOrderWidget> createState() => _ProductOrderWidgetState();
}

class _ProductOrderWidgetState extends State<ProductOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.option == 1
                    ? widget.myOrderState.order.productsActive[widget.index]
                        .productCart.image
                    : widget.option == 2
                        ? widget.myOrderState.order
                            .productsCompleted[widget.index].productCart.image
                        : widget.myOrderState.order
                            .productsCanceled[widget.index].image,
                width: 100.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.option == 1
                      ? widget.myOrderState.order.productsActive[widget.index]
                          .productCart.name
                      : widget.option == 2
                          ? widget.myOrderState.order
                              .productsCompleted[widget.index].productCart.name
                          : widget.myOrderState.order
                              .productsCanceled[widget.index].name,
                  style: TextStyleConstant.regularLight24.copyWith(
                    color: ColorConstants.neutralLight120,
                    height: 1.2,
                  ),
                ),
                Text(
                  "${S.of(context).size}: ${widget.option == 1 ? widget.myOrderState.order.productsActive[widget.index].productCart.size : widget.option == 2 ? widget.myOrderState.order.productsCompleted[widget.index].productCart.size : widget.myOrderState.order.productsCanceled[widget.index].size}",
                  style: TextStyleConstant.regularLight20.copyWith(
                    color: ColorConstants.neutralLight80,
                    height: 1.2,
                  ),
                ),
                Text(
                  "${S.of(context).quantity}: ${widget.option == 1 ? widget.myOrderState.order.productsActive[widget.index].productCart.count : widget.option == 2 ? widget.myOrderState.order.productsCompleted[widget.index].productCart.count : widget.myOrderState.order.productsCanceled[widget.index].count}",
                  style: TextStyleConstant.regularLight20.copyWith(
                    color: ColorConstants.neutralLight120,
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
            onTap: () {
              if (widget.option == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TrackOrderView(trackOrder: widget.myOrderState.order
                                .productsActive[widget.index])));
              } else if (widget.option == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LeaveReviewView(leaveReview: widget.myOrderState.order
                                .productsCompleted[widget.index])));
              }
            },
            child: Container(
                margin: EdgeInsets.only(top: 40.h),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                decoration: BoxDecoration(
                  color: ColorConstants.primaryDark70,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  widget.option == 1
                      ? S.of(context).trackOrder
                      : widget.option == 2
                          ? S.of(context).leaveReview
                          : S.of(context).reOrder,
                  style: TextStyleConstant.regularLight18.copyWith(
                    color: ColorConstants.neutralLight10,
                  ),
                )))
      ],
    );
  }
}
