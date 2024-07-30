import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/check_out/check_out_state.dart';
import 'package:clothes_store_mobile_app/app/datasource/local/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/assets.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_style.dart';
import '../../../l10n/l10n.dart';

class ShipAddressWidget extends StatefulWidget {
  const ShipAddressWidget({super.key});

  @override
  State<ShipAddressWidget> createState() => _ShipAddressWidgetState();
}

class _ShipAddressWidgetState extends State<ShipAddressWidget> {
  String? location; // Make location nullable

  Future<void> _selectLocation() async {
    location = await Storage.getLocation() as String;
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await _selectLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckOutCubit, CheckOutState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h), // Add SizedBox
            Text(
              S.of(context).shippingAddress,
              style: TextStyleConstant.lightLight28.copyWith(
                color: ColorConstants.neutralLight120,
                height: 0.9,
              ),
            ),
            SizedBox(height: 4.h), // Add SizedBox
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  Assets.icons.map,
                  color: ColorConstants.neutralLight120,
                  width: 24,
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).home,
                      style: TextStyleConstant.lightLight20.copyWith(
                        color: ColorConstants.neutralLight120,
                        height: 0.9,
                      ),
                    ),
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        location.toString(),
                        style: TextStyleConstant.lightLight20.copyWith(
                          color: ColorConstants.neutralLight90,
                          height: 0.9,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 12.h, left: 20.w),
                    alignment: Alignment.centerRight,
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorConstants.neutralLight70,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      S.of(context).change,
                      style: TextStyleConstant.lightLight20.copyWith(
                        color: ColorConstants.primaryLight110,
                        height: 0.9,
                      ),
                    ),
                  ),
                )
              ],
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
    );
  }
}
