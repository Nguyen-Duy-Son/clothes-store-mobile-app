import 'package:clothes_store_mobile_app/app/cubits/home/home_cubit.dart';
import 'package:clothes_store_mobile_app/app/cubits/home/home_state.dart';
import 'package:clothes_store_mobile_app/app/views/home/components/category/detail_category_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../l10n/l10n.dart';

class CategoryWidget  extends StatefulWidget {
  const CategoryWidget ({super.key});

  @override
  State<CategoryWidget > createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget > {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is HomeLoaded) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).category,
                    style: TextStyleConstant.regularLight34.copyWith(
                      color: ColorConstants.neutralLight120,
                    ),
                  ),
                  Text(
                    S.of(context).seeAll,
                    style: TextStyleConstant.lightLight22.copyWith(
                      color: ColorConstants.primaryLight110,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80.h,
                child: ListView.builder(
                  itemCount: state.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(right: 12.w),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorConstants.neutralLight70,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: SvgPicture.asset(
                                category.image,
                                width: 32.w,
                                height: 32.h,
                                fit: BoxFit.cover,
                                color: ColorConstants.primaryLight110,
                              ),
                            ),
                            Text(category.name,
                              style: TextStyleConstant.lightLight24.copyWith(
                                color: ColorConstants.neutralLight120,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailCategoryWidget(category:category),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
