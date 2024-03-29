import 'package:al_qamar/constants/colors.dart';
import 'package:al_qamar/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class TxtBtn extends StatelessWidget {
  const TxtBtn({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
    required this.textDecoration,
    required this.fontSize,
    required this.iconSize,
  });

  final Function()? onTap;
  final String title;
  final String icon;
  final TextDirection textDecoration;
  final double fontSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDecoration,
      child: TextButton.icon(
        onPressed: onTap,
        icon: AppIcon(
          icon: icon,
          color: AppColors.grey,
          height: iconSize,
          width: iconSize,
          matchDirection: true,
        ),
        label: Text(
          title,
          maxLines: 1,
        ),
        style: TextButton.styleFrom(
          foregroundColor: AppColors.grey,
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: fontSize),
        ),
      ),
    );
  }
}
