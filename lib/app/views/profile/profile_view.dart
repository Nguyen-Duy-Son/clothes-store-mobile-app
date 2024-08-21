import 'package:clothes_store_mobile_app/app/cubits/language/language_cubit.dart';
import 'package:clothes_store_mobile_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/assets.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_style.dart';
import '../../custom/widgets/animation_loading.dart';
import '../../custom/widgets/app_bar_widget.dart';
import '../../l10n/l10n.dart';
import '../my_order/my_order_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String dropdownValue = 'en';
  bool isSwitched = false;
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBarWidget(
        title: S.of(context).profile,
        isBackButton: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          header(),
          const SizedBox(
            height: 20,
          ),
          buildItem(S.of(context).yourProfile, Assets.icons.profile, () {}),
          buildItem(S.of(context).paymentMethods, Assets.icons.payment, () {}),
          buildItem(S.of(context).myOrders, Assets.icons.order, navigateToMyOrder),
          buildItem(S.of(context).settings, Assets.icons.setting, () {}),
          buildItem(S.of(context).helpCenter, Assets.icons.help, () {}),
          buildItem(S.of(context).privacyPolicy, Assets.icons.privacy, navigateToPrivacyPolicy),
          buildItem(
              S.of(context).transferLanguage, Assets.icons.language, () {},
              transfer: true),
          buildItem(S.of(context).logout, Assets.icons.logout, () {}),
        ],
      ),
    ));
  }

  Widget header() {
    return Center(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/avatar.jpg',
                  width: 120.w,
                  height: 120.w,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.primaryDark70,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: ColorConstants.neutralLight10,
                      width: 3.w,
                    ),
                  ),
                  padding: EdgeInsets.all(5.w),
                  child: SvgPicture.asset(
                    Assets.icons.pen,
                    color: ColorConstants.neutralLight10,
                  ),
                ),
              )
            ],
          ),
          Text(
            'Sơn Nguyễn',
            style: TextStyleConstant.lightLight30.copyWith(
              color: ColorConstants.neutralLight120,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(String title, String icon, VoidCallback onTap,
      {bool? transfer}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    color: ColorConstants.primaryDark70,
                    width: 20.w,
                    height: 20.w,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyleConstant.lightLight26.copyWith(
                      color: ColorConstants.primaryDark70,
                    ),
                  ),
                ],
              ),
              if (transfer == true)
                Switch(
                  value: _value,
                  onChanged: (value) => setState(() {
                    _value = value;
                    onChangeLanguage(value);
                  }),
                  activeTrackColor: ColorConstants.primaryLight50,
                  activeColor: ColorConstants.primaryDark70,
                  inactiveThumbColor: ColorConstants.accentRed,
                )
              else
                GestureDetector(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      Assets.icons.right,
                      color: ColorConstants.primaryDark70,
                      width: 20.w,
                      height: 20.w,
                    ),
                  ),
                  onTap: onTap,
                ),
            ],
          ),
          const Divider(
            color: ColorConstants.neutralLight70,
            thickness: 1,
          )
        ],
      ),
    );
  }
  void onChangeLanguage(bool value) async{
    if (value == true) {
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
      context.read<LanguageCubit>().changeLocale(const Locale('en'));
    } else {
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
      context.read<LanguageCubit>().changeLocale(const Locale('vi'));
    }
  }
  void navigateToPrivacyPolicy() {
    Navigator.of(context).pushNamed(AppRoutes.PRIVACYPOLICY);
  }
  void navigateToMyOrder() {
    Navigator.of(context).pushNamed(AppRoutes.MYORDER);
  }
}

