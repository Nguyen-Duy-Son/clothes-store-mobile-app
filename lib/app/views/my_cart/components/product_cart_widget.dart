import 'package:clothes_store_mobile_app/app/cubits/my_cart/my_cart_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/my_cart/my_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/assets.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_style.dart';
import '../../../l10n/l10n.dart';
import '../../../models/product_cart.dart';

class ProductOfCart extends StatefulWidget {
  const ProductOfCart(
      {super.key,
      required this.product,
      required this.onDismissed,
      required this.onRemove,
      required this.onAdd});

  final ProductCart product;
  final VoidCallback onDismissed;
  final VoidCallback onRemove;
  final VoidCallback onAdd;

  @override
  State<ProductOfCart> createState() => _ProductOfCartState();
}

class _ProductOfCartState extends State<ProductOfCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCartCubit, MyCartState>(
      builder: (context, state) {
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
                      // onTap: ()=>widget.onRemove(),
                      onTap: () {
                        if (widget.product.count == 1) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 160.h,
                                  width: 400.w,
                                  child: Dialog(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.w),
                                          child: Center(
                                            child: Text(
                                              S.of(context).titleDialogRemove,
                                              textAlign: TextAlign.center,
                                              style: TextStyleConstant.lightLight26.copyWith(
                                                color: ColorConstants.neutralLight120,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 40.h,
                                          padding: EdgeInsets.only(left: 24.w, right: 24.w),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: ColorConstants.neutralLight70,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 100.w,
                                                alignment: Alignment.center,
                                                child: GestureDetector(
                                                  child: Text(
                                                      S.of(context).cancel,
                                                      style: TextStyleConstant.lightLight24,
                                                      textAlign: TextAlign.center,
                                                  ),
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              Container(
                                                width: 1,
                                                color: ColorConstants.neutralLight70,
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: GestureDetector(
                                                  child: Text(
                                                    S.of(context).delete,
                                                    style: TextStyleConstant.lightLight24.copyWith(
                                                      color: ColorConstants.accentRed,
                                                    ),textAlign: TextAlign.center,
                                                    ),
                                                  onTap: () async {
                                                    Navigator.of(context).pop();
                                                    widget.onDismissed();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );

                        } else {
                          widget.onRemove();
                        }
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
                      onTap: () => widget.onAdd(),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
// showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return AlertDialog(
//       content: Text(
//         S
//           .of(context)
//           .titleDialogRemove,
//           style: TextStyleConstant.regularLight26
//               .copyWith(
//             color: ColorConstants.neutralLight120,
//           ),
//         textAlign: TextAlign.center,
//       ),
//       actions: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               child: Text(S
//                   .of(context)
//                   .cancel),
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             VerticalDivider(
//               color: ColorConstants.neutralLight70,
//               thickness: 1,
//             ),
//             GestureDetector(
//               child: Text(S
//                   .of(context)
//                   .delete),
//               onTap: () async {
//                 Navigator.of(context).pop();
//                 widget.onDismissed();
//               },
//             ),
//           ]
//         )
//       ],
//     );
//   },
// );