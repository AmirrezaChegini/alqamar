import 'package:al_qamar/constants/colors.dart';
import 'package:al_qamar/constants/icons.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({
    super.key,
    required this.tabCtrl,
  });

  final TabController tabCtrl;

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<String> bottomTexts = const [
    'اعمال',
    'حساب',
    'یبحث',
    'المواضیع',
    'بیت',
  ];

  final List<String> bottomIcons = const [
    AppIcons.calender,
    AppIcons.profile,
    AppIcons.search,
    AppIcons.topics,
    AppIcons.home,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TabBar(
        controller: widget.tabCtrl,
        unselectedLabelColor: AppColors.grey,
        labelColor: AppColors.blue,
        indicatorColor: AppColors.blue,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.all(0),
        labelPadding: const EdgeInsets.all(0),
        splashBorderRadius: BorderRadius.circular(20),
        onTap: (value) {
          setState(() {});
        },
        tabs: List.generate(
          widget.tabCtrl.length,
          (index) => Tab(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  bottomIcons[index],
                  width: 30,
                  height: 30,
                  color: widget.tabCtrl.index == index
                      ? AppColors.blue
                      : AppColors.grey,
                ),
                const SizedBox(height: 4),
                Text(
                  bottomTexts[index],
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
