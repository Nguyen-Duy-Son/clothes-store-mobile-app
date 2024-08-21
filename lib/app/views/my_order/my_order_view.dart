import 'package:clothes_store_mobile_app/app/cubits/my_order/my_order_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/my_order/my_order_state.dart';
import 'package:clothes_store_mobile_app/app/models/track_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../cubits/track_order/track_order_cubit.dart';
import '../../l10n/l10n.dart';
import '../../models/product_cart.dart';
import 'components/product_order_widget.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MyOrderCubit>().getMyOrder();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: const AppBarMyOrders(),
            body: BlocBuilder<MyOrderCubit, MyOrderState>(
                builder: (context, state) {
              if (state is MyOrderLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MyOrderError) {
                return Center(
                  child: Text(
                    state.message,
                    style: TextStyleConstant.regularLight24.copyWith(
                      color: ColorConstants.neutralLight120,
                    ),
                  ),
                );
              } else if (state is MyOrderLoaded) {
                return TabBarView(
                  children: [
                    _buildTabBarOrder(state, 1),
                    _buildTabBarOrder(state, 2),
                    // _buildTabBarOrder(state, 3),
                  ],
                );
              }
              return const SizedBox();
            })),
      ),
    );
  }
  Widget _buildTabBarOrder(MyOrderState state, int option) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: ListView.builder(
        itemCount: option == 1
            ? state.order.productsActive.length
            : option == 2
                ? state.order.productsCompleted.length
                : state.order.productsCanceled.length,
        itemBuilder: (context, index) {
          // final product =option == 1?
          //     state.order.productsActive[index].productCart
          //         : state.order.productsCanceled[index].productCart;
          return Column(
            children: [
              ProductOrderWidget(myOrderState: state, option: option,index:index),
              const Divider(
                color: ColorConstants.neutralLight70,
                thickness: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}

class AppBarMyOrders extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMyOrders({super.key});

  @override
  Size get preferredSize => Size.fromHeight(92.w);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: const BackButton(
          color: ColorConstants.neutralLight120,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Text(
          S.of(context).myOrders,
          style: TextStyleConstant.lightLight28.copyWith(
            color: ColorConstants.neutralLight120,
            height: 0.9,
          ),
        ),
      ),
      centerTitle: true,
      bottom: TabBar(
        padding: EdgeInsets.zero,
        indicator: UnderlineTabIndicator(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          borderSide:
              BorderSide(width: 4.w, color: ColorConstants.primaryDark70),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.zero,
        labelColor: ColorConstants.primaryDark70,
        unselectedLabelColor: ColorConstants.neutralLight100,
        dividerColor: ColorConstants.neutralLight70,
        tabs: [
          SizedBox(
            width: 1.sw / 3,
            child: Text(
              S.of(context).active,
              style: TextStyle(
                fontSize: 14.sp,
                height: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 1.sw / 3,
            child: Text(
              S.of(context).completed,
              style: TextStyle(
                fontSize: 14.sp,
                height: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 1.sw / 3,
            child: Text(
              S.of(context).canceled,
              style: TextStyle(
                fontSize: 14.sp,
                height: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
//
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
// child: ListView.builder(
// itemCount: state.order.productsActive.length,
// itemBuilder: (context, index) {
// final product = state.order.productsActive[index];
// return Column(
// children: [
// ProductOrderWidget(productCart: product, option: 1),
// const Divider(
// color: ColorConstants.neutralLight70,
// thickness: 1,
// ),
// ],
// );
// },
// ),
// ),
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
// child: ListView.builder(
// itemCount: state.order.productsCompleted.length,
// itemBuilder: (context, index) {
// final product = state.order.productsCompleted[index];
// return Column(
// children: [
// ProductOrderWidget(productCart: product, option: 2),
// const Divider(
// color: ColorConstants.neutralLight70,
// thickness: 1,
// ),
// ],
// );
// },
// ),
// ),
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
// child: ListView.builder(
// itemCount: state.order.productsCanceled.length,
// itemBuilder: (context, index) {
// final product = state.order.productsCanceled[index];
// return Column(
// children: [
// ProductOrderWidget(productCart: product, option: 3),
// const Divider(
// color: ColorConstants.neutralLight70,
// thickness: 1,
// ),
// ],
// );
// },
// ),
// ),