import 'package:al_qamar/constants/colors.dart';
import 'package:al_qamar/pages/article/image_page.dart';
import 'package:al_qamar/widgets/anim/page_route.dart';
import 'package:al_qamar/widgets/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    super.key,
    required this.images,
  });
  final List<dynamic> images;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer>
    with AutomaticKeepAliveClientMixin {
  final PageController _pageCtrl = PageController();

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          itemCount: widget.images.isNotEmpty ? widget.images.length : 1,
          controller: _pageCtrl,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  pageRoute(
                    child: ImagePage(
                      images: widget.images,
                      index: index,
                    ),
                  ),
                ),
                child: CacheImage(
                  imageUrl:
                      widget.images.isNotEmpty ? widget.images[index] : '',
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          child: SmoothPageIndicator(
            controller: _pageCtrl,
            count: widget.images.isNotEmpty ? widget.images.length : 1,
            effect: const ExpandingDotsEffect(
              dotColor: AppColors.grey,
              activeDotColor: AppColors.white,
              dotHeight: 6,
              dotWidth: 6,
              expansionFactor: 5,
              spacing: 6,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
