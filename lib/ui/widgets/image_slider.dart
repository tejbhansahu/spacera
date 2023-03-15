import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spacera/core/constant/colors.dart';
import 'CachedNetworkImage.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider(
      {Key? key, required this.imageList, this.boxFit = BoxFit.fitWidth})
      : super(key: key);

  final List<String> imageList;

  final BoxFit boxFit;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentPageValue = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
            itemCount: widget.imageList.length,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            allowImplicitScrolling: true,
            onPageChanged: (int page) =>
                setState(() => currentPageValue = page),
            itemBuilder: (context, index) {
              return CachedImage(
                imageUrl: widget.imageList[index],
                fit: widget.boxFit,
                placeholderWidget: Container(
                  color: AppColors.grey.withOpacity(.4),
                  child: const Icon(
                    Icons.image_outlined,
                    size: 50,
                    color: AppColors.grey,
                  ),
                ),
              );
            }),
        pageViewDots(imageCount: widget.imageList.length)
      ],
    );
  }

  Widget pageViewDots({required int imageCount}) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Visibility(
          visible: imageCount > 1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: AnimatedSmoothIndicator(
              activeIndex: currentPageValue,
              count: imageCount,
              axisDirection: Axis.horizontal,
              effect: const ScrollingDotsEffect(
                  activeDotColor: AppColors.black,
                  dotHeight: 4,
                  dotWidth: 4,
                  spacing: 4),
            ),
          ),
        ));
  }
}
