import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacera/core/constant/colors.dart';
import 'package:spacera/core/constant/styles.dart';
import 'package:spacera/core/models/rocket_list/rocket_response.dart';
import 'package:spacera/core/utils/images.dart';
import 'package:spacera/ui/views/rocket_detail/scroll_state_cubit.dart';
import 'package:spacera/ui/widgets/image_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetail extends StatefulWidget {
  const RocketDetail({Key? key, required this.detail}) : super(key: key);

  final RocketsResponse detail;

  @override
  State<RocketDetail> createState() => _RocketDetailState();
}

class _RocketDetailState extends State<RocketDetail> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          scrollController.position.pixels > 260) {
        BlocProvider.of<ScrollStateCubit>(context).scrollDown();
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        BlocProvider.of<ScrollStateCubit>(context).scrollUp();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var info = widget.detail;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            if (!await launchUrl(Uri.parse(info.wikipedia ?? ''))) {
              throw Exception('Could not launch ${info.wikipedia ?? ''}');
            }
          },
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(CupertinoIcons.link, size: 16),
              SizedBox(width: 10.0),
              Text("Wikipedia"),
            ],
          ),
          backgroundColor: AppColors.cardColor),
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * 0.4,
                  floating: false,
                  pinned: true,
                  backgroundColor: AppColors.black,
                  title: BlocBuilder<ScrollStateCubit, ScrollStateState>(
                    builder: (context, state) {
                      if (state is ScrollStateDown) {
                        return Image.asset(Images.spaceXLogo,
                            color: AppColors.white, height: 30);
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  centerTitle: true,
                  elevation: 0.0,
                  flexibleSpace: FlexibleSpaceBar(
                      background: ImageSlider(
                          imageList: info.flickrImages ?? [],
                          boxFit: BoxFit.fitHeight)),
                ),
              ];
            },
            body: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Text(
                              info.name ?? 'Rocket',
                              style: Styles.tsWhiteRegularX16,
                            ),
                            const Spacer(),
                            const Icon(CupertinoIcons.gear,
                                color: AppColors.white)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            cardInfo(
                                key: "Height, ft",
                                value: info.height.toString(),
                                size: size),
                            cardInfo(
                                key: "Diameter, ft",
                                value: info.diameter.toString(),
                                size: size),
                            cardInfo(
                                key: "Mass, kg",
                                value: info.mass.toString(),
                                size: size),
                            cardInfo(
                                key: "Stages",
                                value: info.stages.toString(),
                                size: size),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: headingText(
                            key: "First flight", value: info.firstFlight ?? ''),
                      ),
                      headingText(key: "Country", value: info.country ?? ''),
                      headingText(
                          key: "Cost per launch",
                          value: "💲${info.costPerLaunch}"),
                      headingText(
                          key: "Success rate",
                          value: "${info.successRatePct} %"),
                      headingText(
                          key: "Status",
                          value: info.active ?? false ? 'Active' : 'Inactive'),
                      Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            info.description ?? '',
                            style: Styles.tsGreyRegular14.copyWith(height: 1.4),
                          ))
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget headingText({required String key, required String value}) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
      child: Row(
        children: [
          Text(key, style: Styles.tsGreyRegular13),
          const Spacer(),
          Text(value, style: Styles.tsWhiteRegular13)
        ],
      ),
    );
  }

  Widget cardInfo(
      {required String key, required String value, required Size size}) {
    return Container(
      height: size.width * 0.22,
      width: size.width * 0.22,
      decoration: const BoxDecoration(
        color: AppColors.detailCardColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: Styles.tsWhiteRegular13),
          const SizedBox(height: 15.0),
          Text(key, style: Styles.tsGreyRegular11)
        ],
      )),
    );
  }
}
