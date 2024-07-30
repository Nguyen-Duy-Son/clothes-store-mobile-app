import 'package:clothes_store_mobile_app/app/cubits/my_cart/my_cart_state.dart';
import 'package:clothes_store_mobile_app/app/models/product_cart.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/product_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/text_style.dart';
import '../../../l10n/l10n.dart';

class OrderListWidget extends StatefulWidget {
  const OrderListWidget({super.key, required this.state});
  final MyCartState state;

  @override
  State<OrderListWidget> createState() => _OrderListWidgetState();
}
class _OrderListWidgetState extends State<OrderListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).orderList,
          style: TextStyleConstant.lightLight28.copyWith(
            color: ColorConstants.neutralLight120,
            height: 1.2,
          ),
        ),
        Column(
          children: widget.state.cart.listProducts!.asMap().entries.map(
                (entry) {
              int idx = entry.key;
              ProductCart product = entry.value;
              return Column(
                children: [
                  ProductOrder(product: product),
                  // if (idx != widget.state.cart.listProducts!.length - 1)
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: const Divider(
                        color: ColorConstants.neutralLight70,
                        thickness: 1,
                      ),
                    ),
                ],
              );
            },
          ).toList(),
        )
      ],
    );
  }
}
