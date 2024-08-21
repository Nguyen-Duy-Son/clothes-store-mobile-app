import 'package:clothes_store_mobile_app/app/constants/color_constants.dart';
import 'package:clothes_store_mobile_app/app/cubits/my_order/my_order_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/my_order/my_order_state.dart';
import 'package:clothes_store_mobile_app/app/custom/function/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/assets.dart';
import '../../../constants/text_style.dart';
import '../../../custom/widgets/app_bar_widget.dart';
import '../../../l10n/l10n.dart';
import '../../../models/track_order_model.dart';
import '../../check_out/components/product_order.dart';

class TrackOrderView extends StatefulWidget {
  const TrackOrderView({super.key, required this.trackOrder});

  final TrackOrder trackOrder;

  @override
  State<TrackOrderView> createState() => _TrackOrderViewState();
}

class _TrackOrderViewState extends State<TrackOrderView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<MyOrderCubit>().getTrackOrderByProductCartId(widget.trackOrder.productCart.productId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(title: S.of(context).trackOrder),
        body: BlocBuilder<MyOrderCubit, MyOrderState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(children: [
                ProductOrder(product: widget.trackOrder.productCart),
                const Divider(
                  thickness: 1,
                  color: ColorConstants.neutralLight70,
                ),
                SizedBox(height: 12.h),
                orderDetail(context, widget.trackOrder),
                SizedBox(height: 12.h),
                orderStatus(context, widget.trackOrder),
              ]),
            );
          },
        ),
      ),
    );
  }

  Widget orderDetail(BuildContext context, TrackOrder trackOrder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).orderDetail,
          style: TextStyleConstant.regularDark28.copyWith(
            color: ColorConstants.neutralLight120,
            height: 0.9,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).expectedDeliverDate,
              style: TextStyleConstant.lightLight24.copyWith(
                color: ColorConstants.neutralLight90,
                height: 0.9,
              ),
            ),
            Text(
              FunctionClass.formatDateTime(trackOrder.expectedDeliveryDate),
              style: TextStyleConstant.lightLight26.copyWith(
                color: ColorConstants.neutralLight120,
                height: 0.9,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).trackingId,
              style: TextStyleConstant.lightLight24.copyWith(
                color: ColorConstants.neutralLight90,
                height: 0.9,
              ),
            ),
            Text(
              trackOrder.trackingId,
              style: TextStyleConstant.lightLight26.copyWith(
                color: ColorConstants.neutralLight120,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        const Divider(
          thickness: 1,
          color: ColorConstants.neutralLight70,
        ),
      ],
    );
  }
}
Widget orderStatus(BuildContext context, TrackOrder trackOrder) {
  List<bool> orderStatuses = [
    trackOrder.orderPlaced.status,
    trackOrder.inProgress.status,
    trackOrder.shipped.status,
    trackOrder.delivered.status,
  ];
  int count = 0;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        S.of(context).orderStatus,
        style: TextStyleConstant.regularDark28.copyWith(
          color: ColorConstants.neutralLight120,
          height: 0.9,
        ),
      ),
      SizedBox(height: 8.h),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18.w),
            child: Column(
              children: orderStatuses.map((status) {
                count++;
                return Column(
                  children: [
                    if (count != orderStatuses.length + 1 && count != 1)
                      Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        width: 4.w,
                        height: 32.h,
                        color: status != true
                            ? ColorConstants.neutralLight70
                            : ColorConstants.primaryDark70,
                      ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: status
                            ? ColorConstants.primaryDark70
                            : ColorConstants.neutralLight70,
                      ),
                      child: SvgPicture.asset(
                        Assets.icons.check,
                        color: ColorConstants.neutralLight10,
                        width: 20.w,
                        height: 20.w,
                      ),
                    ),
                  ],
                );
              }).toList(growable: false),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildOrderStatusItem(
                  trackOrder: trackOrder,
                  option: 1,
                  date: FunctionClass.formatDateTime(
                      trackOrder.orderPlaced.orderPlacedDate),
                  icon: Assets.icons.order,
                  isCompleted: trackOrder.orderPlaced.status,
                  context: context,
                ),
                _buildOrderStatusItem(
                  trackOrder: trackOrder,
                  option: 2,
                  date: FunctionClass.formatDateTime(
                      trackOrder.inProgress.inProgressDate),
                  icon: Assets.icons.shippingBox,
                  isCompleted: trackOrder.inProgress.status,
                  context: context,
                ),
                _buildOrderStatusItem(
                  trackOrder: trackOrder,
                  option: 3,
                  date: FunctionClass.formatDateTime(
                      trackOrder.shipped.shippedDate),
                  icon: "assets/icons/shipping-fast.svg",
                  isCompleted: trackOrder.shipped.status,
                  context: context,
                ),
                _buildOrderStatusItem(
                  trackOrder: trackOrder,
                  option: 4,
                  date: FunctionClass.formatDateTime(
                      trackOrder.delivered.deliveredDate),
                  icon: "assets/icons/delivery.svg",
                  isCompleted: trackOrder.delivered.status,
                  context: context,
                ),
                SizedBox(height: 8.h),
                const Divider(
                  thickness: 1,
                  color: ColorConstants.neutralLight70,
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildOrderStatusItem({
  required TrackOrder trackOrder,
  required int option,
  required String date,
  required String icon,
  required bool isCompleted,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              option == 1
                  ? S.of(context).orderPlaced
                  : option == 2
                  ? S.of(context).inProcess
                  : option == 3
                  ? S.of(context).shipped
                  : S.of(context).delivered,
              style: TextStyleConstant.regularDark28.copyWith(
                color: ColorConstants.neutralLight120,
                height: 0.9,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              date,
              style: TextStyleConstant.lightLight20.copyWith(
                color: ColorConstants.neutralLight90,
                height: 0.9,
              ),
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset(
          icon,
          color: Colors.brown,
          width: 28.w,
          height: 28.w,
        ),
      ],
    ),
  );
}