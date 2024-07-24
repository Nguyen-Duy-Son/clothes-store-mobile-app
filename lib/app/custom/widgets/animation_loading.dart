import 'package:clothes_store_mobile_app/app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AnimationLoading extends StatefulWidget {
  const AnimationLoading({super.key});

  @override
  State<AnimationLoading> createState() => _AnimationLoadingState();
}

class _AnimationLoadingState extends State<AnimationLoading> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.waveDots(
            color: ColorConstants.primaryLight100,
            size: 28,
          ),
        ],
      ),
    );
  }
}
