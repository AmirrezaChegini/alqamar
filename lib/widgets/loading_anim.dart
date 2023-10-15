import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnim extends StatelessWidget {
  const LoadingAnim({super.key});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      'assets/video/animation.json',
      width: MediaQuery.sizeOf(context).width / 2,
      height: MediaQuery.sizeOf(context).height / 2,
      reverse: true,
    );
  }
}
