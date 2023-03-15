import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacera/core/constant/colors.dart';
import 'package:spacera/core/constant/styles.dart';
import 'package:spacera/core/extension/extensions.dart';
import 'package:spacera/core/models/rocket_list/rocket_response.dart';
import 'package:spacera/ui/widgets/image_slider.dart';

class RocketCard extends StatefulWidget {
  const RocketCard({Key? key, required this.rocket, required this.size})
      : super(key: key);

  final RocketsResponse rocket;
  final Size size;

  @override
  State<RocketCard> createState() => _RocketCardState();
}

class _RocketCardState extends State<RocketCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          boxShadow: [
            BoxShadow(
                color: AppColors.cardColor.withAlpha(100),
                offset: const Offset(0, 2),
                blurRadius: 3,
                spreadRadius: 1)
          ],
          border: Border.all(color: AppColors.black, width: 0.2),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: AspectRatio(
                    aspectRatio: 2.35 / 1,
                    child: Stack(
                      children: [
                        ImageSlider(
                            imageList: widget.rocket.flickrImages ?? []),
                        enginesCount(
                            widget.rocket.firstStageEngines?.toString() ?? "0"),
                      ],
                    ))),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 10, right: 10, bottom: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints:
                        BoxConstraints(maxWidth: widget.size.width * 0.85),
                    child: rocketName(),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(CupertinoIcons.flag_circle_fill,
                          color: AppColors.cardTitleColor),
                      const SizedBox(width: 5.0),
                      Text(widget.rocket.country ?? '',
                          style: Styles.tsGreyRegular14),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget enginesCount(String engines) {
    return Positioned(
      bottom: 0.0,
      child: Container(
        padding: const EdgeInsets.only(top: 2, bottom: 2, left: 4, right: 8),
        margin: const EdgeInsets.only(left: 8, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: AppColors.black.withOpacity(0.7)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.rocket_launch_rounded,
              color: AppColors.cardTitleColor,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              "Engines: $engines",
              style: Styles.tsGreyRegular12,
            ),
          ],
        ),
      ),
    );
  }

  Widget rocketName() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        widget.rocket.name?.toTitleCase() ?? "",
        style: Styles.tsGreyRegularX12,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
      ),
    );
  }
}
