import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_state.dart';
import 'package:clothes_store_mobile_app/app/cubits/my_cart/my_cart_state.dart';
import 'package:clothes_store_mobile_app/app/custom/widgets/app_bar_widget.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/detail_payment_widget.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/order_list_widget.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/pay_methods/payment_success_view.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/ship_address_widget.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/components/voucher/voucher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../l10n/l10n.dart';
import '../../routes/app_routes.dart';
import 'components/pay_methods/paymethods_widget.dart';
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
    return SafeArea(
      child: Scaffold(
          appBar: AppBarWidget(title: S.of(context).checkout),
          body: BlocBuilder<CheckOutCubit, CheckOutState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ShipAddressWidget(),
                      ShipTypeWidget(
                        checkOutState: state,
                        myCardState: widget.state,
                      ),
                      OrderListWidget(state: widget.state),
                      SizedBox(height: 16.h),
                      VoucherWidget(
                        voucherController: _voucherController,
                        state: widget.state,
                      ),
                      PaymethodsWidget(
                        checkOutState: state,
                      ),
                      SizedBox(height: 16.h),
                      DetailPaymentWidget(state: state)
                    ],
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: GestureDetector(
            child: Container(
              decoration: const BoxDecoration(
                color: ColorConstants.primaryDark70,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.w),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
              child: Text(
                S.of(context).pay,
                style: TextStyleConstant.lightLight30.copyWith(
                  color: ColorConstants.neutralLight10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              // context.read<CheckOutCubit>().payment();
              Navigator.popAndPushNamed(context, AppRoutes.PAYMENTSUCCESS);
            },
          )),
    );
  }
}
