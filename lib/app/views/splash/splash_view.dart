import 'package:clothes_store_mobile_app/app/datasource/local/storage.dart';
import 'package:clothes_store_mobile_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupAsyncInitState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  Future<void> setupAsyncInitState() async {
    bool? isFirstTime = await Storage.getIsFirstTime();
    if (isFirstTime == true) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGNIN, (route) => false);
      });
    }
    else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.WELCOME, (route) => false);
      });
      Storage.setIsFirstTime(true);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  Assets.images.logoShop,
                  width: 36.w,
                  height: 36.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Fashion Store',
                style: TextStyle(
                  fontSize: 22.w,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
