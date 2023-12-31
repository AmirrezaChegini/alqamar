import 'package:al_qamar/constants/colors.dart';
import 'package:al_qamar/constants/images.dart';
import 'package:al_qamar/cubit/article_cubit.dart';
import 'package:al_qamar/models/calender.dart';
import 'package:al_qamar/pages/article/widgets/action_article.dart';
import 'package:al_qamar/pages/article/widgets/article_tabbar.dart';
import 'package:al_qamar/pages/article/widgets/audio_article_player.dart';
import 'package:al_qamar/pages/article/widgets/audio_widget.dart';
import 'package:al_qamar/pages/article/widgets/image_viewer.dart';
import 'package:al_qamar/pages/article/widgets/pdf_article_viewer.dart';
import 'package:al_qamar/pages/article/widgets/pdf_item_widget.dart';
import 'package:al_qamar/pages/article/widgets/video_article_player.dart';
import 'package:al_qamar/pages/article/widgets/youtube_article_player.dart';
import 'package:al_qamar/widgets/html_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CalenderDataPage extends StatefulWidget {
  const CalenderDataPage({
    super.key,
    required this.calender,
  });
  final Calender calender;

  @override
  State<CalenderDataPage> createState() => _CalenderDataPageState();
}

class _CalenderDataPageState extends State<CalenderDataPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 5, vsync: this);
    BlocProvider.of<ArticleCubit>(context).changeIndex(0);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey200,
      appBar: ArticleTabbar(tabController: _tabCtrl),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height / 2.9,
              child: TabBarView(
                controller: _tabCtrl,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ImageViewer(images: widget.calender.images),
                  VideoArticlePlayer(
                    video: widget.calender.videos.isNotEmpty
                        ? widget.calender.videos[0]
                        : '',
                  ),
                  const YoutubeArticlePlayer(),
                  AudioArticlePlayer(
                    audios: widget.calender.audios,
                    date: widget.calender.updateAt,
                    image: widget.calender.images.isNotEmpty
                        ? widget.calender.images[0]
                        : AppImages.error,
                    writer: '',
                  ),
                  PdfArticleViewer(pdfList: widget.calender.pdfs),
                ],
              ),
            ),
          ),
          BlocBuilder<ArticleCubit, int>(
            builder: (context, state) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: state == 3
                      ? widget.calender.audios.length
                      : state == 4
                          ? widget.calender.pdfs.length
                          : 0,
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: state == 3
                        ? AudioWidget(
                            index: index,
                            audio: widget.calender.audios[index],
                            image: widget.calender.images.isNotEmpty
                                ? widget.calender.images[0]
                                : '',
                          )
                        : state == 4
                            ? PdfItemWidget(index: index)
                            : const SizedBox(),
                  ),
                ),
              );
            },
          ),
          SliverToBoxAdapter(
            child: ActionArticle(calender: widget.calender),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.calender.title,
                maxLines: 3,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 16),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: HtmlViewer(
              content: widget.calender.content,
              renderMode: RenderMode.sliverList,
            ),
          ),
        ],
      ),
    );
  }
}
