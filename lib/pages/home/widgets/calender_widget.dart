import 'package:al_qamar/constants/colors.dart';
import 'package:al_qamar/constants/fontsize.dart';
import 'package:al_qamar/constants/icons.dart';
import 'package:al_qamar/cubit/bottomnav_cubit.dart';
import 'package:al_qamar/pages/home/widgets/week_calender.dart';
import 'package:al_qamar/utils/extensions/datetime.dart';
import 'package:al_qamar/utils/extensions/string.dart';
import 'package:al_qamar/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tabController.animateTo(4);
        BlocProvider.of<BottomnavCubit>(context).changeIndex(4);
      },
      child: Card(
        color: AppColors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: const EdgeInsets.all(0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '${DateTime.now().getHijriMonth()} - ${DateTime.now().getHijriYear()}'
                            .toArabic(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: Fontsize.large, height: 1.5),
                      ),
                      Text(
                        '${DateTime.now().year} ${DateTime.now().getGeregorianMonth()}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: Fontsize.large, height: 1.5),
                      ),
                    ],
                  ),
                  const Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: AppIcon(
                        icon: AppIcons.leftArrow,
                        height: 25,
                        width: 25,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: AppColors.blue,
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: WeekCalender(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
