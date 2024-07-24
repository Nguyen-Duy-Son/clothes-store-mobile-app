import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../constants/color_constants.dart';
class AnimationNextScreen extends StatefulWidget {
  const AnimationNextScreen({super.key});

  @override
  State<AnimationNextScreen> createState() => _AnimationNextScreenState();
}

class _AnimationNextScreenState extends State<AnimationNextScreen> {
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.hexagonDots(
      size: 40, color: ColorConstants.primaryLight10,
    );
  }
}
