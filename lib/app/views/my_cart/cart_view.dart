import 'package:clothes_store_mobile_app/app/models/product_cart.dart';
import 'package:clothes_store_mobile_app/app/views/check_out/check_out_view.dart';
import 'package:clothes_store_mobile_app/app/views/my_cart/components/product_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../cubits/my_cart/my_cart_cubit.dart';
import '../../cubits/my_cart/my_cart_state.dart';
import '../../custom/widgets/animation_loading.dart';
import '../../l10n/l10n.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<MyCartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(52.h),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorConstants.neutralLight80.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Text(
                  S.of(context).myCart,
                  style: TextStyleConstant.lightLight28.copyWith(
                    color: ColorConstants.neutralLight120,
                    height: 0.9,
                  ),
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocBuilder<MyCartCubit, MyCartState>(
            builder: (context, state) {
              if (state is MyCartLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MyCartError) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is MyCartLoaded) {
                return state.cart.listProducts!.isNotEmpty
                    ? Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.cart.listProducts!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 12.h),
                                  child: Column(
                                    children: [
                                      ProductOfCart(
                                        product:
                                            state.cart.listProducts![index],
                                        onDismissed: () =>
                                            showDiaLog(context, state, index),
                                        onRemove: () => removeCountOfProduct(
                                            state.cart.listProducts![index]),
                                        onAdd: () => addCountOfProduct(
                                            state.cart.listProducts![index]),
                                      ),
                                      const Divider(
                                        color: ColorConstants.neutralLight70,
                                        thickness: 1,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckOutView(
                                      state: state,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 44.h,
                                decoration: BoxDecoration(
                                  color: ColorConstants.primaryLight110,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    S.of(context).proceedToCheckout,
                                    style:
                                        TextStyleConstant.lightLight26.copyWith(
                                      color: ColorConstants.neutralLight10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          S.of(context).noProductInCart,
                          style: TextStyleConstant.lightLight26.copyWith(
                            color: ColorConstants.neutralLight120,
                          ),
                        ),
                      );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  void showDiaLog(BuildContext context, MyCartState state, int index) async {
    final myCardCubit = context.read<MyCartCubit>();
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return const Center(child: AnimationLoading());
      },
    );
    await Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.pop(context);
    });
    myCardCubit.updateCart(state.cart.listProducts![index], 3);
    setState(() {});
  }

  void removeCountOfProduct(ProductCart productCart) {
    context.read<MyCartCubit>().updateCart(productCart, 0);
    setState(() {});
  }

  void addCountOfProduct(ProductCart productCart) {
    context.read<MyCartCubit>().updateCart(productCart, 1);
    setState(() {});
  }
}
