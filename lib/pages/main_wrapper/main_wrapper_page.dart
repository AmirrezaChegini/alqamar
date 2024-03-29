import 'package:al_qamar/bloc/calender/calender_bloc.dart';
import 'package:al_qamar/bloc/calender/calender_event.dart';
import 'package:al_qamar/bloc/category/category_bloc.dart';
import 'package:al_qamar/bloc/category/category_event.dart';
import 'package:al_qamar/config/localize.dart';
import 'package:al_qamar/constants/images.dart';
import 'package:al_qamar/cubit/bottomnav_cubit.dart';
import 'package:al_qamar/pages/calender/calender_page.dart';
import 'package:al_qamar/pages/category/category_page.dart';
import 'package:al_qamar/pages/home/home_page.dart';
import 'package:al_qamar/pages/main_wrapper/widgets/bottom_navbar.dart';
import 'package:al_qamar/pages/profile/profile_page.dart';
import 'package:al_qamar/widgets/app_snackbar.dart';
import 'package:al_qamar/widgets/appbar_leading.dart';
import 'package:al_qamar/widgets/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainWrapperPage extends StatefulWidget {
  const MainWrapperPage({super.key});

  @override
  State<MainWrapperPage> createState() => _MainWrapperPageState();
}

class _MainWrapperPageState extends State<MainWrapperPage>
    with TickerProviderStateMixin {
  late final TabController _tabCtrl;
  bool exit = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(GetAllCategoryEvent());
    BlocProvider.of<BottomnavCubit>(context).changeIndex(0);
    BlocProvider.of<CalenderBloc>(context)
        .add(GetAllCalenderEvent(DateTime.now()));
    _tabCtrl = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        if (_scaffoldKey.currentState!.isDrawerOpen) {
          _scaffoldKey.currentState?.closeDrawer();
        } else {
          if (_tabCtrl.index != 0) {
            BlocProvider.of<BottomnavCubit>(context).changeIndex(0);
            _tabCtrl.animateTo(0);
          } else {
            if (exit) {
              SystemNavigator.pop();
            } else {
              exit = true;
              showMessage(
                context: context,
                content: 'exit'.localize(context),
                horizontalMargin: 10,
                verticalMargin: 0,
                isError: false,
              );
              await Future.delayed(
                const Duration(seconds: 3),
                () => exit = false,
              );
            }
          }
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomNavbar(tabController: _tabCtrl),
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: MainAppbar(
          leadingWidth: MediaQuery.sizeOf(context).width / 2,
          appbarLeading: const AppbarLeading(),
        ),
        drawer: ProfilePage(tabController: _tabCtrl),
        body: TabBarView(
          controller: _tabCtrl,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomePage(tabController: _tabCtrl),
            const CategoryPage(),
            const SizedBox(),
            Center(child: Image.asset(AppImages.comingSoon)),
            const CalenderPage(),
          ],
        ),
      ),
    );
  }
}
