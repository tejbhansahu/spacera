import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacera/core/constant/colors.dart';
import 'package:spacera/core/models/rocket_list/rocket_response.dart';
import 'package:spacera/core/navigation/navigation.dart';
import 'package:spacera/core/repositories/rocket_repository/rocket_repository_impl.dart';
import 'package:spacera/core/services/connectivity/connectivity_service.dart';
import 'package:spacera/locator.dart';
import 'package:spacera/ui/widgets/app_bar.dart';
import 'package:spacera/ui/widgets/rocket_card.dart';
import 'package:spacera/ui/widgets/shimmer/shimmer_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  @override
  void initState() {
    super.initState();
    _deleteImageFromCache();
  }

  Future _deleteImageFromCache() async {
    if (await connectivityService!.isConnected) {
      await CachedNetworkImage.evictFromCache('main');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(context),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: BlocBuilder<RocketRepositoryImpl, RocketDataState>(
            builder: (context, state) {
          if (state is RocketDataLoading) {
            return const HomeShimmer();
          } else if (state is RocketDataSuccess) {
            return buildList(rocketList: state.rocketList, size: size);
          } else {
            return errorWidget(size);
          }
        }),
      ),
    );
  }

  Widget buildList(
      {required List<RocketsResponse> rocketList, required Size size}) {
    return ListView.builder(
        itemCount: rocketList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 5.0),
        itemBuilder: (BuildContext context, int index) {
          return InkResponse(
            enableFeedback: true,
            child: RocketCard(rocket: rocketList[index], size: size),
            onTap: () => Navigate.openDetailPage(
                context: context, data: rocketList[index]),
          );
        });
  }

  Widget errorWidget(Size size) {
    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 35,
          ),
          const SizedBox(
            height: 20,
          ),
          Text("Error in data loading",
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
