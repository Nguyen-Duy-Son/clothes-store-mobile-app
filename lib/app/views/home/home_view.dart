import 'package:clothes_store_mobile_app/app/cubits/home/home_cubit.dart';
import 'package:clothes_store_mobile_app/app/datasource/local/storage.dart';
import 'package:clothes_store_mobile_app/app/views/my_cart/cart_view.dart';
import 'package:clothes_store_mobile_app/app/views/home/components/category/category_widget.dart';
import 'package:clothes_store_mobile_app/app/views/home/components/flash_sale_widget.dart';
import 'package:clothes_store_mobile_app/app/views/home/components/page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/assets.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../l10n/l10n.dart';
import '../wish_list/wish_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  String? location; // Make location nullable

  late TabController _tabController;
  int currentPage = 0;

  Future<void> _selectLocation() async {
    location = await Storage.getLocation() as String;
    if (mounted)
      setState(() {});
  }
  bool _hideBottomNavBar = false;
  int pageBody = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await _selectLocation();
    });
    context.read<HomeCubit>().getHome();
    _tabController = TabController(vsync: this, length: 5);
  }

  final List<String> _icons = [
    Assets.icons.home,
    Assets.icons.bag,
    Assets.icons.heart,
    Assets.icons.message,
    Assets.icons.person,
  ];
  List<Widget> _bodyView = <Widget>[
    CartView(),
    WishListView(),
    CartView(),
    CartView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: _tabController.index==0?BodyHome(location: location,):_bodyView[_tabController.index-1],
          bottomNavigationBar: Container(
            height: 76.h,
            padding: EdgeInsets.symmetric(
              vertical: 8.h,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 40.w,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                color: ColorConstants.neutralLight120,
                child: TabBar(
                    onTap: (x) {
                      setState(() {
                        pageBody = x;

                      });
                    },
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide.none,
                    ),
                    tabs: [
                      for (int i = 0; i < _icons.length; i++)
                        _tabItem(
                          _icons[i],
                          isSelected: i == pageBody,
                        ),
                    ],
                    controller: _tabController),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabItem(String icon, {bool isSelected = false}) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: 14.h),
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.symmetric(vertical: 6.h,),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: ColorConstants.primaryLight10,
            ),
      child: SvgPicture.asset(
        icon,
        width: 32.w,
        height: 32.h,
        color: !isSelected
            ? ColorConstants.primaryLight10
            : ColorConstants.primaryLight110,
      ),
    );
  }


}
class BodyHome extends StatefulWidget {
  const BodyHome({super.key, this.location});
  final String? location;
  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 12.h,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).location,
                        style: TextStyleConstant.lightLight22.copyWith(
                          color: ColorConstants.neutralLight100,
                          height: 0.7,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.map,
                            width: 16.w,
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 120.w,
                            child: Text(
                              widget.location ?? 'Loading...',
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
            ),
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
                        vertical: 4.h,
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
                ),
                SizedBox(width: 12.w),
                Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.primaryLight110,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(12.w),
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      Assets.icons.filter,
                      width: 20.w,
                      height: 20.h,
                      color: ColorConstants.neutralLight10,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 12.h),
            const PageViewWidget(),
            const CategoryWidget(),
            const FlashSaleWidget(),
          ],
        ),
      ),
    );
  }
}

// bottomNavigationBar: Container(
//   height: 56.h,
//   margin: EdgeInsets.symmetric(
//     horizontal: 20.w,
//     vertical: 8.h,
//   ),
//   decoration: BoxDecoration(
//     color: ColorConstants.neutralLight120,
//     borderRadius: BorderRadius.circular(50),
//     boxShadow: const [
//       BoxShadow(
//         color: ColorConstants.neutralLight80,
//         blurRadius: 10,
//         offset: Offset(0, -2),
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment:  MainAxisAlignment.spaceBetween,
//     children: [
//       gestureDetector(SvgPicture.asset(
//         Assets.icons.home,
//         width: 24.w,
//         height: 24.h,
//         color: ColorConstants.primaryLight110,
//       ), 0, (){
//         if(pageBody!=1){
//           pageBody = 1;
//         }
//       }),
//       gestureDetector(SvgPicture.asset(
//         Assets.icons.bag,
//         width: 24.w,
//         height: 24.h,
//         color: ColorConstants.primaryLight110,
//       ), 1, (){
//         if(pageBody!=2){
//           pageBody = 2;
//         }
//       }),
//       gestureDetector(SvgPicture.asset(
//         Assets.icons.heart,
//         width: 24.w,
//         height: 24.h,
//         color: ColorConstants.primaryLight110,
//       ), 2, (){
//         if(pageBody!=3){
//           pageBody = 3;
//         }
//       }),
//       gestureDetector(SvgPicture.asset(
//         Assets.icons.message,
//         width: 24.w,
//         height: 24.h,
//         color: ColorConstants.primaryLight110,
//       ), 3, (){
//         if(pageBody!=4){
//           pageBody = 4;
//         }
//       }),
//       gestureDetector(SvgPicture.asset(
//         Assets.icons.person,
//         width: 24.w,
//         height: 24.h,
//         color: ColorConstants.primaryLight110,
//       ), 4, (){
//         if(pageBody!=5){
//           pageBody = 5;
//         }
//       }),
//     ],
//   ),
// ),
