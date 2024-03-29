import 'package:al_qamar/bloc/auth/auth_bloc.dart';
import 'package:al_qamar/bloc/azan/azan_bloc.dart';
import 'package:al_qamar/bloc/calender/calender_bloc.dart';
import 'package:al_qamar/bloc/category/category_bloc.dart';
import 'package:al_qamar/bloc/home/home_bloc.dart';
import 'package:al_qamar/bloc/live/live_bloc.dart';
import 'package:al_qamar/bloc/news/news_bloc.dart';
import 'package:al_qamar/bloc/other_article/other_article_bloc.dart';
import 'package:al_qamar/bloc/program/program_bloc.dart';
import 'package:al_qamar/bloc/search/search_bloc.dart';
import 'package:al_qamar/bloc/user/user_bloc.dart';
import 'package:al_qamar/config/theme.dart';
import 'package:al_qamar/cubit/article_cubit.dart';
import 'package:al_qamar/cubit/audio_cubit.dart';
import 'package:al_qamar/cubit/bottomnav_cubit.dart';
import 'package:al_qamar/cubit/btn_verify_cubit.dart';
import 'package:al_qamar/cubit/calender_cubit.dart';
import 'package:al_qamar/cubit/hide_fabe_cubit.dart';
import 'package:al_qamar/cubit/live_cubit.dart';
import 'package:al_qamar/cubit/localize_cubit.dart';
import 'package:al_qamar/cubit/password_cubit.dart';
import 'package:al_qamar/cubit/pdf_cubit.dart';
import 'package:al_qamar/cubit/timer_cubit.dart';
import 'package:al_qamar/di.dart';
import 'package:al_qamar/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:just_audio_background/just_audio_background.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initLocator();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
    androidStopForegroundOnPause: true,
    androidShowNotificationBadge: false,
  );

  initializeDateFormatting().then((value) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator.get<LocalizeCubit>()),
        BlocProvider(create: (context) => locator.get<BottomnavCubit>()),
        BlocProvider(create: (context) => locator.get<TimerCubit>()),
        BlocProvider(create: (context) => locator.get<BtnVerifyCubit>()),
        BlocProvider(create: (context) => locator.get<ArticleCubit>()),
        BlocProvider(create: (context) => locator.get<AudioCubit>()),
        BlocProvider(create: (context) => locator.get<PdfCubit>()),
        BlocProvider(create: (context) => locator.get<PasswordCubit>()),
        BlocProvider(create: (context) => locator.get<LiveCubit>()),
        BlocProvider(create: (context) => locator.get<CalenderCubit>()),
        BlocProvider(create: (context) => locator.get<HideFabeCubit>()),
        BlocProvider(create: (context) => locator.get<AzanBloc>()),
        BlocProvider(create: (context) => locator.get<AuthBloc>()),
        BlocProvider(create: (context) => locator.get<UserBloc>()),
        BlocProvider(create: (context) => locator.get<HomeBloc>()),
        BlocProvider(create: (context) => locator.get<NewsBloc>()),
        BlocProvider(create: (context) => locator.get<SearchBloc>()),
        BlocProvider(create: (context) => locator.get<CalenderBloc>()),
        BlocProvider(create: (context) => locator.get<LiveBloc>()),
        BlocProvider(create: (context) => locator.get<OtherArticleBloc>()),
        BlocProvider(create: (context) => locator.get<CategoryBloc>()),
        BlocProvider(create: (context) => locator.get<ProgramBloc>()),
      ],
      child: BlocBuilder<LocalizeCubit, String>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          locale: const Locale('ar'),
          home: const SplashPage(),
        ),
      ),
    );
  }
}
