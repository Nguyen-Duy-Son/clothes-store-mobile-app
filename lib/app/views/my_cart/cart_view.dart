// import 'package:clothes_store_mobile_app/app/cubits/my_card/my_card_cubit.dart';
// import 'package:clothes_store_mobile_app/app/cubits/my_card/my_card_state.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import '../../constants/assets.dart';
// import '../../constants/color_constants.dart';
// import '../../constants/text_style.dart';
// import '../../l10n/l10n.dart';
// import '../../models/cart_model.dart';
//
// class CartView extends StatefulWidget {
//   const CartView({super.key});
//
//   @override
//   State<CartView> createState() => _CartViewState();
// }
//
// class _CartViewState extends State<CartView> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context.read<MyCardCubit>().getCard();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             automaticallyImplyLeading: false,
//             title: Padding(
//               padding: EdgeInsets.only(top: 10.h),
//               child: Text(
//                 S.of(context).myCart,
//                 style: TextStyleConstant.lightLight28.copyWith(
//                   color: ColorConstants.neutralLight120, height: 0.9,
//                 ),
//               ),
//             ),
//             centerTitle: true,
//           ),
//           body: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: BlocBuilder<MyCardCubit, MyCardState>(
//               builder: (context, state) {
//                 if (state is MyCardLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (state is MyCardError) {
//                   return Center(
//                     child: Text(state.message),
//                   );
//                 } else if (state is MyCardLoaded) {
//                   return ListView.builder(
//                     itemCount: state.cart.listProducts!.length,
//                     itemBuilder: (context, index) {
//                       return ProductOfCart(product: state.cart.listProducts![index]);
//                     },
//                   );
//                 }
//                 return const SizedBox();
//               },
//             ),
//           )
//         )
//
//     );
//   }
// }
// class ProductOfCart extends StatefulWidget {
//   const ProductOfCart({super.key,required this.product,});
//   final ProductCart product;
//   @override
//   State<ProductOfCart> createState() => _ProductOfCartState();
// }
//
// class _ProductOfCartState extends State<ProductOfCart> {
//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//       ,
//       child: Container(
//         child:Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.network(
//                     widget.product.image,
//                     width: 100.w,
//                     height:80.h,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(width: 12.w,),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(widget.product.name,
//                       style: TextStyleConstant.regularLight28.copyWith(
//                         color: ColorConstants.neutralLight120,
//                       ),
//                     ),
//                     Text(
//                       "${S.of(context).size}: ${widget.product.size}",
//                       style: TextStyleConstant.regularLight24.copyWith(
//                         color: ColorConstants.neutralLight80,
//                       ),
//                     ),
//                     Text(
//                       "\$${widget.product.price}",
//                       style: TextStyleConstant.regularLight28.copyWith(
//                         color: ColorConstants.neutralLight120,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 40.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: ColorConstants.neutralLight70,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: SvgPicture.asset(
//                         Assets.icons.remove,
//                       ),
//                     ),
//                     onTap: () {
//                       context.read<MyCardCubit>().updateCard(widget.product, 0);
//                     },
//                   ),
//                   SizedBox(width: 8.w,),
//                   Padding(
//                     padding:EdgeInsets.only(top: 4.h),
//                     child: Text(widget.product.count.toString(),
//                       style: TextStyleConstant.regularLight26.copyWith(
//                         color: ColorConstants.neutralLight120,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8.w,),
//                   GestureDetector(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: ColorConstants.primaryLight120,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: SvgPicture.asset(
//                         Assets.icons.add,
//                         color: ColorConstants.neutralLight10,
//                       ),
//                     ),
//                     onTap: () {
//                       context.read<MyCardCubit>().updateCard(widget.product, 1);
//                     }
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:clothes_store_mobile_app/app/cubits/my_card/my_card_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/my_card/my_card_state.dart';
import 'package:clothes_store_mobile_app/app/views/my_cart/components/input_form_field_widget.dart';
import 'package:clothes_store_mobile_app/app/views/my_cart/components/product_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../custom/widgets/animation_loading.dart';
import '../../l10n/l10n.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final TextEditingController _voucherController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MyCardCubit>().getCard();
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
              automaticallyImplyLeading: true,
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
          child: BlocBuilder<MyCardCubit, MyCardState>(
            builder: (context, state) {
              if (state is MyCardLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MyCardError) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is MyCardLoaded) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.cart.listProducts!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ProductOfCart(
                                product: state.cart.listProducts![index],
                                onDismissed: () =>
                                    showDiaLog(context, state, index),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: const Divider(
                                  color: ColorConstants.neutralLight70,
                                  thickness: 1,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).discountCode,
                            style: TextStyleConstant.lightLight22.copyWith(
                              color: ColorConstants.neutralLight120,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: InputFormFieldWidget(
                              onTap: () => showModalSheetVoucher(state),
                              voucherController: _voucherController,
                              read: true,
                            ),
                          )
                        ],
                      ),
                    ),
                    // _voucherController.text.isNotEmpty
                    //     ? (state.voucherApplied.id.isNotEmpty && state.voucherApplied.code.isNotEmpty
                    //         ? Align(
                    //             alignment: Alignment.centerRight,
                    //             child: Text(
                    //               S.of(context).voucherApplied,
                    //               style:
                    //                   TextStyleConstant.lightLight22.copyWith(
                    //                 color: ColorConstants.accentGreen,
                    //               ),
                    //             ),
                    //           )
                    //         : Align(
                    //             alignment: Alignment.centerRight,
                    //             child: Text(
                    //               S.of(context).voucherNotApplied,
                    //               style:
                    //                   TextStyleConstant.lightLight22.copyWith(
                    //                 color: ColorConstants.accentRed,
                    //               ),
                    //             ),
                    //           ))
                    //     : const SizedBox(),
                    // Column(
                    //   children: [
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       crossAxisAlignment: CrossAxisAlignment.end,
                    //       children: [
                    //         Text(
                    //           S.of(context).totalPrice,
                    //           style: TextStyleConstant.lightLight28.copyWith(
                    //             color: ColorConstants.neutralLight120,
                    //           ),
                    //         ),
                    //         if (state.voucherApplied.id.isNotEmpty && state.voucherApplied.code.isNotEmpty)
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.end,
                    //             children: [
                    //               Text(
                    //                 "\$${(state.total + state.voucherApplied.discount).toString()}",
                    //                 style: TextStyleConstant.lightLight28.copyWith(
                    //                   color: ColorConstants.neutralLight120,
                    //                 ),
                    //               ),
                    //               Text(
                    //                 "- \$${(state.voucherApplied.discount).toString()}",
                    //                 style: TextStyleConstant.lightLight28.copyWith(
                    //                   color: ColorConstants.neutralLight120,
                    //                 ),
                    //               ),
                    //               Text(
                    //                 "\$${state.total.toString()}",
                    //                 style: TextStyleConstant.lightLight28.copyWith(
                    //                   color: ColorConstants.neutralLight120,
                    //                 ),
                    //               ),
                    //             ],
                    //           )
                    //         else
                    //           Text(
                    //             "\$${state.total.toString()}",
                    //             style: TextStyleConstant.lightLight28.copyWith(
                    //               color: ColorConstants.neutralLight120,
                    //             ),
                    //           ),
                    //       ],
                    //     ),
                    //     SizedBox(height: 4.h),
                    //     GestureDetector(
                    //       onTap: () {},
                    //       child: Container(
                    //         height: 44.h,
                    //         decoration: BoxDecoration(
                    //           color: ColorConstants.primaryLight110,
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         child: Center(
                    //           child: Text(
                    //             S.of(context).proceedToCheckout,
                    //             style: TextStyleConstant.lightLight28.copyWith(
                    //               color: ColorConstants.neutralLight10,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  void showDiaLog(BuildContext context, MyCardState state, int index) async {
    final myCardCubit = context.read<MyCardCubit>();
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
    myCardCubit.updateCard(state.cart.listProducts![index], 3);
  }

  int calculateRemainingDays(String expiryDateString) {
    DateTime expiryDate = DateTime.parse(expiryDateString);
    DateTime currentDate = DateTime.now();

    Duration difference = expiryDate.difference(currentDate);

    return difference.inDays;
  }

  void showModalSheetVoucher(MyCardState state) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<MyCardCubit, MyCardState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              child: Column(
                children: [
                  InputFormFieldWidget(
                    onTap: () {},
                    voucherController: _voucherController,
                    read: false,
                  ),
                  _voucherController.text.isNotEmpty
                      ? (state.voucherApplied.id.isNotEmpty && state.voucherApplied.code.isNotEmpty
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                S.of(context).voucherApplied,
                                style:
                                    TextStyleConstant.lightLight22.copyWith(
                                  color: ColorConstants.accentGreen,
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                S.of(context).voucherNotApplied,
                                style:
                                    TextStyleConstant.lightLight22.copyWith(
                                  color: ColorConstants.accentRed,
                                ),
                              ),
                            ))
                      : const SizedBox(),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.vouchers.length,
                      itemBuilder: (context, index) {
                        int remainingDays = calculateRemainingDays(
                            state.vouchers[index].expiryDate.toIso8601String());
                        bool isExpired = remainingDays < 0;
                        return Opacity(
                          opacity: isExpired ? 0.5 : 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorConstants.neutralLight80,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(bottom: 10.h),
                            child: ListTile(
                              title: Text(
                                state.vouchers[index].code,
                                style: TextStyle(
                                  color: isExpired ? Colors.grey : null,
                                ),
                              ),
                              subtitle: Text(
                                isExpired
                                    ? 'Hết hạn'
                                    : 'Hạn hết trong trong: $remainingDays ngày ',
                                style: TextStyle(
                                  color: isExpired ? Colors.grey : null,
                                ),
                              ),
                              trailing: Text(
                                'Giảm: ${state.vouchers[index].discount}\$',
                                style: TextStyle(
                                  color: isExpired ? Colors.grey : null,
                                ),
                              ),
                              onTap: isExpired
                                  ? null
                                  : () {
                                      _voucherController.text =
                                          state.vouchers[index].code;
                                    },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            S.of(context).totalPrice,
                            style: TextStyleConstant.lightLight28.copyWith(
                              color: ColorConstants.neutralLight120,
                            ),
                          ),
                          if (state.voucherApplied.id.isNotEmpty &&
                              state.voucherApplied.code.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$${(state.total + state.voucherApplied.discount).toString()}",
                                  style:
                                      TextStyleConstant.lightLight28.copyWith(
                                    color: ColorConstants.neutralLight120,
                                  ),
                                ),
                                Text(
                                  "- \$${(state.voucherApplied.discount).toString()}",
                                  style:
                                      TextStyleConstant.lightLight28.copyWith(
                                    color: ColorConstants.neutralLight120,
                                  ),
                                ),
                                Text(
                                  "\$${state.total.toString()}",
                                  style:
                                      TextStyleConstant.lightLight28.copyWith(
                                    color: ColorConstants.neutralLight120,
                                  ),
                                ),
                              ],
                            )
                          else
                            Text(
                              "\$${state.total.toString()}",
                              style: TextStyleConstant.lightLight28.copyWith(
                                color: ColorConstants.neutralLight120,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 44.h,
                          decoration: BoxDecoration(
                            color: ColorConstants.primaryLight110,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              S.of(context).proceedToCheckout,
                              style: TextStyleConstant.lightLight28.copyWith(
                                color: ColorConstants.neutralLight10,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
