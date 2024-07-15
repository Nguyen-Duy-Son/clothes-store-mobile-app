import 'package:clothes_store_mobile_app/app/datasource/local/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/assets.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../l10n/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? location; // Make location nullable
  final TextEditingController _searchController = TextEditingController();

  Future<void> _selectLocation() async {
    location = await Storage.getLocation() as String;
    if (mounted)
      setState(() {}); // Update the UI if the widget is still in the tree
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).location,
                          style: TextStyleConstant.lightLight24.copyWith(
                            color: ColorConstants.neutralLight100,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.icons.map,
                              width: 20.w,
                              height: 20.h,
                            ),
                            Container(
                              width: 120.w,
                              child: Text(
                                location ?? 'Loading...',
                                // Use a placeholder or loading text
                                maxLines: 1,
                                style: TextStyleConstant.lightLight22.copyWith(
                                  color: ColorConstants.neutralLight120,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SvgPicture.asset(
                              Assets.icons.downArrow,
                              width: 6.w,
                              height: 6.h,
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstants.neutralLight70,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.all(8.w),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          Assets.icons.bell,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: S.of(context).search,
                          hintStyle: TextStyleConstant.lightLight22.copyWith(
                            color: ColorConstants.neutralLight90,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.w), // Adjust padding
                            child: SvgPicture.asset(
                              Assets.icons.search,
                              width: 24.w,
                              height: 24.h,
                              color: ColorConstants.primaryLight110,
                            ),
                          ),
                          filled: true,
                          fillColor: ColorConstants.neutralLight10,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: ColorConstants.neutralLight80,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
