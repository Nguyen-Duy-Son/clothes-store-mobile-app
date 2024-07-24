import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/assets.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_style.dart';
import '../../../cubits/my_card/my_card_cubit.dart';
import '../../../l10n/l10n.dart';
import '../../../models/product_card.dart';

class ProductOfCart extends StatefulWidget {
  const ProductOfCart(
      {super.key, required this.product, required this.onDismissed});

  final ProductCart product;
  final VoidCallback onDismissed;

  @override
  State<ProductOfCart> createState() => _ProductOfCartState();
}

class _ProductOfCartState extends State<ProductOfCart> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(widget.product.productId),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () async {
            widget.onDismissed();
          },
          closeOnCancel: true,
        ),
        children: [
          SlidableAction(
            autoClose: true,
            onPressed: (context) async {
              widget.onDismissed();
            },
            borderRadius: BorderRadius.circular(20),
            backgroundColor: ColorConstants.accentRed,
            foregroundColor: ColorConstants.neutralLight10,
            icon: Icons.delete,
            label: S.of(context).delete,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.product.image,
                  width: 100.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyleConstant.regularLight28.copyWith(
                      color: ColorConstants.neutralLight120,
                    ),
                  ),
                  Text(
                    "${S.of(context).size}: ${widget.product.size}",
                    style: TextStyleConstant.regularLight24.copyWith(
                      color: ColorConstants.neutralLight80,
                    ),
                  ),
                  Text(
                    "\$${widget.product.price}",
                    style: TextStyleConstant.regularLight28.copyWith(
                      color: ColorConstants.neutralLight120,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 40.h, right: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.neutralLight70,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: SvgPicture.asset(
                      Assets.icons.remove,
                    ),
                  ),
                  onTap: () {
                    context.read<MyCardCubit>().updateCard(widget.product, 0);
                  },
                ),
                SizedBox(
                  width: 8.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    widget.product.count.toString(),
                    style: TextStyleConstant.regularLight26.copyWith(
                      color: ColorConstants.neutralLight120,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryLight120,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: SvgPicture.asset(
                        Assets.icons.add,
                        color: ColorConstants.neutralLight10,
                      ),
                    ),
                    onTap: () {
                      context.read<MyCardCubit>().updateCard(widget.product, 1);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
