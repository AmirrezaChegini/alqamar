import 'package:al_qamar/bloc/article/article_bloc.dart';
import 'package:al_qamar/constants/colors.dart';
import 'package:al_qamar/constants/fontsize.dart';
import 'package:al_qamar/constants/icons.dart';
import 'package:al_qamar/di.dart';
import 'package:al_qamar/models/article.dart';
import 'package:al_qamar/pages/article/article_page.dart';
import 'package:al_qamar/utils/extensions/datetime.dart';
import 'package:al_qamar/utils/extensions/string.dart';
import 'package:al_qamar/utils/rtl_direct.dart';
import 'package:al_qamar/widgets/anim/page_route.dart';
import 'package:al_qamar/widgets/app_icon.dart';
import 'package:al_qamar/widgets/image_mask.dart';
import 'package:al_qamar/widgets/marqueer_title.dart';
import 'package:al_qamar/widgets/remove_bookmark_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marqueer/marqueer.dart';

class ArticleWidget extends StatefulWidget {
  const ArticleWidget({
    super.key,
    this.backgroundColor = AppColors.white,
    required this.article,
    this.onTap,
  });

  final Color backgroundColor;
  final Article article;
  final Function()? onTap;

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  final MarqueerController marqueerController = MarqueerController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        pageRoute(
          child: BlocProvider(
            create: (context) => ArticleBloc(locator.get()),
            child: ArticlePage(articleID: widget.article.id),
          ),
        ),
      ),
      onLongPress: () async {
        if (marqueerController.isAnimating) {
          marqueerController.stop();
        } else {
          marqueerController.start();
        }
      },
      child: Card(
        color: AppColors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: const EdgeInsets.all(0),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 7,
          padding: CheckDirect.isRTL(context)
              ? const EdgeInsets.only(left: 10)
              : const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.backgroundColor,
          ),
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  MaskImage(
                    imageUrl: widget.article.images.isNotEmpty
                        ? widget.article.images[0]
                        : '',
                  ),
                  Visibility(
                    visible: widget.onTap != null,
                    child: Positioned.directional(
                      textDirection: CheckDirect.isRTL(context)
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      top: 3,
                      start: 3,
                      child: RemoveBookmarkBtn(ontap: widget.onTap),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      child: MarqueerTitle(
                        marqueerController: marqueerController,
                        title: widget.article.title,
                      ),
                    ),
                    Text(
                      widget.article.content.htmlToString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: Fontsize.medium, height: 1),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        const AppIcon(
                          icon: AppIcons.calender,
                          width: 10,
                          height: 10,
                          color: AppColors.grey,
                        ),
                        Text(
                          '  ${widget.article.updated.getFormatDate()}'
                              .toArabic(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: Fontsize.medium),
                        ),
                        const Spacer(),
                        const AppIcon(
                          icon: AppIcons.pen,
                          width: 10,
                          height: 10,
                          color: AppColors.grey,
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(
                            ' ${widget.article.writer.name}',
                            softWrap: false,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: Fontsize.medium,
                                ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
