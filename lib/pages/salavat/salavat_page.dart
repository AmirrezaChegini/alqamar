import 'package:al_qamar/bloc/salavat/salavat_bloc.dart';
import 'package:al_qamar/bloc/salavat/salavat_event.dart';
import 'package:al_qamar/bloc/salavat/salavat_state.dart';
import 'package:al_qamar/config/localize.dart';
import 'package:al_qamar/constants/colors.dart';
import 'package:al_qamar/constants/icons.dart';
import 'package:al_qamar/cubit/counter_cubit.dart';
import 'package:al_qamar/cubit/salavat_cubit.dart';
import 'package:al_qamar/models/salavat.dart';
import 'package:al_qamar/pages/salavat/widgets/circle_widget.dart';
import 'package:al_qamar/widgets/app_icon.dart';
import 'package:al_qamar/widgets/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalavatPage extends StatefulWidget {
  const SalavatPage({super.key});

  @override
  State<SalavatPage> createState() => _SalavatPageState();
}

class _SalavatPageState extends State<SalavatPage> {
  int salavatLength = 0;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SalavatBloc>(context).add(GetAllSalavatEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey200,
      appBar: MainAppbar(
        appbarLeading: BackButton(
          onPressed: () => Navigator.pop(context),
          color: AppColors.red,
        ),
        title: 'preyers'.localize(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                CircleWidget(
                  width: 250,
                  height: 250,
                  onTap: () =>
                      BlocProvider.of<CounterCubit>(context).increaseCounter(),
                  shadows: const [
                    BoxShadow(
                      color: AppColors.red,
                      offset: Offset(0, -10),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: AppColors.grey600,
                      offset: Offset(0, 10),
                      blurRadius: 15,
                    ),
                  ],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocBuilder<CounterCubit, int>(
                        builder: (context, state) => Text(
                          '$state',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 60),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 60,
                        color: AppColors.grey,
                      ),
                      Text(
                        'preyers'.localize(context),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                  bottom: -80,
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: CircleWidget(
                      width: 55,
                      height: 55,
                      onTap: () =>
                          BlocProvider.of<CounterCubit>(context).resetCounter(),
                      backgroundColor: AppColors.grey600,
                      shadows: const [
                        BoxShadow(
                          color: AppColors.grey600,
                          offset: Offset(5, 10),
                          blurRadius: 10,
                          spreadRadius: -4,
                        ),
                      ],
                      child: Text(
                        'reset'.localize(context),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  bottom: -150,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: CircleWidget(
                      backgroundColor: AppColors.red,
                      height: 80,
                      width: 80,
                      onTap: () {
                        int id = BlocProvider.of<SalavatCubit>(context).state;
                        if (salavatLength == 3 && id == -1) {
                        } else {
                          int number =
                              BlocProvider.of<CounterCubit>(context).index;

                          BlocProvider.of<SalavatBloc>(context)
                              .add(AddSalavatEvent(Salavat(id, number)));
                        }
                      },
                      shadows: const [
                        BoxShadow(
                          color: AppColors.grey600,
                          offset: Offset(5, 10),
                          blurRadius: 10,
                          spreadRadius: -4,
                        ),
                      ],
                      child: Text(
                        'save'.localize(context),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          BlocConsumer<SalavatBloc, SalavatState>(
            listener: (context, state) {
              if (state is CompleteSalavatState) {
                salavatLength = state.salavatList.length;
              }
            },
            builder: (context, outerState) {
              if (outerState is CompleteSalavatState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    outerState.salavatList.length,
                    (index) => Expanded(
                      child: BlocBuilder<SalavatCubit, int>(
                        builder: (context, innerState) => CircleWidget(
                          onTap: () {
                            BlocProvider.of<SalavatCubit>(context)
                                .chooseIndex(index);

                            BlocProvider.of<CounterCubit>(context).setCounter(
                                outerState.salavatList[index].numbers);
                          },
                          padding: 10,
                          shadows: const [
                            BoxShadow(
                              color: AppColors.grey600,
                              offset: Offset(5, 10),
                              blurRadius: 10,
                              spreadRadius: -4,
                            ),
                          ],
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${outerState.salavatList[index].numbers}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: index == innerState ? 26 : 20,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 1,
                                width: 30,
                                color: AppColors.grey,
                              ),
                              Text(
                                'preyers'.localize(context),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: index == innerState ? 14 : 10,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              const CircleWidget(
                                padding: 8,
                                backgroundColor: AppColors.blue,
                                shadows: [
                                  BoxShadow(
                                    color: AppColors.grey600,
                                    offset: Offset(5, 10),
                                    blurRadius: 10,
                                    spreadRadius: -4,
                                  ),
                                ],
                                child: AppIcon(
                                  icon: AppIcons.rightArrow,
                                  height: 20,
                                  width: 20,
                                  matchDirection: true,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
