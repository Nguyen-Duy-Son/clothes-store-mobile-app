import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_state.dart';
import 'package:clothes_store_mobile_app/app/cubits/my_cart/my_cart_state.dart';
import 'package:clothes_store_mobile_app/app/custom/widgets/app_bar_widget.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/order_list_widget.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/ship_address_widget.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/voucher_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../datasource/local/storage.dart';
import '../../l10n/l10n.dart';
import 'components/ship_type/ship_type_widget.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.state});
  final MyCartState state;
  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  final TextEditingController _voucherController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double total = widget.state.cart.listProducts!
        .map((e) => e.price * e.count.toDouble())
        .reduce((value, element) => value + element);
    context.read<CheckOutCubit>().getCheckOut(total);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBarWidget(title: S
          .of(context)
          .checkout),
      body: BlocBuilder<CheckOutCubit, CheckOutState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  const ShipAddressWidget(),
                  ShipTypeWidget(
                    checkOutState: state,
                    myCardState: widget.state,
                  ),
                  // OrderListWidget(state: widget.state),
                  VoucherWidget(
                    voucherController: _voucherController,
                    state: widget.state,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
