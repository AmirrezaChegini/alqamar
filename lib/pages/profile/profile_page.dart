import 'package:al_qamar/bloc/azan/azan_bloc.dart';
import 'package:al_qamar/bloc/azan/azan_state.dart';
import 'package:al_qamar/bloc/user/user_bloc.dart';
import 'package:al_qamar/bloc/user/user_state.dart';
import 'package:al_qamar/config/localize.dart';
import 'package:al_qamar/constants/api.dart';
import 'package:al_qamar/constants/colors.dart';
import 'package:al_qamar/constants/icons.dart';
import 'package:al_qamar/pages/bookmark/bookmark_page.dart';
import 'package:al_qamar/pages/live/live_page.dart';
import 'package:al_qamar/pages/profile/widgets/header_profile.dart';
import 'package:al_qamar/pages/profile/widgets/item_widget.dart';
import 'package:al_qamar/pages/profile/widgets/logout_dialog.dart';
import 'package:al_qamar/pages/profile/widgets/mini_calender.dart';
import 'package:al_qamar/pages/profile/widgets/privacy_policy.dart';
import 'package:al_qamar/pages/programs/programs_page.dart';
import 'package:al_qamar/utils/url_launcher.dart';
import 'package:al_qamar/widgets/anim/page_route.dart';
import 'package:al_qamar/widgets/app_icon.dart';
import 'package:al_qamar/widgets/azan_widget.dart';
import 'package:al_qamar/widgets/icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: HeaderProfile(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Row(
                      children: [
                        Expanded(
                          child: ItemWidget(
                            onTap: () => Navigator.push(
                              context,
                              pageRoute(child: const LivePage()),
                            ),
                            image: AppIcons.play,
                            color: AppColors.red.withOpacity(0.4),
                            title: 'live'.localize(context),
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ItemWidget(
                                        onTap: () => Navigator.push(
                                          context,
                                          pageRoute(
                                              child: const ProgramsPage()),
                                        ),
                                        image: AppIcons.live,
                                        color: AppColors.grey600,
                                        title: 'programs'.localize(context),
                                      ),
                                    ),
                                    Expanded(
                                      child: ItemWidget(
                                        onTap: () => Navigator.push(
                                          context,
                                          pageRoute(
                                              child: const BookmarkPage()),
                                        ),
                                        image: AppIcons.bookmark,
                                        color: AppColors.grey600,
                                        title: 'favorite'.localize(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ItemWidget(
                                        onTap: () async =>
                                            UrlLauncher.launch(Api.baseUrlSite),
                                        image: AppIcons.aboutUs,
                                        color: AppColors.grey600,
                                        title: 'aboutUs'.localize(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<AzanBloc, AzanState>(
                    builder: (context, state) {
                      if (state is CompletedAzanState) {
                        return Column(
                          children: List.generate(
                            state.azanTimeList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(5),
                              child: AzanWidget(
                                city: index == 0
                                    ? 'najaf'.localize(context)
                                    : 'london'.localize(context),
                                azanTime: state.azanTimeList[index],
                                backgroundColor: AppColors.grey200,
                              ),
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        MiniCalender(),
                        SizedBox(width: 10),
                        Expanded(
                          child: PrivacyPolicy(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is CompleteUserState) {
                  return Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Tooltip(
                      message: 'logout'.localize(context),
                      child: IconBtn(
                        onTap: () => showAdaptiveDialog(
                          context: context,
                          builder: (context) => const LogoutDialog(),
                        ),
                        padding: 10,
                        child: const AppIcon(
                          icon: AppIcons.logout,
                          width: 30,
                          height: 30,
                          color: AppColors.red,
                          matchDirection: true,
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
